package com.handy.controller;

import com.handy.domain.Broadcast;
import com.handy.service.BroadcastService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/broadcast")
public class BroadcastController {

    @Autowired
    private BroadcastService broadcastService;


    /**
     * 广播列表
     *
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<Broadcast> broadcastList = broadcastService.selectBroadcastByS();
        mv.addObject("broadcast", broadcastList);
        mv.setViewName("broadcast-list");
        return mv;
    }

    /**
     * 根据id获取广播信息到模态框上
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
    public Broadcast findBybId(@RequestParam(name = "id") Integer id) {
        return broadcastService.findById(id);
    }

    /**
     * 根据id删除广播信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteById.do")
    public String deleteByIds(Integer[] id) {
        broadcastService.deleteById(id);
        return "redirect:manage.do";
    }

    /**
     * 首页跳转
     *
     * @return
     */
    @RequestMapping("main.do")
    public ModelAndView main() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main");
        return mv;
    }

    /**
     * 广播管理界面
     *
     * @return
     */
    @RequestMapping("/manage.do")
    public ModelAndView manage() {
        ModelAndView mv = new ModelAndView();
        List<Broadcast> broadcastList = broadcastService.findAll();
        mv.addObject("broadcast", broadcastList);
        mv.setViewName("broadcast-manage");
        return mv;
    }

    /**
     * 新增广播信息
     *
     * @param broadcast
     * @return
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insert(@RequestBody Broadcast broadcast) {
        try {
            broadcastService.insert(broadcast);
        } catch (Exception e) {
            return "新增失败！";
        }
        return "200";
    }

    /**
     * 修改广播信息
     *
     * @param broadcast
     * @return
     */
    @RequestMapping(value = "/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(@RequestBody Broadcast broadcast) {
        System.out.println(broadcast);
        try {
            broadcastService.update(broadcast);
        } catch (Exception e) {
            return "修改失败!";
        }
        return "200";
    }


}
