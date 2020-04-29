package com.handy.controller;

import com.handy.domain.Role;
import com.handy.domain.RoleUser;
import com.handy.service.RoleService;
import com.handy.service.RoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private RoleUserService roleUserService;

    /**
     * 角色信息遍历
     *
     * @return
     */
    @RequestMapping(value = "/findAll.do", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<Role> findAll() {
        return roleService.findAll();
    }

    /**
     * 根据id查询角色
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById.do", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<Role> findById(String id) {
        return roleService.findById(id);
    }

    /**
     * 角色列表页面
     *
     * @return
     */
    @RequestMapping("/findAllList.do")
    public ModelAndView findAllList() {
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAll();
        mv.addObject("role", roleList);
        mv.setViewName("role");
        return mv;
    }

    /**
     * 插入角色
     *
     * @param role
     * @return
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insert(@RequestBody Role role) {
        try {
            roleService.insert(role);
        } catch (Exception e) {
            return "新增失败！";
        }
        return "200";
    }

    /**
     * 修改角色信息
     *
     * @param role
     * @return
     */
    @RequestMapping(value = "/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(@RequestBody Role role) {
        System.out.println(role);
        try {
            roleService.update(role);
        } catch (Exception e) {
            return "修改失败!";
        }
        return "200";
    }

    /**
     * 根据角色查询出所有具有该角色的用户
     *
     * @param rid
     * @return
     */
    @RequestMapping(value = "/findByRid.do", produces = "application/json; charset=utf-8")
    @ResponseBody
    public Role findByRId(Integer rid) {
        return roleService.findByRId(rid);
    }

    /**
     * 根据id删除角色
     *
     * @param rid
     */
    @RequestMapping("/deleteByPK.do")
    public void deleteByPK(Integer rid) {
        roleService.deleteByPK(rid);
    }

    /**
     * 遍历所有角色到模态框上
     *
     * @param rid
     * @return
     */
    @RequestMapping("/findRoleList.do")
    public ModelAndView findRoleList(Integer rid) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = roleUserService.findRoleList(rid);
        Role role = (Role) map.get("role");
        List<RoleUser> roleUserList = (List<RoleUser>) map.get("roleUserList");
        mv.addObject("role", role);
        mv.addObject("roleUserList", roleUserList);
        mv.setViewName("role-details");
        return mv;
    }
}
