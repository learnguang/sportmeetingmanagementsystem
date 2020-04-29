package com.handy.service.impl;

import com.handy.dao.*;
import com.handy.domain.Borrow;
import com.handy.domain.Student;
import com.handy.domain.Teacher;
import com.handy.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private ClassesMapper classesMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private BorrowMapper borrowMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleUserMapper roleUserMapper;


    @Override
    public List<Teacher> findAll() {
        return teacherMapper.findAll();
    }

    @Override
    public Map<String, Object> findDetailsBytId(Integer tId) {

        Map<String, Object> map = new HashMap<>();

        Teacher teacher = teacherMapper.selectByPK(tId);
        map.put("teacher", teacher);

        Integer val = classesMapper.selectByHid(tId);
        List<Student> studentList = studentMapper.selectByCid(val);
        map.put("studentList", studentList);

        String tNo = teacherMapper.selecttNoByPk(tId);
        List<Borrow> borrowList = borrowMapper.selectBybNo(tNo);
        map.put("borrowList", borrowList);


        return map;
    }


    @Override
    public void deleteByPK(Integer[] tId) {
        if (tId != null && tId.length != 0) {
            for (Integer id : tId) {
                teacherMapper.deleteByPK(id);
            }
        }
    }

    @Override
    public Teacher findById(Integer id) {
        return teacherMapper.findById(id);
    }

    @Override
    public void update(Teacher teacher) {
        String newPassword = passwordEncoder.encode(teacher.getPassword());
        userMapper.updatePW(newPassword, teacher.getOTNo());
        userMapper.updateUstatus(teacher.getOTNo(), teacher.getStatus());

        roleUserMapper.delete(teacher.getOTNo());
        List<Integer> roleList = teacher.getRoleList();
        if (roleList != null && roleList.size() != 0) {
            for (Integer role : roleList) {
                roleUserMapper.insert(role, teacher.getOTNo());
            }
        }

        teacherMapper.update(teacher);
        userMapper.updatePK(teacher.getTNo(), teacher.getOTNo());

    }

    @Override
    public void insert(Teacher teacher) {
        String newPassword = passwordEncoder.encode(teacher.getPassword());
        userMapper.insert(teacher.getTNo(), newPassword, teacher.getStatus());
        List<Integer> roleList = teacher.getRoleList();
        if (roleList != null && roleList.size() != 0) {
            for (Integer role : roleList) {
                roleUserMapper.insert(role, teacher.getTNo());
            }
        }
        teacherMapper.insert(teacher);
    }

    @Override
    public List<Teacher> findAllTeachers() {

        return teacherMapper.findAllTeachers();
    }
}
