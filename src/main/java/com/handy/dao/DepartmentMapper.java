package com.handy.dao;

import com.handy.domain.Department;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface DepartmentMapper {

    @Select("select * from department where d_id = #{dId} ")
    @Results(value = {
            @Result(id = true, column = "d_id", property = "dId"),
            @Result(column = "d_name", property = "dName"),
            @Result(column = "d_deanid", property = "dDeanid"),
            @Result(column = "d_deanid", property = "teacher", one = @One(select = "com.handy.dao.TeacherMapper.selectByPK", fetchType = FetchType.EAGER))
    })
    Department selectByPK(Integer dId);

    @Select("SELECT d.d_id, d.d_name,d.d_deanid, count( s_id ) AS total FROM department d LEFT JOIN classes c ON d.d_id = c.c_deptid LEFT JOIN student s ON c.c_id = s.s_classid  GROUP BY d_id")
    @Results(value = {
            @Result(id = true, column = "d_id", property = "dId"),
            @Result(column = "d_name", property = "dName"),
            @Result(column = "d_deanid", property = "dDeanid"),
            @Result(column = "total", property = "total"),
            @Result(column = "d_deanid", property = "teacher", one = @One(select = "com.handy.dao.TeacherMapper.selectByPK", fetchType = FetchType.LAZY))
    })
    List<Department> findAll();

    @Delete("delete from department where d_id = #{id} ")
    void deleteByPK(Integer id);

    @Select("select d_id,d_name from department")
    List<Department> findAllDepts();

    @Select("select * from department where d_id = #{id} ;")
    Department findById(Integer id);

    @Insert("insert into department(d_name,d_deanid) values(#{dName} ,#{dDeanid} )")
    void insert(Department department);

    @Update("update department set d_name = #{dName} ,d_deanid = #{dDeanid} where d_id = #{dId}")
    void update(Department department);
}