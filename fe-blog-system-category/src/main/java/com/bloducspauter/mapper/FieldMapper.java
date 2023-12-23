package com.bloducspauter.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.bloducspauter.bean.Blog;
import com.bloducspauter.bean.Field;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface FieldMapper extends BaseMapper<Field> {

    List<Blog> selectBlogbyField(@Param("Fieldid") int Fieldid, @Param("user_id") int user_id, @Param("page") int page, @Param("size") int size);

    /**
     * 根据fieldid和blogtitle查询blog
     * @param Fieldid
     * @param blogtitle
     * @return
     */
    List<Blog> selectBlogbytitle(int Fieldid, int user_id, String blogtitle, @Param("page") int page, @Param("size") int size);
}
