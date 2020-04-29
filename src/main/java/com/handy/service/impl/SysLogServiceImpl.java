package com.handy.service.impl;

import com.handy.dao.ISysLogDao;
import com.handy.domain.SysLog;
import com.handy.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("sysLogService")
public class SysLogServiceImpl implements ISysLogService {


    @Autowired
    private ISysLogDao sysLogDao;

    //保存日志
    @Override
    public void save(SysLog sysLog) throws Exception {
        sysLogDao.save(sysLog);
    }

    //查找所有日志
    @Override
    public List<SysLog> findAll() {
        return sysLogDao.findAll();
    }

    //批量删除日志
    @Override
    public void delete(String[] selectIds) {
        for (String id : selectIds) {
            sysLogDao.delete(id);
        }
    }


}
