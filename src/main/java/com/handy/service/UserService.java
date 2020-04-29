package com.handy.service;

import com.handy.domain.Other;
import com.handy.domain.Student;
import com.handy.domain.Teacher;
import com.handy.domain.UserPW;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.Map;

public interface UserService extends UserDetailsService {

//    int insert(User user);

    Student findSDetails(String uId);

    Teacher findTDetails(String uId);

    Other findODetails(String uId);

    Boolean changePW(UserPW userPW);

    Map<String, Object> findAll();

    void updateUstatus(String Id, Boolean uStatus);

    void updateUstatusOn(String[] Id);

    void updateUstatusOff(String[] Id);
}
