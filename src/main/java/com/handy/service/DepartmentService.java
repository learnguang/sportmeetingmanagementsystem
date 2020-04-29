package com.handy.service;

import com.handy.domain.Department;

import java.util.List;
import java.util.Map;

public interface DepartmentService {


    List<Department> findAll();

    void deleteByPK(Integer[] dId);

    Map<String, Object> findDetailsBydId(Integer dId);

    List<Department> findAllDepts();

    Department findById(Integer id);

    void insert(Department department);

    void update(Department department);
}
