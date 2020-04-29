package com.handy.controller;

import com.handy.domain.Other;
import com.handy.domain.Student;
import com.handy.domain.Teacher;
import com.handy.domain.UserPW;
import com.handy.service.UserService;
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
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;

    /**
     * 用户信息详情，即我的信息页面
     *
     * @param uId
     * @return
     */
    @RequestMapping("/userDetails.do")
    public ModelAndView userDetails(String uId) {
        ModelAndView mv = new ModelAndView();
        Student student = userService.findSDetails(uId);
        Teacher teacher = userService.findTDetails(uId);
        Other other = userService.findODetails(uId);
        mv.addObject("student", student);
        mv.addObject("teacher", teacher);
        mv.addObject("other", other);
        mv.setViewName("user-details");
        return mv;
    }

    /**
     * 修改页面
     *
     * @return
     */
    @RequestMapping("/updatePW.do")
    public ModelAndView updatePW() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user-updatepw");
        return mv;
    }

    /**
     * 修改密码功能
     *
     * @param userPW
     * @return
     */
    @RequestMapping(value = "/changePW.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changPW(@RequestBody UserPW userPW) {
        try {
            Boolean flag = userService.changePW(userPW);
            if (flag)
                return "200";
            else
                return "400";
        } catch (Exception e) {
            return "400";
        }
    }

    /**
     * 用户状态管理页面
     *
     * @return
     */
    @RequestMapping("/user.do")
    public ModelAndView userSetting() {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = userService.findAll();
        List<Student> studentList = (List<Student>) map.get("studentList");
        List<Teacher> teacherList = (List<Teacher>) map.get("teacherList");
        List<Other> otherList = (List<Other>) map.get("otherList");
        mv.addObject("student", studentList);
        mv.addObject("teacher", teacherList);
        mv.addObject("other", otherList);
        mv.setViewName("user-setting");
        return mv;

    }

    /**
     * 修改用户状态
     *
     * @param Id
     * @param uStatus
     * @return
     */
    @RequestMapping("/updateUstatus.do")
    public String updateUstatus(String Id, Boolean uStatus) {
        userService.updateUstatus(Id, uStatus);
        return "redirect:user.do";
    }

    /**
     * 批量修改用户状态为开启
     *
     * @param Id
     * @return
     */
    @RequestMapping("/updateUstatusOn.do")
    public String updateUstatusOn(String[] Id) {
        userService.updateUstatusOn(Id);
        return "redirect:user.do";
    }

    /**
     * 批量修改用户状态为关闭
     *
     * @param Id
     * @return
     */
    @RequestMapping("/updateUstatusOff.do")
    public String updateUstatusOff(String[] Id) {
        userService.updateUstatusOff(Id);
        return "redirect:user.do";
    }


}
