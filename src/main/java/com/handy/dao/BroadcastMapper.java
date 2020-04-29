package com.handy.dao;

import com.handy.domain.Broadcast;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface BroadcastMapper {

    @Select("select * from broadcast")
    @Results(id = "broadcastMap", value = {
            @Result(id = true, column = "b_id", property = "bId"),
            @Result(column = "b_title", property = "bTitle"),
            @Result(column = "b_content", property = "bContent"),
            @Result(column = "b_time", property = "bTime"),
            @Result(column = "b_sportmeetingid", property = "bSportmeetingid"),
            @Result(column = "b_sportmeetingid", property = "sportmeeting", one = @One(select = "com.handy.dao.SportmeetingMapper.selectByPK2", fetchType = FetchType.EAGER))
    })
    List<Broadcast> findAll();


    @Select("select * from broadcast where b_sportmeetingid =#{id}")
    @ResultMap("broadcastMap")
    List<Broadcast> selectBybSportmeetingid(Integer id);

    @Select("SELECT s.s_id, s.s_name, ( SELECT ifnull(count( b.b_id ),0) FROM broadcast b WHERE s.s_id = b.b_sportmeetingid  ) AS total FROM sportmeeting s")
    @Results(value = {
            @Result(column = "s_id", property = "sId"),
            @Result(column = "s_name", property = "sName"),
            @Result(column = "total", property = "total")
    })
    List<Broadcast> selectBroadcastByS();

    @Delete("delete from broadcast where b_id = #{bid}")
    void deleteById(Integer bid);

    @ResultMap("broadcastMap")
    @Select("select * from broadcast where b_id = #{id}")
    Broadcast findById(Integer id);

    @Update("update broadcast set b_title = #{bTitle}, b_content = #{bContent}, b_time = #{bTimeStr}, b_sportmeetingid = #{bSportmeetingid} where b_id = #{bId}")
    void update(Broadcast broadcast);

    @Insert("insert into broadcast(b_title,b_content,b_time,b_sportmeetingid) value (#{bTitle},#{bContent} ,#{bTime} ,#{bSportmeetingid} )")
    void insert(Broadcast broadcast);

}