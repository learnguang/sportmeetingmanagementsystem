package com.handy.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class Teacher {

    /**
     * id
     */
    private Integer tId;
    /**
     * 教工号
     */
    private String tNo;
    /**
     * 姓名
     */
    private String tName;
    /**
     * 性别
     */
    private Boolean tGender;
    /**
     * 身份
     */
    private String tIdentity;
    /**
     * 手机号码
     */
    private String tPhone;
    /**
     * 电子邮箱
     */
    private String tEmail;
    /**
     * 身份证号
     */
    private String tIdcard;

    private String oTNo;

    private User user;

    private String Password;

    private List<Integer> RoleList;

    private Boolean Status;


    public Teacher(String tNo, String tName, Boolean tGender, String tIdentity, String tPhone, String tEmail, String tIdcard) {
        this.tNo = tNo;
        this.tName = tName;
        this.tGender = tGender;
        this.tIdentity = tIdentity;
        this.tPhone = tPhone;
        this.tEmail = tEmail;
        this.tIdcard = tIdcard;
    }
}