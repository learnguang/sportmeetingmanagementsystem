package com.handy.dao;

import com.handy.domain.Equipment;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface EquipmentMapper {

    @Select("select * from equipment where e_id = #{eId} ")
    @Results(id = "equipmentMap", value = {
            @Result(id = true, column = "e_id", property = "eId"),
            @Result(column = "e_name", property = "eName"),
            @Result(column = "e_model", property = "eModel"),
            @Result(column = "e_place", property = "ePlace"),
            @Result(column = "e_sum", property = "eSum"),
            @Result(column = "e_buyTime", property = "eBuytime")
    })
    Equipment selectByPK(Integer eId);

    @Select("select e.*,sum(b.b_num) as borrow from equipment e left join (select b_id,b_num,b_eid from borrow where b_state = 0) b on e.e_id = b.b_eid group by e.e_id")
    @Results(value = {
            @Result(id = true, column = "e_id", property = "eId"),
            @Result(column = "e_name", property = "eName"),
            @Result(column = "e_model", property = "eModel"),
            @Result(column = "e_place", property = "ePlace"),
            @Result(column = "e_sum", property = "eSum"),
            @Result(column = "e_buyTime", property = "eBuytime"),
            @Result(column = "borrow", property = "borrow")
    })
    List<Equipment> findAll();

    @Delete("delete from equipment where e_id = #{eid} ")
    void deleteById(Integer eid);

    @Insert("insert into equipment(e_name, e_model, e_place, e_sum, e_buyTime) VALUE (#{eName} ,#{eModel} ,#{ePlace},#{eSum} ,#{eBuytime} )")
    void insert(Equipment equipment);

    @Update("update equipment set e_name = #{eName} ,e_model = #{eModel} ,e_place = #{ePlace} ,e_sum = #{eSum} ,e_buyTime = #{eBuytime} where e_id = #{eId} ")
    void update(Equipment equipment);

    @Select("select * from equipment where e_id = #{id} ")
    Equipment findById(Integer id);
}

