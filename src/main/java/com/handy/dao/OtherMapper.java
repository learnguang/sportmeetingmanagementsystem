package com.handy.dao;

import com.handy.domain.Other;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface OtherMapper {

    @Select("select * from other")
    @Results(id = "otherMap", value = {
            @Result(id = true, column = "o_id", property = "oId"),
            @Result(column = "o_no", property = "oNo"),
            @Result(column = "o_name", property = "oName")
    })
    List<Other> findAll();

    @Delete("delete from other where o_id = #{id} ")
    void deleteByPK(Integer id);

    @Select("select * from other where o_no = #{uId} ")
    @ResultMap("otherMap")
    Other selectByoNo(String uId);

    @Select("select * from other")
    @Results(value = {
            @Result(id = true, column = "o_id", property = "oId"),
            @Result(column = "o_no", property = "oNo"),
            @Result(column = "o_name", property = "oName"),
            @Result(column = "o_no", property = "user", one = @One(select = "com.handy.dao.UserMapper.selectByPKToLogin", fetchType = FetchType.EAGER))
    })
    List<Other> setting();
}