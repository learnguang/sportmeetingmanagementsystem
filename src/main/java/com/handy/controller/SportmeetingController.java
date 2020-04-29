package com.handy.controller;

import com.handy.domain.Broadcast;
import com.handy.domain.Event;
import com.handy.domain.Matches;
import com.handy.domain.Sportmeeting;
import com.handy.service.SportmeetingService;
import com.handy.utils.Excel.ExcelExportUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sportmeeting")
public class SportmeetingController {

    @Autowired
    private SportmeetingService sportmeetingService;

    /**
     * 查询所有运动会开幕信息
     *
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<Sportmeeting> sportmeetingList = sportmeetingService.findAll();
        mv.addObject("sportmeeting", sportmeetingList);
        mv.setViewName("sportmeeting-list");
        return mv;
    }

    /**
     * 删除运动会信息
     *
     * @param sId
     * @return
     */
    @RequestMapping("/deleteByPK.do")
    public void deleteByIds(Integer[] sId) {
        sportmeetingService.deleteByPK(sId);
    }

    /**
     * 查询运动会详细信息
     *
     * @param sId
     * @return
     */
    @RequestMapping("/findDetailsBysId.do")
    public ModelAndView findDetailsBysId(Integer sId) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = sportmeetingService.findDetailsBysId(sId);
        Sportmeeting sportmeeting = (Sportmeeting) map.get("sportmeeting");
        List<Broadcast> broadcastList = (List<Broadcast>) map.get("broadcastList");
        List<Event> eventList = (List<Event>) map.get("eventList");
        List<Matches> matchesList = (List<Matches>) map.get("matchesList");
        mv.addObject("event", eventList);
        mv.addObject("matches", matchesList);
        mv.addObject("broadcast", broadcastList);
        mv.addObject("sportmeeting", sportmeeting);
        mv.setViewName("sportmeeting-details");
        return mv;
    }

    /**
     * 根据id查询项目
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/findBysId.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
    public Sportmeeting findProjectById(@RequestParam(name = "id") Integer id) {
        return sportmeetingService.findBysId(id);
    }


    /**
     * 新建一场运动会
     *
     * @param sportmeeting
     * @return
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insert(@RequestBody Sportmeeting sportmeeting) {
        try {
            sportmeetingService.insert(sportmeeting);
        } catch (Exception e) {
            return "新增失败！";
        }
        return "200";
    }

    /**
     * 修改运动会开幕信息
     *
     * @param sportmeeting
     * @return
     */
    @RequestMapping(value = "/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(@RequestBody Sportmeeting sportmeeting) {
        System.out.println(sportmeeting);
        try {
            sportmeetingService.update(sportmeeting);
        } catch (Exception e) {
            return "修改失败!";
        }
        return "200";
    }

    /**
     * 运动会开幕信息管理页面
     *
     * @return
     */
    @RequestMapping("/manage.do")
    public ModelAndView add() {
        ModelAndView mv = new ModelAndView();
        List<Sportmeeting> sportmeetingList = sportmeetingService.findAll();
        mv.addObject("sportmeeting", sportmeetingList);
        mv.setViewName("sportmeeting-manage");
        return mv;
    }

    /**
     * 运动会开幕信息导出
     *
     * @param response
     * @throws Exception
     */
    @RequestMapping("/export.do")
    public void exportExcelStyle(HttpServletResponse response) throws Exception {
        List<Sportmeeting> sportmeetings = sportmeetingService.exportExcel();
        ExcelExportUtil excelExportUtil = new ExcelExportUtil();
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("classFilePath", "/excel/template.xlsx");
        params.put("styleIndex", 2);
        params.put("rowIndex", 2);
        params.put("objs", sportmeetings);
        params.put("fileName", "s.xlsx");
        excelExportUtil.export(response, params);
    }

    /**
     * 修改运动会的状态
     *
     * @param Id
     * @param Status
     * @return
     */
    @RequestMapping("updateStatus.do")
    public String updateStatus(Integer Id, Boolean Status) {
        sportmeetingService.updateStatus(Id, Status);
        return "redirect:manage.do";
    }

    /**
     * 本届运动会的信息管理
     *
     * @param sId
     * @return
     */
    @RequestMapping("/manageFindDetailsBysId.do")
    public ModelAndView manageFindDetailsBysId(Integer sId) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = sportmeetingService.findDetailsBysId(sId);
        Sportmeeting sportmeeting = (Sportmeeting) map.get("sportmeeting");
        List<Broadcast> broadcastList = (List<Broadcast>) map.get("broadcastList");
        List<Event> eventList = (List<Event>) map.get("eventList");
        List<Matches> matchesList = (List<Matches>) map.get("matchesList");
        mv.addObject("event", eventList);
        mv.addObject("matches", matchesList);
        mv.addObject("broadcast", broadcastList);
        mv.addObject("sportmeeting", sportmeeting);
        mv.setViewName("sportmeeting-manage-details");
        return mv;
    }

    /**
     * 遍历所有运动会到选择框上
     *
     * @return
     */
    @RequestMapping(value = "/findAllSportmeetings.do", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<Sportmeeting> findAllSportmeetings() {
        return sportmeetingService.findAllSportmeetings();
    }

}
