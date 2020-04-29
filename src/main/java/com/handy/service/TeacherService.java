package com.handy.service;

import com.handy.domain.Teacher;

import java.util.List;
import java.util.Map;

public interface TeacherService {

    List<Teacher> findAll();

    Map<String, Object> findDetailsBytId(Integer tId);

    void deleteByPK(Integer[] tId);

    Teacher findById(Integer id);

    void update(Teacher teacher);

    void insert(Teacher teacher);

    List<Teacher> findAllTeachers();

}
