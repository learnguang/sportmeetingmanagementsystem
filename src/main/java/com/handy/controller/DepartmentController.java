package com.handy.controller;

import com.handy.domain.Classes;
import com.handy.domain.Department;
import com.handy.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;
import java.util.Map;

@RolesAllowed("ADMIN")
@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    /**
     * 查询所有院系信息
     *
     * @return
     */
    @RequestMapping("findAll.do")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<Department> departmentList = departmentService.findAll();
        mv.addObject("departmentList", departmentList);
        mv.setViewName("department-list");
        return mv;
    }


    /**
     * 删除院系会信息
     *
     * @param dId
     * @return
     */
    @RequestMapping("/deleteByPK.do")
    public String deleteByIds(Integer[] dId) {
        departmentService.deleteByPK(dId);
        return "redirect:findAll.do";
    }


    /**
     * 查询院系详细信息
     *
     * @param dId
     * @return
     */
    @RequestMapping("/findDetailsBydId.do")
    public ModelAndView findDetailsBydId(Integer dId) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = departmentService.findDetailsBydId(dId);
        Department department = (Department) map.get("department");
        List<Classes> classesList = (List<Classes>) map.get("classesList");
        mv.addObject("department", department);
        mv.addObject("classesList", classesList);
        mv.setViewName("department-details");
        return mv;
    }

    /**
     * 遍历所有院系信息
     *
     * @return
     */
    @RequestMapping(value = "/findAllDepts.do", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<Department> findAllDepts() {
        return departmentService.findAllDepts();
    }

    /**
     * 根据id查询出院系信息，获取信息到模态框上
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
    public Department findById(@RequestParam(name = "id") Integer id) {
        return departmentService.findById(id);
    }

    /**
     * 插入院系
     *
     * @param department
     * @return
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insert(@RequestBody Department department) {
        try {
            departmentService.insert(department);
        } catch (Exception e) {
            return "新增失败！";
        }
        return "200";
    }

    /**
     * 修改院系信息
     *
     * @param department
     * @return
     */
    @RequestMapping(value = "/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(@RequestBody Department department) {
        try {
            departmentService.update(department);
        } catch (Exception e) {
            return "修改失败!";
        }
        return "200";
    }

}
