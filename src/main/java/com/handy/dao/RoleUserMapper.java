package com.handy.dao;

import com.handy.domain.RoleUser;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface RoleUserMapper {

    @Insert("insert into role_user(r_id,u_id) values (#{rid},#{uid})")
    void insert(@Param("rid") Integer rid, @Param("uid") String uid);

    @Delete("delete from role_user where u_id =#{uid}")
    void delete(String uid);

    @Select("select * from role_user where r_id = #{rid} ")
    @Results(value = {
            @Result(column = "r_id", property = "rId"),
            @Result(column = "u_id", property = "uId"),
            @Result(column = "r_id", property = "role", one = @One(select = "com.handy.dao.RoleMapper.findByRId", fetchType = FetchType.EAGER)),
            @Result(column = "u_id", property = "user", one = @One(select = "com.handy.dao.UserMapper.selectByPK", fetchType = FetchType.EAGER))
    })
    List<RoleUser> findByrId(Integer rid);
}