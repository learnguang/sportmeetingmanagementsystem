package com.handy.dao;

import com.handy.domain.Teacher;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface TeacherMapper {

    @Insert("insert into teacher(t_no, t_name, t_gender, t_identity, t_phone, t_email, t_IDcard) VALUE (#{tNo} ,#{tName} ,#{tGender} ,#{tIdentity} ,#{tPhone} ,#{tEmail} ,#{tIdcard} )")
    void insert(Teacher teacher);

    @Select("select * from teacher where t_id = #{tId} ")
    @Results(id = "teacherMap", value = {
            @Result(id = true, column = "t_id", property = "tId"),
            @Result(column = "t_no", property = "tNo"),
            @Result(column = "t_name", property = "tName"),
            @Result(column = "t_gender", property = "tGender"),
            @Result(column = "t_identity", property = "tIdentity"),
            @Result(column = "t_phone", property = "tPhone"),
            @Result(column = "t_email", property = "tEmail"),
            @Result(column = "t_IDcard", property = "tIdcard")
    })
    Teacher selectByPK(Integer tId);

    @Select("select  * from teacher ")
    @ResultMap("teacherMap")
    List<Teacher> findAll();

    @Select("select t_no from teacher where t_id = #{tId} ")
    String selecttNoByPk(Integer tId);

    @Delete("delete from teacher where t_id = #{id} ")
    void deleteByPK(Integer id);

    @Select("select * from teacher where t_no = #{uId} ")
    @ResultMap("teacherMap")
    Teacher selectBytNo(String uId);

    @Select("select t_id,t_no,t_name,t_gender,t_identity from teacher")
    @Results(value = {
            @Result(id = true, column = "t_id", property = "tId"),
            @Result(column = "t_no", property = "tNo"),
            @Result(column = "t_name", property = "tName"),
            @Result(column = "t_gender", property = "tGender"),
            @Result(column = "t_identity", property = "tIdentity"),
            @Result(column = "t_no", property = "user", one = @One(select = "com.handy.dao.UserMapper.selectByPKToLogin", fetchType = FetchType.EAGER))
    })
    List<Teacher> setting();

    @Select("select t.*,u.u_status as Status from teacher t left join user u on t.t_no = u.u_id where t_id = #{id} ")
    Teacher findById(Integer id);

    @Update("update teacher set t_name = #{tName} ,t_gender = #{tGender} ,t_identity = #{tIdentity} ,t_phone = #{tPhone} ,t_email = #{tEmail} ,t_IDcard = #{tIdcard} where t_id = #{tId} ")
    void update(Teacher teacher);

    @Select("select t_id, t_name from teacher")
    List<Teacher> findAllTeachers();

}