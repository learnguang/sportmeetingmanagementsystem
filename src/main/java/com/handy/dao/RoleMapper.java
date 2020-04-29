package com.handy.dao;

import com.handy.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RoleMapper {


    @Select("select * from role where r_id = #{rId}")
    @Results(value = {
            @Result(id = true, column = "r_id", property = "rId"),
            @Result(column = "r_name", property = "rName"),
            @Result(column = "r_description", property = "rDescription")
    })
    List<Role> selectByrId(Integer rId);


    @Select("select * from role")
    List<Role> findAll();

    @Select("select * from role where r_id in (select r_id from role_user where u_id = #{id} )")
    List<Role> findById(String id);

    @Select("select * from role where r_id = #{id}")
    Role findByRId(Integer id);

    @Insert("insert into role(r_name,r_description) values (#{rName} ,#{rDescription} )")
    void insert(Role role);

    @Update("update role set r_name = #{rName} , r_description = #{rDescription} where r_id = #{rId} ")
    void update(Role role);

    @Delete("delete from role where r_id =#{rid} ")
    void deleteByPK(Integer rid);
}