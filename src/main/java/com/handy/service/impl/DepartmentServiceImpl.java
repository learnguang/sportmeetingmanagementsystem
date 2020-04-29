package com.handy.service.impl;

import com.handy.dao.ClassesMapper;
import com.handy.dao.DepartmentMapper;
import com.handy.domain.Classes;
import com.handy.domain.Department;
import com.handy.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private ClassesMapper classesMapper;


    @Override
    public List<Department> findAll() {
        return departmentMapper.findAll();
    }

    @Override
    public Map<String, Object> findDetailsBydId(Integer dId) {
        Map<String, Object> map = new HashMap<>();

        Department department = departmentMapper.selectByPK(dId);
        map.put("department", department);

        List<Classes> classesList = classesMapper.selectByCdid(dId);
        map.put("classesList", classesList);

        return map;
    }

    @Override
    public List<Department> findAllDepts() {

        return departmentMapper.findAllDepts();
    }

    @Override
    public Department findById(Integer id) {
        return departmentMapper.findById(id);
    }

    @Override
    public void insert(Department department) {
        departmentMapper.insert(department);
    }

    @Override
    public void update(Department department) {
        departmentMapper.update(department);
    }


    @Override
    public void deleteByPK(Integer[] dId) {
        if (dId != null && dId.length != 0) {
            for (Integer id : dId) {
                departmentMapper.deleteByPK(id);
            }
        }
    }
}
