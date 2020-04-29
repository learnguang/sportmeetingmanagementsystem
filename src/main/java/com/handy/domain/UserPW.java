package com.handy.domain;

import lombok.Data;

@Data
public class UserPW {

    private String uId;
    private String newPassword;
    private String oldPassword;

}
