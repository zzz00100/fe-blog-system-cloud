package com.bloducspauter.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bloducspauter.bean.Blog;
import com.bloducspauter.bean.Field;
import com.bloducspauter.bean.Tag;
import com.bloducspauter.bean.User;
import com.bloducspauter.service.BlogService;
import com.bloducspauter.service.FieldService;
import com.bloducspauter.service.UserService;
import com.bloducspauter.utils.GetRequestJson;
import com.bloducspauter.utils.IsValidUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("fe-blog")
@Slf4j
public class BlogController {
    @Autowired
    private BlogService blogService;

    @Autowired
    private FieldService fieldService;

    @Autowired
    private UserService userService;

    private JSONObject json = new JSONObject();

    @RequestMapping("FieldfindAllblog")
    public Map<String, Object> findAllBlogsField(HttpServletRequest req, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        String fieldname = req.getParameter("fieldname");
            int Userid = new IsValidUtil().getUserId(req,session);
            int page = Integer.parseInt(req.getParameter("page"));
            int size = Integer.parseInt(req.getParameter("size"));
            List<Blog> blogs = null;
        try {
            if (fieldname.equals("all")) {
                blogs = blogService.selectByBlogLimit(Userid, page, size);
            } else {
                blogs = fieldService.selectBlogbyField(fieldService.findField(fieldname), Userid, page, size);
            }
            for (Blog blog : blogs) {
                blog.setContent(null);
            }
            map.put("code", 200);
            map.put("msg", "查找成功");
            map.put("data", blogs);
        } catch (Exception e) {
           e.printStackTrace();
            map.put("code", 500);
            map.put("msg", e.getCause());
        }
        return map;
    }

    @RequestMapping("FieldFindBlog")
    public Map<String, Object> findFieldByBlog(HttpServletRequest req, HttpSession session) {
        String fieldid = req.getParameter("fieldid");
        String blogtitle = req.getParameter("blogtitle");
        Map<String, Object> map = new HashMap<>();
        try {
            int Userid = new IsValidUtil().getUserId(req,session);
            int page = Integer.parseInt(req.getParameter("page"));
            int size = Integer.parseInt(req.getParameter("size"));
            List<Blog> blog = null;
            log.info("fieldid:" + fieldid);
            if (fieldid.equals("all")) {
                blog = blogService.fuzzyQuery(Userid, blogtitle, page, size);
            } else {
                blog = fieldService.selectBlogbytitle(Integer.parseInt(fieldid), Userid, blogtitle, page, size);
            }

            for (Blog blog1 : blog) {
                blog1.setContent(null);
            }
            map.put("code", 200);
            map.put("msg", "查找成功");
            map.put("data", blog);
        } catch (Exception e) {
            log.error(e.getMessage());
            map.put("code", 500);
            map.put("msg", e.getCause());
        }
        return map;
    }

    @RequestMapping("TagFindblog")
    public Map<String, Object> findByBlog(HttpServletRequest req) {
        Map<String, Object> Resultmap = new HashMap<>();
        String tagname = req.getParameter("tagname");
        try {
            List<Blog> selectblogbytag = blogService.selectblogbytag(tagname);
            List<Map<String, Object>> mapList = new ArrayList<>();
            for (Blog blog : selectblogbytag) {
                Map<String, Object> map = new HashMap<>();
                map.put("blogid", blog.getBlogId());
                map.put("title", blog.getTitle());
                mapList.add(map);
            }
            Resultmap.put("code", 200);
            Resultmap.put("msg", "查找成功");
            Resultmap.put("data", mapList);

        } catch (Exception e) {
            log.error(e.getMessage());
            Resultmap.put("code", 500);
            Resultmap.put("msg", "系统出错了");
            Resultmap.put("cause", e.getCause());
        }
        return Resultmap;
    }

    /**
     * 获取Blog对象
     */
    private Blog accessBlog(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        User user = (User) session.getAttribute("user");
        json = GetRequestJson.getRequestJsonObject(request);
        String blog_id = json.getString("blogId");
        String title = json.getString("title");
        String content = json.getString("content");
        String description = json.getString("description");
        String type = json.getString("type");
        String field = json.getString("field");
        Field field1 = fieldService.selectByField(field);
        int userId = Integer.parseInt(user.getUserId());
        String author = user.getAccount();
        Blog blog = new Blog();
        if (blog_id != null) {
            blog.setBlogId(Integer.parseInt(blog_id));
        }
        blog.setTitle(title);
        blog.setContent(content);
        blog.setDescription(description);
        blog.setType(type);
        blog.setFieldId(field1.getFieldId());
        blog.setUserId(userId);
        blog.setAuthor(author);
        return blog;
    }

    /**
     * 循环插入tags
     *
     * @param blog
     * @return
     */
    private boolean insertTags(Blog blog) {
        JSONArray tag = json.getJSONArray("tag");
        List<Tag> blogTag = null;
        boolean tagResult = false;
        ArrayList<String> tags = new ArrayList<>();
        for (Object o : tag) {
            tags.add((String) o);
        }
        //循环往tag_relation表插入数据
        blogTag = blogService.selectByTag(tags);
        for (Tag item : blogTag) {
            tagResult = blogService.addRelation(blog.getBlogId(), item.getTagId());
        }
        return tagResult;
    }

    /**
     * 获取也页面记录，用户作分页查询参数
     * @param request
     * @return
     */
    private List<Integer> getPageInfo(HttpServletRequest request) {
        List<Integer> list = new ArrayList<>();
        int page = Integer.parseInt(request.getParameter("page"));
        int size = Integer.parseInt(request.getParameter("size"));
        list.add(page);
        list.add(size);
        return list;
    }

    @RequestMapping("SelectUserServlet")
    public Map<String, Object> getLoginUser(HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        //获取登录的user对象，如果没有用会话对象，返回null
        User user = (User) session.getAttribute("user");
        if (user == null) {
            map.put("code", 404);
            map.put("msg", "没有登录,请登录");
            return map;
        }
        User dataSourceUser = userService.getInfo(user.getAccount());
        if (dataSourceUser == null) {
            map.put("code", 500);
            map.put("msg", "登录失效，请重新登录");
            session.removeAttribute("user");
            return map;
        }
        //更新session
        dataSourceUser.setPassword("想看密码？怎么可能会给你看😜");
        map.put("code", 200);
        map.put("data", dataSourceUser);
        session.setAttribute("user", dataSourceUser);
        return map;
    }

    private Map<String, Object> allMap(List<Blog> blogs) {
        Map<String, Object> allMap = new HashMap<>();
        for (Blog blog : blogs) {
            HashMap<String, Object> map = new HashMap<>(3);
            map.put("blog", blog);
            List<Tag> taglist = blogService.selectTagsByBlog(blog.getBlogId());
            map.put("tag", taglist);
            String field = fieldService.SelectFieldNameById(blog.getFieldId());
            map.put("field", field);
            allMap.put("blogInfo" + blog.getBlogId(), map);
        }
        return allMap;
    }

    @RequestMapping("SelectDeletedBlog")
    public Map<String, Object> selectDelBlog(HttpServletRequest request, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            map.put("code", 404);
            map.put("msg", "未登录");
        }
        try {
            int page = getPageInfo(request).get(0);
            int size = getPageInfo(request).get(1);
            List<Blog> blogs;
            int userId = Integer.parseInt(user.getUserId());
            blogs = blogService.selectDeletedBlog(userId, page, size);
            Map<String, Object> allMap = allMap(blogs);
            map.put("code", 200);
            map.put("data", allMap);
            map.put("msg", "获取博客列表成功");
        } catch (Exception e) {
            log.error(e.getMessage());
            map.put("code", 500);
            map.put("msg", e.getCause());
        }
        return map;
    }

    @RequestMapping("SelectLimitBlogController")
    public Map<String, Object> selectLimitedBlog(HttpServletRequest request,HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        try {
            int page = getPageInfo(request).get(0);
            int size = getPageInfo(request).get(1);
            int userId = new IsValidUtil().getUserId(request,session);
            List<Blog> blogs;
            blogs = blogService.selectByBlogLimit(userId, page, size);
            Map<String, Object> allMap = allMap(blogs);
            map.put("code", 200);
            map.put("msg", "获取博客列表成功");
            map.put("data", allMap);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("code", 500);
            map.put("msg", e.getCause());
        }
        return map;
    }

    @RequestMapping("AddBlogController")
    public Map<String, Object> addBlog(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        Map<String, Object> resultMap = new HashMap<>();
        Blog blog = accessBlog(request, response, session);
        boolean addBlog = blogService.addBlog(blog);
        boolean tagResult = insertTags(blog);
        //查询博客的所有标签
        List<Tag> taglist = blogService.selectTagsByBlog(blog.getBlogId());
        //查询刚插入的博客
        Blog newBlog = blogService.selectInBlog(blog.getBlogId());
        HashMap<String, Object> map = new HashMap<String, Object>(2);

        map.put("blog", newBlog);
        map.put("tags", taglist);
        if (addBlog && tagResult) {
            resultMap.put("code", 200);
            resultMap.put("msg", "发布成功");
            resultMap.put("data", map);
        } else if (!tagResult) {
            resultMap.put("code", 500);
            resultMap.put("msg", "标签库不存在这样的标签");
        } else {
            resultMap.put("code", 500);
            resultMap.put("msg", "原因未知！接收错误");
        }
        return resultMap;
    }

    @RequestMapping("AllBlogCountServlet")
    public Map<String, Object> allBlogs() {
        Map<String, Object> map = new HashMap<>();
        try {
            int count = blogService.selectBlogCount();
            if (count > 0) {
                map.put("code", 200);
                map.put("data", count);
            } else {
                map.put("code", 500);
                map.put("msg", "未知错误");
            }
        } catch (Exception e) {
            log.error(e.getMessage());
            map.put("code", 500);
            map.put("msg", e.getCause());
        }
        return map;
    }

    @RequestMapping("DeleteBlogController")
    public Map<String, Object> delBlog(HttpServletRequest request) throws IOException {
        Map<String, Object> map = new HashMap<>();
        JSONObject json = GetRequestJson.getRequestJsonObject(request);
        int blogId = json.getIntValue("blogId");
        Blog blog = new Blog();
        blog.setBlogId(blogId);
        try {
            blogService.deleteBlog(blogId);
            //删除博客对应的索引标签
            blogService.deleteBlogTag(blogId);
            map.put("code", 200);
            map.put("msg", "操作成功");
        } catch (Exception e) {
            log.error(e.getMessage());
            map.put("code", 500);
            map.put("msg", "操作失败");
        }
        return map;
    }

    @RequestMapping("DetailBlogServlet")
    public Map<String, Object> detailBlog(HttpServletRequest request) {
        Map<String, Object> resultMap = new HashMap<>();
        String blogId = request.getParameter("blogId");
        try {
            Blog blog = blogService.selectInBlog(Integer.parseInt(blogId));
            //查询博客的所有标签
            List<Tag> taglist = blogService.selectTagsByBlog(blog.getBlogId());
            //查询博客的领域
            String field = fieldService.SelectFieldNameById(blog.getFieldId());
            HashMap<String, Object> map = new HashMap<>(2);
            map.put("blog", blog);
            map.put("tags", taglist);
            map.put("field", field);
            resultMap.put("code", 200);
            resultMap.put("data", map);
        } catch (Exception e) {
            resultMap.put("code", e.getCause());
        }
        return resultMap;
    }

    @RequestMapping("FuzzyQueryBlog")
    public Map<String, Object> fuzzyQueryBlog(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        int userId = Integer.parseInt(request.getParameter("userId"));
        String title = request.getParameter("title");
        try {
            int page = Integer.parseInt(request.getParameter("page"));
            int size = Integer.parseInt(request.getParameter("size"));
            List<Blog> blogs = blogService.fuzzyQuery(userId, title, page, size);
            map.put("code", 200);
            map.put("data", blogs);
        } catch (Exception e) {
            log.error(e.getMessage());
            map.put("code", 500);
            map.put("msg", e.getCause());
        }
        return map;
    }

    @RequestMapping("ModifyBlogController")
    public Map<String, Object> modifyBlog(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            Blog blog = accessBlog(request, response, session);
            boolean modifyBlog = blogService.modifyBlog(blog);
            //删除博客对应的所有标签
            blogService.deleteBlogTag(blog.getBlogId());
            boolean tagResult = insertTags(blog);
            //查询刚更新的博客
            Blog newBlog = blogService.selectInBlog(blog.getBlogId());
            List<Tag> taglist = blogService.selectTagsByBlog(blog.getBlogId());
            HashMap<String, Object> map = new HashMap<String, Object>(2);
            map.put("blog", newBlog);
            map.put("tags", taglist);
            map.put("field", json.getString("field"));
            if (modifyBlog && tagResult) {
                resultMap.put("code", 200);
                resultMap.put("msg", "操作成功");
                resultMap.put("data", map);
            } else {
                resultMap.put("code", 200);
                resultMap.put("msg", "操作失败");
            }
        } catch (Exception e) {
            log.error(e.getMessage());
            resultMap.put("code", 500);
            resultMap.put("msg", e.getCause());
        }
        return resultMap;
    }
}
