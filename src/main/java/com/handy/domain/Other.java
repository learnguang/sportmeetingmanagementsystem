package com.handy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Other {
    /**
     * id
     */
    private Integer oId;

    /**
     * 其他用户标识号
     */
    private String oNo;

    /**
     * 其他用户名
     */
    private String oName;

    private User user;
}