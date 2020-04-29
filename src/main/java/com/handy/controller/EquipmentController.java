package com.handy.controller;

import com.handy.domain.Borrow;
import com.handy.domain.Equipment;
import com.handy.service.BorrowService;
import com.handy.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/equipment")
public class EquipmentController {

    @Autowired
    private EquipmentService equipmentService;

    @Autowired
    private BorrowService borrowService;


    /**
     * 查询所有运动器材信息
     *
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<Equipment> equipmentList = equipmentService.findAll();
        mv.addObject("equipment", equipmentList);
        mv.setViewName("equipment-list");
        return mv;
    }

    /**
     * 器材借还记录
     *
     * @param eId
     * @return
     */
    @RequestMapping("/findDetailsByeId.do")
    public ModelAndView findDetailsByeId(Integer eId) {
        ModelAndView mv = new ModelAndView();
        List<Borrow> borrowList = borrowService.selectByeId(eId);
        mv.addObject("borrow", borrowList);
        mv.setViewName("equipment-details");
        return mv;
    }

    /**
     * 器材管理
     *
     * @return
     */
    @RequestMapping("/manage.do")
    public ModelAndView manage() {
        ModelAndView mv = new ModelAndView();
        List<Equipment> equipmentList = equipmentService.findAll();
        mv.addObject("equipment", equipmentList);
        mv.setViewName("equipment-manage");
        return mv;
    }

    /**
     * 器材购入
     *
     * @param equipment
     * @return
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insert(@RequestBody Equipment equipment) {
        try {
            equipmentService.insert(equipment);
        } catch (Exception e) {
            return "新增失败！";
        }
        return "200";
    }

    /**
     * 器材信息修改
     *
     * @param equipment
     * @return
     */
    @RequestMapping(value = "/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(@RequestBody Equipment equipment) {
        System.out.println(equipment);
        try {
            equipmentService.update(equipment);
        } catch (Exception e) {
            return "修改失败!";
        }
        return "200";
    }

    /**
     * 遍历器材列表
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
    public Equipment findById(@RequestParam(name = "id") Integer id) {
        return equipmentService.findById(id);
    }

    /**
     * 删除器材
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteById.do")
    public String deleteByIds(Integer[] id) {
        equipmentService.deleteById(id);
        return "redirect:manage.do";
    }


}
