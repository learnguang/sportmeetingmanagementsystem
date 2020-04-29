package com.handy.service.impl;

import com.handy.dao.ClassesMapper;
import com.handy.dao.StudentMapper;
import com.handy.domain.Classes;
import com.handy.domain.Student;
import com.handy.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ClassesServiceImpl implements ClassesService {

    @Autowired
    private ClassesMapper classesMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Classes> findAll() {
        return classesMapper.findAll();
    }

    @Override
    public Map<String, Object> findDetailsBycId(Integer cId) {
        Map<String, Object> map = new HashMap<>();

        Classes classes = classesMapper.selectByPK(cId);
        map.put("classes", classes);

        List<Student> studentList = studentMapper.selectBysCid(cId);
        map.put("studentList", studentList);

        return map;
    }

    @Override
    public void deleteByPK(Integer[] cId) {
        if (cId != null && cId.length != 0) {
            for (Integer id : cId) {
                classesMapper.deleteByPK(id);
            }
        }
    }

    @Override
    public List<Classes> findAllClasses() {

        return classesMapper.findAllClasses();
    }

    @Override
    public Classes findById(Integer id) {
        return classesMapper.findById(id);
    }

    @Override
    public void insert(Classes classes) {
        classesMapper.insert(classes);

    }

    @Override
    public void update(Classes classes) {
        classesMapper.update(classes);
    }
}
