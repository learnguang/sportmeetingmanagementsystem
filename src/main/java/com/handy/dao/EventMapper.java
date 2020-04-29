package com.handy.dao;

import com.handy.domain.Event;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface EventMapper {

    @Select("select * from event where e_id = #{eId} ")
    @Results(id = "eventMap", value = {
            @Result(id = true, column = "e_id", property = "eId"),
            @Result(column = "e_name", property = "eName"),
            @Result(column = "e_place", property = "ePlace"),
            @Result(column = "e_gender", property = "eGender"),
            @Result(column = "e_date", property = "eDate"),
            @Result(column = "e_startTime", property = "eStarttime"),
            @Result(column = "e_endTime", property = "eEndtime"),
            @Result(column = "e_sportmeetingid", property = "eSportmeetingid"),
            @Result(column = "e_rules", property = "eRules"),
            @Result(column = "e_judgementid", property = "eJudgementid"),
            @Result(column = "e_unit", property = "eUnit"),
            @Result(column = "e_sportmeetingid", property = "sportmeeting", one = @One(select = "com.handy.dao.SportmeetingMapper.selectByPK", fetchType = FetchType.EAGER)),
    })
    Event selectByPK(Integer eId);

    @Select("select * from event")
    @Results(id = "eventMap2", value = {
            @Result(id = true, column = "e_id", property = "eId"),
            @Result(column = "e_name", property = "eName"),
            @Result(column = "e_place", property = "ePlace"),
            @Result(column = "e_gender", property = "eGender"),
            @Result(column = "e_date", property = "eDate"),
            @Result(column = "e_startTime", property = "eStarttime"),
            @Result(column = "e_endTime", property = "eEndtime"),
            @Result(column = "e_sportmeetingid", property = "eSportmeetingid"),
            @Result(column = "e_rules", property = "eRules"),
            @Result(column = "e_judgementid", property = "eJudgementid"),
            @Result(column = "e_unit", property = "eUnit"),
            @Result(column = "e_sportmeetingid", property = "sportmeeting", one = @One(select = "com.handy.dao.SportmeetingMapper.selectByPK", fetchType = FetchType.EAGER)),
            @Result(column = "e_judgementid", property = "user", one = @One(select = "com.handy.dao.UserMapper.selectByPK", fetchType = FetchType.EAGER))
    })
    List<Event> findAll();

    @Insert("insert into matches(m_no,m_eid) value (#{No},#{eId})")
    void participate(@Param("eId") Integer eId, @Param("No") String No);

    @Select("SELECT * FROM event WHERE e_sportmeetingid = ( SELECT s_id FROM sportmeeting WHERE s_status = TRUE ) AND e_gender = ( SELECT s_gender FROM student WHERE s_no = #{uId} ) AND e_id NOT IN ( SELECT m_eid FROM matches WHERE m_no = #{uId} AND m_eid IN ( SELECT e_id FROM event WHERE e_sportmeetingid = ( SELECT s_id FROM sportmeeting WHERE s_status = TRUE ))  )")
    @ResultMap("eventMap")
    List<Event> findNewAll(String uId);

    @Insert("insert into event(e_name,e_place,e_gender,e_date,e_startTime,e_endTime,e_sportmeetingid,e_rules,e_judgementid,e_unit) values (#{eName} ,#{ePlace} ,#{eGender} ,#{eDate} ,#{eStarttime} ,#{eEndtime} ,#{eSportmeetingid} ,#{eRules} ,#{eJudgementid} ,#{eUnit} ) ")
    void insert(Event event);

    @Update("update event set e_name = #{eName} ,e_place = #{ePlace} ,e_gender = #{eGender} ,e_date = #{eDate} ,e_startTime = #{eStarttime} ,e_endTime = #{eEndtime} ,e_sportmeetingid = #{eSportmeetingid} ,e_rules = #{eRules} ,e_judgementid = #{eJudgementid} ,e_unit = #{eUnit} where e_id = #{eId} ")
    void update(Event event);

    @Select("select * from event where e_id = #{id} ")
    Event findById(Integer id);

    @Delete("delete from event where e_id = #{eid} ")
    void deleteById(Integer eid);

    @Select("select * from event where e_sportmeetingid = #{sId}  ")
    @ResultMap("eventMap")
    List<Event> findBysId(Integer sId);

    @Select("select distinct e.* from event e right join matches m on e.e_id = m.m_eid where isnull(m.m_score)")
    @Results(value = {
            @Result(id = true, column = "e_id", property = "eId"),
            @Result(column = "e_name", property = "eName"),
            @Result(column = "e_gender", property = "eGender"),
            @Result(column = "e_date", property = "eDate"),
            @Result(column = "e_sportmeetingid", property = "eSportmeetingid")
    })
    List<Event> findNoScore();

    @Update("update matches m,(select m_id,dense_rank() over (order by m_score asc)as ranks from matches where m_eid = #{id} ) a set m.m_rank = a.ranks where m.m_id = a.m_id")
    void rank(Integer id);
}