package com.handy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Department {
    /**
     * 学院id
     */
    private Integer dId;

    /**
     * 学院名称
     */
    private String dName;

    /**
     * 院长id
     */
    private Integer dDeanid;

    private Integer total;

    private Teacher teacher;

    private List<Classes> classes;
}