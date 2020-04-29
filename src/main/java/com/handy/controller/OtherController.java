package com.handy.controller;

import com.handy.domain.Other;
import com.handy.service.OtherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/other")
public class OtherController {

    @Autowired
    private OtherService otherService;

    /**
     * 查询其他人员
     *
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<Other> otherList = otherService.findAll();
        mv.addObject("otherList", otherList);
        mv.setViewName("other-list");
        return mv;
    }

    /**
     * 删除其他人员
     *
     * @param oId
     * @return
     */
    @RequestMapping("/deleteByPK.do")
    public String deleteByIds(Integer[] oId) {
        otherService.deleteByPK(oId);
        return "redirect:findAll.do";
    }
}
