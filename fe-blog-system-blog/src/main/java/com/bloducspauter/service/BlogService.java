package com.bloducspauter.service;


import com.bloducspauter.bean.Blog;
import com.bloducspauter.bean.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 祁
 */

public interface BlogService {
    /**
     * 增加博客
     *
     * @time   8-9
     * @version
     * @param blog
     * @return boolean
     */
    boolean addBlog(Blog blog);

    /**
     * 删除博客
     *
     * @time   8-9
     * @version
     * @param blogId
     * @return boolean
     */
    boolean deleteBlog(int blogId);

    /**
     * 修改博客
     * @time   8-9
     * @version
     * @param blog
     * @return boolean
     */
    boolean modifyBlog(@Param("blog") Blog blog);


    /**
     * 分页查询博客管理页面
     * @param page
     * @time 2021/8/9
     * @version 1.0
     * @return
     */
    List<Blog> selectByBlogLimit(@Param("userId") int userId, @Param("page") int page, @Param("size") int size);

    /**
     * 查询含有指定标题的博客（即模糊查询）
     *
     * @param title
     * @return 查询的集合
     * @time 2021/8/9
     * @version 1.0
     */
    List<Blog> fuzzyQuery(@Param("userId") int userId, @Param("title") String title, @Param("page") int page, @Param("size") int size);

    /**
     * 随机查询几条博客(用户默认展示的博客，如果少于用户的博客少于五条，则展示全部，多于五条则随机抽取五条展示)
     *
     * @return 查询的集合
     * @time 2021/8/9
     * @version
     */
    List<Blog> randomQuery(@Param("userId") int userId, @Param("page") int page, @Param("size") int size);

    /**
     * 在tag_relation表中建立联系
     *
     * @param blogId
     * @param tagId
     * @return
     */
    boolean addRelation(int blogId, int tagId);

    /**
     * 查询博客id
     * @param title
     * @return
     */
    Blog selectByBlogId(String title);

    /**
     * 详细查询
     * @param blogId
     * @return
     */
    Blog selectInBlog(int blogId);
    /**
     * 删除某一博客的对应关系
     *
     * @param blogId
     * @return true of false
     */
    int deleteBlogTag(int blogId);

    /**
     * 根据博客id查询全部标签
     */
    List<Tag> selectTagsByBlog(int blogId);

    List<Blog> selectDeletedBlog(@Param("userId") int userId, @Param("page") int page, @Param("size") int size);

    int selectBlogCount();

    /**
     * 根据标签名查询tagId
     *
     * @param tag
     * @return
     */
    List<Tag> selectByTag(List<String> tag);

    /**
     * 查询该标签下所有的博客信息
     * @param tagname
     * @return
     */
    List<Blog> selectblogbytag(String tagname);


}
