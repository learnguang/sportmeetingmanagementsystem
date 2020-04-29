package com.handy.controller;

import com.handy.domain.Classes;
import com.handy.domain.Student;
import com.handy.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;
import java.util.Map;

@RolesAllowed("ADMIN")
@Controller
@RequestMapping("classes")
public class ClassesController {

    @Autowired
    private ClassesService classesService;

    /**
     * 查询所有班级信息
     *
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<Classes> classesList = classesService.findAll();
        mv.addObject("classesList", classesList);
        mv.setViewName("classes-list");
        return mv;
    }


    /**
     * 查询班级详细信息
     *
     * @param cId
     * @return
     */
    @RequestMapping("/findDetailsBycId.do")
    public ModelAndView findDetailsBycId(Integer cId) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = classesService.findDetailsBycId(cId);
        Classes classes = (Classes) map.get("classes");
        List<Student> studentList = (List<Student>) map.get("studentList");
        mv.addObject("studentList", studentList);
        mv.addObject("classes", classes);
        mv.setViewName("classes-details");
        return mv;
    }

    /**
     * 删除班级
     *
     * @param cId
     * @return
     */
    @RequestMapping("/deleteByPK.do")
    public String deleteByIds(Integer[] cId) {
        classesService.deleteByPK(cId);
        return "redirect:findAll.do";
    }

    /**
     * 遍历所有出班级
     *
     * @return
     */
    @RequestMapping(value = "/findAllClasses.do", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<Classes> findAllClasses() {
        return classesService.findAllClasses();
    }

    /**
     * 根据id查找班级信息，获取信息到模态框上
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
    public Classes findById(@RequestParam(name = "id") Integer id) {
        return classesService.findById(id);
    }

    /**
     * 插入班级信息
     *
     * @param classes
     * @return
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insert(@RequestBody Classes classes) {
        try {
            classesService.insert(classes);
        } catch (Exception e) {
            return "新增失败！";
        }
        return "200";
    }

    /**
     * 修改班级信息
     *
     * @param classes
     * @return
     */
    @RequestMapping(value = "/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(@RequestBody Classes classes) {
        try {
            classesService.update(classes);
        } catch (Exception e) {
            return "修改失败!";
        }
        return "200";
    }
}
