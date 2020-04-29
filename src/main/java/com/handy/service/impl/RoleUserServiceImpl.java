package com.handy.service.impl;

import com.handy.dao.RoleMapper;
import com.handy.dao.RoleUserMapper;
import com.handy.domain.Role;
import com.handy.domain.RoleUser;
import com.handy.service.RoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleUserServiceImpl implements RoleUserService {

    @Autowired
    private RoleUserMapper roleUserMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public void insert(Integer rid, String uid) {
        roleUserMapper.insert(rid, uid);
    }

    @Override
    public Map<String, Object> findRoleList(Integer rid) {
        Map<String, Object> map = new HashMap<>();
        Role role = roleMapper.findByRId(rid);
        map.put("role", role);
        List<RoleUser> roleUserList = roleUserMapper.findByrId(rid);
        map.put("roleUserList", roleUserList);
        return map;
    }
}
