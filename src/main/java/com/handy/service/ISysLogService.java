package com.handy.service;

import com.handy.domain.SysLog;

import java.util.List;

public interface ISysLogService {

    //保存日志
    void save(SysLog sysLog) throws Exception;


    //查找所有日志
    List<SysLog> findAll();

    //批量删除日志
    void delete(String[] selectIds);

}
