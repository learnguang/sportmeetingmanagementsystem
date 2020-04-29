package com.handy.service;

import java.util.Map;

public interface RoleUserService {


    void insert(Integer rid, String uid);


    Map<String, Object> findRoleList(Integer rid);
}
