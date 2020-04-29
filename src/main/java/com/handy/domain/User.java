package com.handy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    /**
     * 用户账号
     */
    private String uId;
    /**
     * 密码
     */
    private String uPassword;
    /**
     * 用户状态
     */
    private Boolean uStatus;
    private List<Matches> matches;
    private List<Borrow> borrow;
    private Student student;
    private Teacher teacher;
    private Other other;
    private List<Role> roles;

    public User(String uId, String uPassword, Boolean uStatus) {
        this.uId = uId;
        this.uPassword = uPassword;
        this.uStatus = uStatus;
    }


}