package com.handy.service.impl;

import com.handy.dao.RoleMapper;
import com.handy.domain.Role;
import com.handy.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> findAll() {
        return roleMapper.findAll();
    }

    @Override
    public List<Role> findById(String id) {
        return roleMapper.findById(id);
    }

    @Override
    public Role findByRId(Integer id) {
        return roleMapper.findByRId(id);
    }

    @Override
    public void insert(Role role) {
        roleMapper.insert(role);
    }

    @Override
    public void update(Role role) {
        roleMapper.update(role);
    }

    @Override
    public void deleteByPK(Integer rid) {
        roleMapper.deleteByPK(rid);
    }
}
