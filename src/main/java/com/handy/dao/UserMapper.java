package com.handy.dao;

import com.handy.domain.Role;
import com.handy.domain.User;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("select * from user where u_id = #{uId} ")
    @Results(value = {
            @Result(id = true, column = "u_id", property = "uId"),
            @Result(column = "u_password", property = "uPassword"),
            @Result(column = "u_status", property = "uStatus"),
            @Result(column = "u_id", property = "matches", many = @Many(select = "com.handy.dao.MatchesMapper.selectBymNo", fetchType = FetchType.EAGER)),
            @Result(column = "u_id", property = "borrow", many = @Many(select = "com.handy.dao.BorrowMapper.selectBybNo", fetchType = FetchType.LAZY))
    })
    User selectByPK(String uId);

    @Select("select * from user where u_id=#{uId} ")
    @Results(value = {
            @Result(id = true, column = "u_id", property = "uId"),
            @Result(column = "u_password", property = "uPassword"),
            @Result(column = "u_status", property = "uStatus"),
    })
    User selectByPKToLogin(String uId);

    @Select("select * from user where u_id = #{uId} ")
    @Results(value = {
            @Result(id = true, column = "u_id", property = "uId"),
            @Result(column = "u_password", property = "uPassword"),
            @Result(column = "u_status", property = "uStatus"),
            @Result(column = "u_id", property = "student", one = @One(select = "com.handy.dao.StudentMapper.selectBysNo", fetchType = FetchType.EAGER))
    })
    User selectByPKToS(String uId);


    @Select("SELECT r.*  FROM user u LEFT JOIN role_user ru ON u.u_id = ru.u_id LEFT JOIN role r ON ru.r_id = r.r_id where u.u_id = #{uId} ")
    @Results(value = {
            @Result(id = true, column = "r_id", property = "rId"),
            @Result(column = "r_name", property = "rName"),
            @Result(column = "r_description", property = "rDescription")
    })
    List<Role> selectrNameByuId(String uId);


    @Update("update user set u_password = #{nPassword} where u_id = #{uId}")
    void updatePW(@Param("nPassword") String nPassword, @Param("uId") String uId);

    @Select("select u_password from user where u_id =#{uId} ")
    String selectPW(String uId);

    @Select("select * from user")
    @Results(value = {
            @Result(id = true, column = "u_id", property = "uId"),
            @Result(column = "u_password", property = "uPassword"),
            @Result(column = "u_status", property = "uStatus"),
            @Result(column = "u_id", property = "student", one = @One(select = "com.handy.dao.StudentMapper.selectBysNo", fetchType = FetchType.EAGER)),
            @Result(column = "u_id", property = "teacher", one = @One(select = "com.handy.dao.TeacherMapper.selectBytNo", fetchType = FetchType.EAGER)),
            @Result(column = "u_id", property = "other", one = @One(select = "com.handy.dao.OtherMapper.selectByoNo", fetchType = FetchType.EAGER))
    })
    List<User> findAll();

    @Update("update user set u_status = #{uStatus} where u_id = #{Id}")
    void updateUstatus(@Param("Id") String Id, @Param("uStatus") Boolean uStatus);

    @Update("update user set u_status = true where u_id = #{Id} ")
    void updateUstatusOn(String Id);

    @Update("update user set u_status = false where u_id = #{Id} ")
    void updateUstatusOff(String Id);

    @Insert("insert into user(u_id, u_password, u_status)  value (#{Id},#{newPassword} ,#{Status} )")
    void insert(@Param("Id") String Id, @Param("newPassword") String newPassword, @Param("Status") Boolean Status);

    @Update("update user set u_id = #{Id} where u_id = #{oId}")
    void updatePK(@Param("Id") String Id, @Param("oId") String oId);
}