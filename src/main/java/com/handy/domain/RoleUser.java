package com.handy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoleUser {
    private Integer rId;

    private String uId;

    private Role role;

    private User user;
}