package com.handy.service.impl;

import com.handy.dao.*;
import com.handy.domain.Borrow;
import com.handy.domain.Matches;
import com.handy.domain.Student;
import com.handy.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private MatchesMapper matchesMapper;

    @Autowired
    private BorrowMapper borrowMapper;

    @Autowired
    private RoleUserMapper roleUserMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Student> findAll() {
        return studentMapper.findAll();
    }

    @Override
    public Student selectByPK(Integer id) {
        return studentMapper.selectByPK(id);
    }


    @Override
    public Map<String, Object> findDetailsBysId(Integer sId) {
        Map<String, Object> map = new HashMap<>();

        Student student = studentMapper.selectByPK(sId);
        map.put("student", student);

        String no = studentMapper.selectsNoBysId(sId);
        List<Matches> matchesList = matchesMapper.selectBymNo(no);
        map.put("matchesList", matchesList);

        List<Borrow> borrowList = borrowMapper.selectBybNo(no);
        map.put("borrowList", borrowList);

        return map;

    }


    @Override
    public void deleteByPK(String[] sNo) {
        if (sNo != null && sNo.length != 0) {
            for (String id : sNo) {
                studentMapper.deleteByPK(id);
            }
        }
    }

    @Override
    public List<Student> exportExcel() {
        return studentMapper.findAll();
    }

    @Override
    public void insert(Student student) {
        String newPassword = passwordEncoder.encode(student.getPassword());
        userMapper.insert(student.getSNo(), newPassword, student.getStatus());
        List<Integer> roleList = student.getRoleList();
        if (roleList != null && roleList.size() != 0) {
            for (Integer role : roleList) {
                roleUserMapper.insert(role, student.getSNo());
            }
        }
        studentMapper.insert(student);
    }

    @Override
    public void update(Student student) {
        String newPassword = passwordEncoder.encode(student.getPassword());
        userMapper.updatePW(newPassword, student.getOSNo());
        userMapper.updateUstatus(student.getOSNo(), student.getStatus());

        roleUserMapper.delete(student.getOSNo());
        List<Integer> roleList = student.getRoleList();
        if (roleList != null && roleList.size() != 0) {
            for (Integer role : roleList) {
                roleUserMapper.insert(role, student.getOSNo());
            }
        }

        studentMapper.update(student);
        userMapper.updatePK(student.getSNo(), student.getOSNo());
    }

    @Override
    public Student findById(Integer id) {

        return studentMapper.findById(id);
    }

    @Override
    public List<Student> findAllStudents() {

        return studentMapper.findAllStudents();
    }

    @Override
    public void importExcel(List<Student> students) {
        studentMapper.importExcel(students);
    }
}
