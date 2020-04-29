package com.handy.dao;

import com.handy.domain.Feedback;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface FeedbackMapper {

    @Insert("insert into feedback(name,email,feedback,time) values (#{name},#{email},#{feedback},now())")
    void insert(@Param("name") String name, @Param("email") String email, @Param("feedback") String feedback);

    @Select("select * from feedback")
    @Results(value = {
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "name", column = "name"),
            @Result(property = "email", column = "email"),
            @Result(property = "feedback", column = "feedback"),
            @Result(property = "time", column = "time")
    })
    List<Feedback> findAll();

    @Delete("delete from feedback where id = #{fid} ")
    void deleteById(Integer fid);
}