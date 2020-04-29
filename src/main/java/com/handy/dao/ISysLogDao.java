package com.handy.dao;

import com.handy.domain.SysLog;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("sysLogDao")
public interface ISysLogDao {


    //保存日志
    @Insert("insert into sysLog(visitTime,username,ip,url,executionTime,method) " +
            "values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    void save(SysLog sysLog) throws Exception;


    //查找所有
    @Select("select * from sysLog ")
    List<SysLog> findAll();


    //批量删除日志
    @Delete("delete from sysLog where id=#{id}")
    void delete(String id);

}
