package com.handy.service;

import com.handy.domain.Role;

import java.util.List;

public interface RoleService {


    List<Role> findAll();

    List<Role> findById(String id);

    Role findByRId(Integer id);

    void insert(Role role);

    void update(Role role);

    void deleteByPK(Integer rid);
}
