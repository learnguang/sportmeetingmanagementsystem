package com.handy.controller;

import com.handy.domain.Borrow;
import com.handy.domain.Student;
import com.handy.domain.Teacher;
import com.handy.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;
import java.util.Map;

@RolesAllowed("ADMIN")
@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    /**
     * 查询所有教师信息
     *
     * @return
     */
    @RequestMapping("/findAll.do")
    @ResponseBody
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<Teacher> teacherList = teacherService.findAll();
        mv.addObject("teacher", teacherList);
        mv.setViewName("teacher-list");
        return mv;
    }

    /**
     * 查询教师详细信息
     *
     * @param tId
     * @return
     */
    @RequestMapping("/findDetailsBytId.do")
    public ModelAndView findDetailsBytId(Integer tId) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = teacherService.findDetailsBytId(tId);
        Teacher teacher = (Teacher) map.get("teacher");
        List<Student> studentList = (List<Student>) map.get("studentList");
        List<Borrow> borrowList = (List<Borrow>) map.get("borrowList");
        mv.addObject("teacher", teacher);
        mv.addObject("studentList", studentList);
        mv.addObject("borrowList", borrowList);
        mv.setViewName("teacher-details");
        return mv;
    }

    /**
     * 删除教师信息
     *
     * @param tId
     * @return
     */
    @RequestMapping("/deleteByPK.do")
    public String deleteByIds(Integer[] tId) {
        teacherService.deleteByPK(tId);
        return "redirect:findAll.do";
    }

    /**
     * 根据ID查找教师信息到模态框上
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
    public Teacher findById(@RequestParam(name = "id") Integer id) {
        return teacherService.findById(id);
    }

    /**
     * 插入教师
     *
     * @param teacher
     * @return
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insert(@RequestBody Teacher teacher) {
        try {
            teacherService.insert(teacher);
        } catch (Exception e) {
            return "新增失败！";
        }
        return "200";
    }

    /**
     * 修改教师信息
     *
     * @param teacher
     * @return
     */
    @RequestMapping(value = "/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(@RequestBody Teacher teacher) {
        try {
            teacherService.update(teacher);
        } catch (Exception e) {
            return "修改失败!";
        }
        return "200";
    }

    /**
     * 遍历所有教师信息到选择框上
     *
     * @return
     */
    @RequestMapping(value = "/findAllTeachers.do", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<Teacher> findAllTeachers() {
        return teacherService.findAllTeachers();
    }


}
