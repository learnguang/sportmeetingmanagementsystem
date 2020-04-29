package com.handy.controller;

import com.handy.domain.Borrow;
import com.handy.domain.Equipment;
import com.handy.service.BorrowService;
import com.handy.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/borrow")
public class BorrowController {

    @Autowired
    private BorrowService borrowService;

    @Autowired
    private EquipmentService equipmentService;

    /**
     * 借还信息管理
     *
     * @return
     */
    @RequestMapping("/manage.do")
    public ModelAndView manage() {
        ModelAndView mv = new ModelAndView();
        List<Borrow> borrowList = borrowService.findAll();
        mv.addObject("borrow", borrowList);
        mv.setViewName("borrow-manage");
        return mv;
    }

    /**
     * 借出列表
     *
     * @return
     */
    @RequestMapping("/borrow.do")
    public ModelAndView borrow() {
        ModelAndView mv = new ModelAndView();
        List<Equipment> equipmentList = equipmentService.findAll();
        mv.addObject("equipment", equipmentList);
        mv.setViewName("borrow");
        return mv;
    }

    /**
     * 归还列表
     *
     * @return
     */
    @RequestMapping("/return.do")
    public ModelAndView returnTo() {
        ModelAndView mv = new ModelAndView();
        List<Borrow> borrowList = borrowService.findAllOff();
        mv.addObject("borrow", borrowList);
        mv.setViewName("return");
        return mv;
    }

    /**
     * 器材借出登记
     *
     * @param borrow
     * @return
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insert(@RequestBody Borrow borrow) {
        try {
            borrowService.insert(borrow);
        } catch (Exception e) {
            return "新增失败！";
        }
        return "200";
    }


    /**
     * 删除借还记录
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteById.do")
    public String deleteByIds(Integer[] id) {
        borrowService.deleteById(id);
        return "redirect:manage.do";
    }

    /**
     * 器材归还登记
     *
     * @param id
     * @return
     */
    @RequestMapping("/update.do")
    public String update(Integer[] id) {
        borrowService.update(id);
        return "redirect:return.do";
    }

}
