package com.handy.service;

import com.handy.domain.Classes;

import java.util.List;
import java.util.Map;

public interface ClassesService {

    List<Classes> findAll();

    Map<String, Object> findDetailsBycId(Integer cId);

    void deleteByPK(Integer[] cId);

    List<Classes> findAllClasses();

    Classes findById(Integer id);

    void insert(Classes classes);

    void update(Classes classes);
}
