package com.handy.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * Description:
 * Created by HANDY
 * on 2019/10/25 19:46
 */
public class BCryptPasswordEncoderUtils {
    private static final BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    public static String encodePassword(String password) {
        return bCryptPasswordEncoder.encode(password);
    }


    public static void main(String[] args) {
        String password = "test";
        String pwd = encodePassword(password);
        System.out.println(pwd);
    }
}
