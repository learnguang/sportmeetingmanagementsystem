package com.handy.dao;

import com.handy.domain.Matches;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface MatchesMapper {


    @Select("select * from matches where m_no = #{mNo} ")
    @Results(id = "matchesMap2", value = {
            @Result(id = true, column = "m_id", property = "mId"),
            @Result(column = "m_no", property = "mNo"),
            @Result(column = "m_eid", property = "mEid"),
            @Result(column = "m_sort", property = "mSort"),
            @Result(column = "m_score", property = "mScore"),
            @Result(column = "m_rank", property = "mRank"),
            @Result(column = "m_eid", property = "event", one = @One(select = "com.handy.dao.EventMapper.selectByPK", fetchType = FetchType.EAGER)),
    })
    List<Matches> selectBymNo(String mNo);

    @Select("select * from matches where m_id = #{mId}")
    @Results(id = "matchesMap", value = {
            @Result(id = true, column = "m_id", property = "mId"),
            @Result(column = "m_no", property = "mNo"),
            @Result(column = "m_eid", property = "mEid"),
            @Result(column = "m_sort", property = "mSort"),
            @Result(column = "m_score", property = "mScore"),
            @Result(column = "m_rank", property = "mRank"),
            @Result(column = "m_eid", property = "event", one = @One(select = "com.handy.dao.EventMapper.selectByPK", fetchType = FetchType.EAGER)),
            @Result(column = "m_no", property = "user", one = @One(select = "com.handy.dao.UserMapper.selectByPKToS", fetchType = FetchType.LAZY))
    })
    Matches selectByPK(Integer mId);


    @Select("select * from matches")
    @ResultMap("matchesMap")
    List<Matches> findAll();

    @Select("select * from matches where m_eid = #{eId} order by m_rank")
    @Results(value = {
            @Result(id = true, column = "m_id", property = "mId"),
            @Result(column = "m_no", property = "mNo"),
            @Result(column = "m_eid", property = "mEid"),
            @Result(column = "m_sort", property = "mSort"),
            @Result(column = "m_score", property = "mScore"),
            @Result(column = "m_rank", property = "mRank"),
            @Result(column = "m_no", property = "user", one = @One(select = "com.handy.dao.UserMapper.selectByPKToS", fetchType = FetchType.LAZY)),
            @Result(column = "m_eid", property = "event", one = @One(select = "com.handy.dao.EventMapper.selectByPK", fetchType = FetchType.EAGER)),
    })
    List<Matches> selectBymEid(Integer eId);

    @Select("SELECT *  FROM matches  WHERE m_no = #{uId} AND m_eid IN ( SELECT e_id  FROM event  WHERE e_sportmeetingid = ( SELECT s_id FROM sportmeeting WHERE s_status = TRUE ))")
    @ResultMap("matchesMap")
    List<Matches> selectMyParticipate(@Param("uId") String uId);

    @Delete("delete from matches where m_id = #{id}")
    void deleteById(Integer mid);

    @Insert("insert into matches(m_no,m_eid,m_sort,m_score,m_rank) values (#{mNo} ,#{mEid} ,#{mSort} ,#{mScore} ,#{mRank}) ")
    void insert(Matches matches);

    @Update("update matches set m_no = #{mNo} ,m_eid=#{mEid} ,m_sort=#{mSort} ,m_score=#{mScore} ,m_rank=#{mRank} where m_id = #{mId}")
    void update(Matches matches);

    @Select("select * from matches where m_id = #{id}")
    @ResultMap("matchesMap")
    Matches findById(Integer id);

    @Select("select * from matches where m_eid in (select e_id from event where e_sportmeetingid = #{sId} )")
    @ResultMap("matchesMap")
    List<Matches> findBysId(Integer sId);

    @Select("select * from matches where isnull(m_score) and m_eid = #{eId} ")
    @Results(value = {
            @Result(id = true, column = "m_id", property = "mId"),
            @Result(column = "m_no", property = "mNo"),
            @Result(column = "m_eid", property = "mEid"),
            @Result(column = "m_sort", property = "mSort"),
            @Result(column = "m_score", property = "mScore"),
            @Result(column = "m_rank", property = "mRank"),
            @Result(column = "m_no", property = "user", one = @One(select = "com.handy.dao.UserMapper.selectByPKToS", fetchType = FetchType.LAZY))
    })
    List<Matches> selectNotScores(Integer eId);

    @Update("update matches set m_score = #{mScore} where m_id = #{mId} ")
    void updateScore(Matches matches);

    @Delete("delete from matches where m_id = #{id}")
    void concle(Integer id);
}