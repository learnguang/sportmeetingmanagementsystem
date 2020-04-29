package com.handy.service.impl;

import com.handy.dao.OtherMapper;
import com.handy.domain.Other;
import com.handy.service.OtherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OtherServiceImpl implements OtherService {


    @Autowired
    private OtherMapper otherMapper;

    @Override
    public List<Other> findAll() {
        return otherMapper.findAll();
    }

    @Override
    public void deleteByPK(Integer[] oId) {
        if (oId != null && oId.length != 0) {
            for (Integer id : oId) {
                otherMapper.deleteByPK(id);
            }
        }
    }
}
