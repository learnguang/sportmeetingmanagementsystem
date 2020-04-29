package com.handy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role {
    /**
     * 角色id
     */
    private Integer rId;

    /**
     * 角色名称
     */
    private String rName;

    /**
     * 角色描述
     */
    private String rDescription;
}