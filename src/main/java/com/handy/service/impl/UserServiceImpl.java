package com.handy.service.impl;

import com.handy.dao.OtherMapper;
import com.handy.dao.StudentMapper;
import com.handy.dao.TeacherMapper;
import com.handy.dao.UserMapper;
import com.handy.domain.*;
import com.handy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("UserService")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 30, rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private OtherMapper otherMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public Student findSDetails(String uId) {
        return studentMapper.selectBysNo2(uId);
    }

    @Override
    public Teacher findTDetails(String uId) {
        return teacherMapper.selectBytNo(uId);
    }

    @Override
    public Other findODetails(String uId) {
        return otherMapper.selectByoNo(uId);
    }

    @Override
    public Boolean changePW(UserPW userPW) {
        String uId = userPW.getUId();
        String oPassword = userMapper.selectPW(uId);
        String nPassword = passwordEncoder.encode(userPW.getNewPassword());
        Boolean flag = passwordEncoder.matches(userPW.getOldPassword(), oPassword);
        if (flag) {
            userMapper.updatePW(nPassword, uId);
            return true;
        } else {
            return false;
        }

    }


    @Override
    public Map<String, Object> findAll() {
        Map<String, Object> map = new HashMap<>();

        List<Student> studentList = studentMapper.setting();
        List<Teacher> teacherList = teacherMapper.setting();
        List<Other> otherList = otherMapper.setting();

        map.put("studentList", studentList);
        map.put("teacherList", teacherList);
        map.put("otherList", otherList);

        return map;
    }

    @Override
    public void updateUstatus(String Id, Boolean uStatus) {
        if (Id != null) {
            userMapper.updateUstatus(Id, !uStatus);
        }

    }

    @Override
    public void updateUstatusOn(String[] Id) {
        if (Id != null && Id.length != 0) {
            for (int i = 0; i < Id.length; i++) {
                userMapper.updateUstatusOn(Id[i]);
            }
        }
    }

    @Override
    public void updateUstatusOff(String[] Id) {
        if (Id != null && Id.length != 0) {
            for (int i = 0; i < Id.length; i++) {
                userMapper.updateUstatusOff(Id[i]);
            }
        }
    }

    @Override
    public UserDetails loadUserByUsername(String uId) throws UsernameNotFoundException {
        User u = null;
        try {
            u = userMapper.selectByPKToLogin(uId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        org.springframework.security.core.userdetails.User user = new org.springframework.security.core.userdetails.User(u.getUId(), u.getUPassword(), u.getUStatus() != false, true, true, true, getAuthority(uId));
        return user;
    }

    public List<SimpleGrantedAuthority> getAuthority(String uId) {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        List<Role> roleList = userMapper.selectrNameByuId(uId);
        for (Role role : roleList) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRName()));
        }

        return list;
    }


}
