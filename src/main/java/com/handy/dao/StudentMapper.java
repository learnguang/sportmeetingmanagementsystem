package com.handy.dao;

import com.handy.domain.Student;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface StudentMapper {


    @Select("select s_id,s_no,s_name,s_gender,s_classid from student")
    @Results(id = "studentMap", value = {
            @Result(id = true, column = "s_id", property = "sId"),
            @Result(column = "s_no", property = "sNo"),
            @Result(column = "s_name", property = "sName"),
            @Result(column = "s_gender", property = "sGender"),
            @Result(column = "s_classid", property = "classes", one = @One(select = "com.handy.dao.ClassesMapper.selectByPK2", fetchType = FetchType.EAGER))
    })
    List<Student> findAll();

    @Select("select s_id,s_no,s_name,s_gender,s_classid from student")
    @Results(value = {
            @Result(id = true, column = "s_id", property = "sId"),
            @Result(column = "s_no", property = "sNo"),
            @Result(column = "s_name", property = "sName"),
            @Result(column = "s_gender", property = "sGender"),
            @Result(column = "s_classid", property = "sClassid"),
            @Result(column = "s_classid", property = "classes", one = @One(select = "com.handy.dao.ClassesMapper.selectByPK", fetchType = FetchType.EAGER)),
            @Result(column = "s_no", property = "user", one = @One(select = "com.handy.dao.UserMapper.selectByPKToLogin", fetchType = FetchType.EAGER))
    })
    List<Student> setting();

    @Delete("delete from user where u_id=#{sNo}")
    int deleteByPK(String sNo);

    @Select("select * from student where s_id=#{sId}")
    @Results(value = {
            @Result(id = true, column = "s_id", property = "sId"),
            @Result(column = "s_no", property = "sNo"),
            @Result(column = "s_name", property = "sName"),
            @Result(column = "s_gender", property = "sGender"),
            @Result(column = "s_classid", property = "sClassid"),
            @Result(column = "s_phone", property = "sPhone"),
            @Result(column = "s_email", property = "sEmail"),
            @Result(column = "s_IDcard", property = "sIdcard"),
            @Result(column = "s_classid", property = "classes", one = @One(select = "com.handy.dao.ClassesMapper.selectByPK", fetchType = FetchType.EAGER)),
    })
    Student selectByPK(Integer sId);


    @Select("select s_no from student where s_id= #{sId} ")
    String selectsNoBysId(Integer sId);

    @Select("select * from student where s_no =#{sNo}")
    @Results(id = "studentMap2", value = {
            @Result(id = true, column = "s_id", property = "sId"),
            @Result(column = "s_no", property = "sNo"),
            @Result(column = "s_name", property = "sName"),
            @Result(column = "s_gender", property = "sGender"),
            @Result(column = "s_classid", property = "sClassid"),
            @Result(column = "s_phone", property = "sPhone"),
            @Result(column = "s_email", property = "sEmail"),
            @Result(column = "s_IDcard", property = "sIdcard"),
            @Result(column = "s_classid", property = "classes", one = @One(select = "com.handy.dao.ClassesMapper.selectByPK", fetchType = FetchType.EAGER)),
    })
    Student selectBysNo(String sNo);

    @Select("select * from student where s_classid = #{cHeadmasterid} ")
    @ResultMap("studentMap2")
    List<Student> selectByCid(Integer cHeadmasterid);

    @Select("select * from student where s_classid = #{cId}")
    @Results(value = {
            @Result(id = true, column = "s_id", property = "sId"),
            @Result(column = "s_no", property = "sNo"),
            @Result(column = "s_name", property = "sName"),
            @Result(column = "s_gender", property = "sGender"),
            @Result(column = "s_classid", property = "sClassid"),
            @Result(column = "s_phone", property = "sPhone"),
            @Result(column = "s_email", property = "sEmail"),
            @Result(column = "s_IDcard", property = "sIdcard"),
    })
    List<Student> selectBysCid(Integer cId);

    @Select("select * from student where s_no =#{sNo}")
    @Results(value = {
            @Result(id = true, column = "s_id", property = "sId"),
            @Result(column = "s_no", property = "sNo"),
            @Result(column = "s_name", property = "sName"),
            @Result(column = "s_gender", property = "sGender"),
            @Result(column = "s_classid", property = "sClassid"),
            @Result(column = "s_phone", property = "sPhone"),
            @Result(column = "s_email", property = "sEmail"),
            @Result(column = "s_IDcard", property = "sIdcard"),
            @Result(column = "s_classid", property = "classes", one = @One(select = "com.handy.dao.ClassesMapper.selectByPK", fetchType = FetchType.EAGER)),
            @Result(column = "s_no", property = "user", one = @One(select = "com.handy.dao.UserMapper.selectByPK", fetchType = FetchType.EAGER))
    })
    Student selectBysNo2(String sNo);


    @Update("update student set s_name=#{sName}, s_gender=#{sGender},s_classid=#{sClassid} ,s_phone=#{sPhone} ,s_email=#{sEmail} ,s_IDcard=#{sIdcard} where s_id = #{sId} ")
    void update(Student student);


    @Insert("insert into student(s_no, s_name, s_gender, s_classid, s_phone, s_email, s_IDcard) values (#{sNo} ,#{sName},#{sGender} ,#{sClassid} ,#{sPhone} ,#{sEmail} ,#{sIdcard}  )")
    void insert(Student student);

    @Select("select s.*,u.u_status as Status from student s left join user u on s.s_no = u.u_id where s_id = #{id} ")
    Student findById(Integer id);

    @Select("select * from student")
    List<Student> findAllStudents();

//    @Insert("insert into student(s_no, s_name, s_gender, s_classid, s_phone, s_email, s_IDcard) values (#{})")
    void importExcel(List<Student> students);
}