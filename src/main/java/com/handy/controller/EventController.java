package com.handy.controller;

import com.handy.domain.Event;
import com.handy.domain.Matches;
import com.handy.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/event")
public class EventController {
    @Autowired
    private EventService eventService;

    /**
     * 查询所有项目信息
     *
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<Event> eventList = eventService.findAll();
        mv.addObject("event", eventList);
        mv.setViewName("event-list");
        return mv;
    }


    /**
     * 查询项目详细信息
     *
     * @param eId
     * @return
     */
    @RequestMapping("/findDetailsByeId.do")
    public ModelAndView findDetailsByeId(Integer eId) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = eventService.findDetailsByeId(eId);
        Event event = (Event) map.get("event");
        List<Matches> matchesList = (List<Matches>) map.get("matchesList");
        mv.addObject("matchesList", matchesList);
        mv.addObject("event", event);
        mv.setViewName("event-details");
        return mv;
    }

    /**
     * 项目详细信息和该项目下参赛情况
     *
     * @param eId
     * @return
     */
    @RequestMapping("/manageFindDetailsByeId.do")
    public ModelAndView manageFindDetailsBysId(Integer eId) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = eventService.findDetailsByeId(eId);
        Event event = (Event) map.get("event");
        List<Matches> matchesList = (List<Matches>) map.get("matchesList");
        mv.addObject("matchesList", matchesList);
        mv.addObject("event", event);
        mv.setViewName("event-manage-details");
        return mv;
    }

    /**
     * 成绩录入
     *
     * @param eId
     * @return
     */
    @RequestMapping("/matchesInput.do")
    public ModelAndView matchesInput(Integer eId) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = eventService.findDetailsByeId(eId);
        Event event = (Event) map.get("event");
        List<Matches> matchesList = (List<Matches>) map.get("matchesList2");
        mv.addObject("matchesList", matchesList);
        mv.addObject("event", event);
        mv.setViewName("matches-manage-input");
        return mv;
    }

    /**
     * 学生参赛项目列表
     *
     * @param uId
     * @return
     */
    @RequestMapping("/participateEvent.do")
    public ModelAndView participateEvent(String uId) {
        ModelAndView mv = new ModelAndView();
        List<Event> eventList = eventService.findNewAll(uId);
        mv.addObject("event", eventList);
        mv.setViewName("participateEvent-list");
        return mv;
    }

    /**
     * 参加比赛
     *
     * @param eId
     * @param No
     */
    @RequestMapping("/participate.do")
    public void participate(Integer eId, String No) {
        eventService.participate(eId, No);
    }

    /**
     * 项目管理页面
     *
     * @return
     */
    @RequestMapping("/manage.do")
    public ModelAndView manage() {
        ModelAndView mv = new ModelAndView();
        List<Event> eventList = eventService.findAll();
        mv.addObject("event", eventList);
        mv.setViewName("event-manage");
        return mv;
    }

    /**
     * 项目录入
     *
     * @param event
     * @return
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insert(@RequestBody Event event) {
        try {
            eventService.insert(event);
        } catch (Exception e) {
            return "新增失败！";
        }
        return "200";
    }

    /**
     * 项目修改
     *
     * @param event
     * @return
     */
    @RequestMapping(value = "/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(@RequestBody Event event) {
        try {
            eventService.update(event);
        } catch (Exception e) {
            return "修改失败!";
        }
        return "200";
    }

    /**
     * 根据id获取项目信息到模态框
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
    public Event findById(@RequestParam(name = "id") Integer id) {
        return eventService.findById(id);
    }

    /**
     * 删除项目
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteById.do")
    public String deleteByIds(Integer[] id) {
        eventService.deleteById(id);
        return "redirect:manage.do";
    }

    /**
     * 将该项目下的参赛人员进行成绩排名
     *
     * @param id
     */
    @RequestMapping(value = "/rank.do")
    public void rank(Integer id) {
        eventService.rank(id);
    }

    /**
     * 随机分道
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/random.do")
    public String random(Integer id) {
        try {
            eventService.random(id);
        } catch (Exception e) {
            return "生成失败!";
        }
        return "200";
    }

}
