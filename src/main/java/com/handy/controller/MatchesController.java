package com.handy.controller;

import com.handy.domain.Event;
import com.handy.domain.Matches;
import com.handy.service.EventService;
import com.handy.service.MatchesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/matches")
public class MatchesController {

    @Autowired
    private MatchesService matchesService;

    @Autowired
    private EventService eventService;


    /**
     * 查询所有赛事成绩信息
     *
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<Matches> matchesList = matchesService.findAll();
        mv.addObject("matches", matchesList);
        mv.setViewName("matches-list");
        return mv;
    }

    /**
     * 查询赛事成绩详细信息
     *
     * @param mId
     * @return
     */
    @RequestMapping("/findDetailsBymId.do")
    public ModelAndView findDetailsBysId(Integer mId) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = matchesService.findDetailsBymId(mId);
        Matches matches = (Matches) map.get("matches");
        mv.addObject("matches", matches);
        mv.setViewName("matches-details");
        return mv;
    }

    /**
     * 学生的参赛列表
     *
     * @param uId
     * @return
     */
    @RequestMapping("/myParticipate.do")
    public ModelAndView myParticipate(String uId) {
        ModelAndView mv = new ModelAndView();
        List<Matches> matchesList = matchesService.selectMyParticipate(uId);
        mv.addObject("matches", matchesList);
        mv.setViewName("user-participate");
        return mv;
    }

    @RequestMapping("/concle.do")
    public void concle(Integer id){
        matchesService.concle(id);
    }

    /**
     * 成绩管理页面
     *
     * @return
     */
    @RequestMapping("/manage.do")
    public ModelAndView manage() {
        ModelAndView mv = new ModelAndView();
        List<Matches> matchesList = matchesService.findAll();
        mv.addObject("matches", matchesList);
        mv.setViewName("matches-manage");
        return mv;
    }

    /**
     * 成绩信息插入
     *
     * @param matches
     * @return
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insert(@RequestBody Matches matches) {
        try {
            matchesService.insert(matches);
        } catch (Exception e) {
            return "新增失败！";
        }
        return "200";
    }

    /**
     * 成绩信息修改
     *
     * @param matches
     * @return
     */
    @RequestMapping(value = "/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(@RequestBody Matches matches) {
        try {
            matchesService.update(matches);
        } catch (Exception e) {
            return "修改失败!";
        }
        return "200";
    }

    /**
     * 根据id过去成绩信息到模态框
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
    public Matches findById(@RequestParam(name = "id") Integer id) {
        return matchesService.findById(id);
    }

    /**
     * 删除成绩信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteById.do")
    public String deleteByIds(Integer[] id) {
        matchesService.deleteById(id);
        return "redirect:manage.do";
    }

    /**
     * 成绩录入
     *
     * @return
     */
    @RequestMapping("/input.do")
    public ModelAndView input() {
        ModelAndView mv = new ModelAndView();
        List<Event> eventList = eventService.findNoScore();
        mv.addObject("event", eventList);
        mv.setViewName("matches-input");
        return mv;
    }

    /**
     * 修改成绩
     *
     * @param matches
     * @return
     */
    @RequestMapping(value = "/updateScore.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateScore(@RequestBody Matches matches) {
        try {
            matchesService.updateScore(matches);
        } catch (Exception e) {
            return "录入失败!";
        }
        return "200";
    }


}
