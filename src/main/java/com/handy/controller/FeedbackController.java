package com.handy.controller;

import com.handy.domain.Feedback;
import com.handy.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    /**
     * 反馈信息插入
     *
     * @param feedback
     * @return
     */
    @RequestMapping(value = "/feedback.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String feedback(@RequestBody Feedback feedback) {
        try {
            feedbackService.insert(feedback);
        } catch (Exception e) {
            return "反馈失败！";
        }
        return "200";
    }

    /**
     * 反馈信息列表
     *
     * @return
     */
    @RequestMapping("/feedbackList.do")
    public ModelAndView feedback() {
        ModelAndView mv = new ModelAndView();
        List<Feedback> feedbackList = feedbackService.findAll();
        mv.addObject("feedback", feedbackList);
        mv.setViewName("user-feedback");
        return mv;
    }

    /**
     * 删除反馈信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteById.do")
    public String deleteByIds(Integer[] id) {
        feedbackService.deleteById(id);
        return "redirect:feedbackList.do";
    }
}
