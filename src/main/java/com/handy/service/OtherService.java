package com.handy.service;

import com.handy.domain.Other;

import java.util.List;

public interface OtherService {


    List<Other> findAll();

    void deleteByPK(Integer[] oId);
}
