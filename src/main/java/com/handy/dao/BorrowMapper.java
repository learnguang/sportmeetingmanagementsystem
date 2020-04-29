package com.handy.dao;

import com.handy.domain.Borrow;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

@Mapper
public interface BorrowMapper {

    @Insert("insert into borrow(b_no, b_eid, b_num, b_startTime, b_endTime, b_state, b_description) VALUE (#{bNo} ,#{bEid} ,#{bNum} ,now() ,#{bEndtime} ,0 ,#{bDescription} )")
    void insert(Borrow borrow);

    @Select("select * from borrow where b_no = #{bNo} ")
    @Results(value = {
            @Result(id = true, column = "b_id", property = "bId"),
            @Result(column = "b_no", property = "bNo"),
            @Result(column = "b_eid", property = "bEid"),
            @Result(column = "b_num", property = "bNum"),
            @Result(column = "b_starttime", property = "bStarttime"),
            @Result(column = "b_endtime", property = "bEndtime"),
            @Result(column = "b_state", property = "bState"),
            @Result(column = "b_description", property = "bDescription"),
            @Result(column = "b_eid", property = "equipment", one = @One(select = "com.handy.dao.EquipmentMapper.selectByPK", fetchType = FetchType.EAGER)),

    })
    List<Borrow> selectBybNo(String bNo);

    @Select("select * from borrow where b_eid=#{id} ")
    @Results(id = "map", value = {
            @Result(id = true, column = "b_id", property = "bId"),
            @Result(column = "b_no", property = "bNo"),
            @Result(column = "b_eid", property = "bEid"),
            @Result(column = "b_num", property = "bNum"),
            @Result(column = "b_starttime", property = "bStarttime"),
            @Result(column = "b_endtime", property = "bEndtime"),
            @Result(column = "b_state", property = "bState"),
            @Result(column = "b_description", property = "bDescription"),
            @Result(column = "b_eid", property = "equipment", one = @One(select = "com.handy.dao.EquipmentMapper.selectByPK", fetchType = FetchType.EAGER)),
            @Result(column = "b_no", property = "user", one = @One(select = "com.handy.dao.UserMapper.selectByPKToS", fetchType = FetchType.EAGER))
    })
    List<Borrow> selectByeId(Integer id);

    @Select("select * from borrow ")
    @ResultMap("map")
    List<Borrow> findAll();

    @Update("update borrow set b_endTime = now(), b_state = 1 where b_id = #{bId}")
    void update(Integer bid);

    @Delete("delete from borrow where b_id = #{bid} ")
    void deleteById(Integer bid);

    @Select("select * from borrow where b_state = 0")
    @ResultMap("map")
    List<Borrow> findAllOff();
}