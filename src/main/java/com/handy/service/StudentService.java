package com.handy.service;

import com.handy.domain.Student;

import java.util.List;
import java.util.Map;

public interface StudentService {

    List<Student> findAll();

    void deleteByPK(String[] sNo);

    Student selectByPK(Integer sId);

    Map<String, Object> findDetailsBysId(Integer sId);

    List<Student> exportExcel();

    void insert(Student student);

    void update(Student student);

    Student findById(Integer id);

    List<Student> findAllStudents();

    void importExcel(List<Student> students);
}
