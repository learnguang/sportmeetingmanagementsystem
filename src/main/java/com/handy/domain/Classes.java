package com.handy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Classes {
    /**
     * 班级id
     */
    private Integer cId;

    /**
     * 班级名称
     */
    private String cName;

    /**
     * 班主任id
     */
    private Integer cHeadmasterid;

    /**
     * 专业
     */
    private String cMajor;

    /**
     * 学院id
     */
    private Integer cDeptid;

    private Integer total;

    private Teacher teacher;

    private Department department;
}