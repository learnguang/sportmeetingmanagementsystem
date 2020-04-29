package com.handy.domain;

import com.handy.utils.Excel.ExcelAttribute;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class Student {

    /**
     * id
     */
    @ExcelAttribute(sort = 0)
    private Integer sId;
    /**
     * 学号
     */
    @ExcelAttribute(sort = 1)
    private String sNo;
    /**
     * 姓名
     */
    @ExcelAttribute(sort = 2)
    private String sName;
    /**
     * 性别
     */
    @ExcelAttribute(sort = 3)
    private Boolean sGender;

    private String sGenderStr;
    /**
     * 班级号
     */
    @ExcelAttribute(sort = 4)
    private Integer sClassid;
    /**
     * 电话号码
     */
    @ExcelAttribute(sort = 5)
    private String sPhone;
    /**
     * 电子邮箱
     */
    @ExcelAttribute(sort = 6)
    private String sEmail;
    /**
     * 身份证号
     */
    @ExcelAttribute(sort = 7)
    private String sIdcard;

    private String oSNo;

    private String Password;

    private List<Integer> RoleList;

    private Boolean Status;

    private Classes classes;

    private User user;

    public Student(String sNo, String sName, Boolean sGender, Integer sClassid, String sPhone, String sEmail, String sIdcard) {
        this.sNo = sNo;
        this.sName = sName;
        this.sGender = sGender;
        this.sClassid = sClassid;
        this.sPhone = sPhone;
        this.sEmail = sEmail;
        this.sIdcard = sIdcard;
    }

    public String getSGenderStr() {
        if (sGender == false)
            sGenderStr = "女";
        else if (sGender == true)
            sGenderStr = "男";
        return sGenderStr;
    }

    public void setSGender(Boolean sGender) {
        if (sGenderStr == "男")
            sGender = true;
        else if (sGenderStr == "女")
            sGender = false;
        this.sGender = sGender;
    }

}