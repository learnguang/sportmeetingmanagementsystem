package com.handy.dao;

import com.handy.domain.Sportmeeting;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface SportmeetingMapper {


    @Select("select * from sportmeeting where s_id = #{sId} ")
    @Results(id = "sportmeetingMap", value = {
            @Result(id = true, column = "s_id", property = "sId"),
            @Result(column = "s_name", property = "sName"),
            @Result(column = "s_theme", property = "sTheme"),
            @Result(column = "s_place", property = "sPlace"),
            @Result(column = "s_date", property = "sDate"),
            @Result(column = "s_startTime", property = "sStarttime"),
            @Result(column = "s_endTime", property = "sEndtime"),
            @Result(column = "s_description", property = "sDescription"),
            @Result(column = "s_status", property = "sStatus"),
            @Result(column = "s_id", property = "broadcast", many = @Many(select = "com.handy.dao.BroadcastMapper.selectBybSportmeetingid", fetchType = FetchType.LAZY))
    })
    Sportmeeting selectByPK(Integer sId);

    @Select("select * from sportmeeting where s_id = #{sId} ")
    @Results(id = "sportmeetingMap2", value = {
            @Result(id = true, column = "s_id", property = "sId"),
            @Result(column = "s_name", property = "sName"),
            @Result(column = "s_theme", property = "sTheme"),
            @Result(column = "s_place", property = "sPlace"),
            @Result(column = "s_date", property = "sDate"),
            @Result(column = "s_startTime", property = "sStarttime"),
            @Result(column = "s_endTime", property = "sEndtime"),
            @Result(column = "s_description", property = "sDescription"),
            @Result(column = "s_status", property = "sStatus")
    })
    Sportmeeting selectByPK2(Integer sId);

    @Select("select * from sportmeeting")
    @ResultMap("sportmeetingMap")
    List<Sportmeeting> findAll();

    @Delete("delete from sportmeeting where s_id = #{sId} ")
    void deleteByPK(Integer sId);

    @Insert("insert into sportmeeting(s_id,s_name,s_theme,s_place,s_date,s_startTime,s_endTime,s_description,s_status) value (#{sId} ,#{sName},#{sTheme} ,#{sPlace} ,#{sDate} ,#{sStarttime} ,#{sEndtime} ,#{sDescription} ,#{sStatus}  )")
    void insert(Sportmeeting sportmeeting);


    @Select("select * from sportmeeting")
    @ResultMap("sportmeetingMap2")
    List<Sportmeeting> exportExcel();

    @Update("update sportmeeting set s_status = !#{status} where s_id =#{id}")
    void updateStatus(@Param("id") Integer id, @Param("status") Boolean status);

    @Select("select * from sportmeeting where s_id = #{id} ")
    Sportmeeting findBysId(Integer id);

    @Update("update sportmeeting set s_name = #{sName} ,s_theme = #{sTheme} ,s_place = #{sPlace} ,s_date = #{sDateStr} ,s_startTime = #{sStarttimeStr} ,s_endTime = #{sEndtimeStr} ,s_description = #{sDescription} ,s_status = #{sStatus} where s_id = #{sId} ")
    Integer updateByPKSelective(Sportmeeting sportmeeting);

    @Select("select s_id, s_name from sportmeeting order by s_id desc")
    List<Sportmeeting> findAllSportmeetings();
}