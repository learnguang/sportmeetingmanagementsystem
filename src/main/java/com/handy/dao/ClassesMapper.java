package com.handy.dao;

import com.handy.domain.Classes;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface ClassesMapper {


    @Select("select c_id,c_name,c_headmasterid,c_major,c_deptid from classes where c_id = #{id} ")
    @Results(value = {
            @Result(id = true, column = "c_id", property = "cId"),
            @Result(column = "c_name", property = "cName"),
            @Result(column = "c_major", property = "cMajor"),
            @Result(column = "c_headmasterid", property = "teacher", one = @One(select = "com.handy.dao.TeacherMapper.selectByPK", fetchType = FetchType.EAGER)),
            @Result(column = "c_deptid", property = "department", one = @One(select = "com.handy.dao.DepartmentMapper.selectByPK", fetchType = FetchType.EAGER))
    })
    Classes selectByPK(Integer id);

    @Select("select c_id,c_name from classes where c_id=#{cId} ")
    @Results(value = {
            @Result(id = true, column = "c_id", property = "cId"),
            @Result(column = "c_name", property = "cName"),
    })
    Classes selectByPK2(Integer cId);

    @Select("select * from classes")
    @Results(id = "classMap", value = {
            @Result(id = true, column = "c_id", property = "cId"),
            @Result(column = "c_name", property = "cName"),
            @Result(column = "c_headmasterid", property = "cHeadmasterid"),
            @Result(column = "c_major", property = "cMajor"),
            @Result(column = "c_deptid", property = "cDeptid"),
            @Result(column = "c_headmasterid", property = "teacher", one = @One(select = "com.handy.dao.TeacherMapper.selectByPK", fetchType = FetchType.LAZY)),
            @Result(column = "c_deptid", property = "department", one = @One(select = "com.handy.dao.DepartmentMapper.selectByPK", fetchType = FetchType.LAZY))
    })
    List<Classes> findAll2();

    @Select("select c_id from classes where c_headmasterid = #{tId} ")
    Integer selectByHid(Integer tId);

    @Select("select c.*,(select ifnull(count(s_id),0)from student s where s.s_classid = c.c_id)as total from classes c where c_deptid = #{id}")
    @Results(value = {
            @Result(id = true, column = "c_id", property = "cId"),
            @Result(column = "c_name", property = "cName"),
            @Result(column = "c_headmasterid", property = "cHeadmasterid"),
            @Result(column = "c_major", property = "cMajor"),
            @Result(column = "c_deptid", property = "cDeptid"),
            @Result(column = "total", property = "total"),
            @Result(column = "c_headmasterid", property = "teacher", one = @One(select = "com.handy.dao.TeacherMapper.selectByPK", fetchType = FetchType.LAZY)),
            @Result(column = "c_deptid", property = "department", one = @One(select = "com.handy.dao.DepartmentMapper.selectByPK", fetchType = FetchType.LAZY))

    })
    List<Classes> selectByCdid(Integer id);

    @Select("select c.*,(select ifnull(count(s_id),0)from student s where s.s_classid = c.c_id)as total from classes c")
    @Results(value = {
            @Result(id = true, column = "c_id", property = "cId"),
            @Result(column = "c_name", property = "cName"),
            @Result(column = "c_headmasterid", property = "cHeadmasterid"),
            @Result(column = "c_major", property = "cMajor"),
            @Result(column = "c_deptid", property = "cDeptid"),
            @Result(column = "total", property = "total"),
            @Result(column = "c_headmasterid", property = "teacher", one = @One(select = "com.handy.dao.TeacherMapper.selectByPK", fetchType = FetchType.LAZY)),
            @Result(column = "c_deptid", property = "department", one = @One(select = "com.handy.dao.DepartmentMapper.selectByPK", fetchType = FetchType.LAZY))

    })
    List<Classes> findAll();

    @Delete("delete from classes where c_id = #{id} ")
    void deleteByPK(Integer id);

    @Select("select c_id , c_name from classes")
    List<Classes> findAllClasses();

    @Select("select * from classes where c_id = #{id}")
    Classes findById(Integer id);

    @Insert("insert into classes(c_name,c_headmasterid,c_major,c_deptid) values (#{cName} ,#{cHeadmasterid} ,#{cMajor} ,#{cDeptid} )")
    void insert(Classes classes);

    @Update("update classes set c_name = #{cName}, c_headmasterid = #{cHeadmasterid}, c_major = #{cMajor}, c_deptid = #{cDeptid}  where c_id = #{cId}")
    void update(Classes classes);

}