package com.handy.controller;

import com.handy.domain.SysLog;
import com.handy.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@RolesAllowed("ADMIN")
@Controller
@RequestMapping("/sysLog")
public class SysLogController {

    @Autowired
    private ISysLogService sysLogService;

    /**
     * 系统日记页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<SysLog> sysLogs = sysLogService.findAll();
        mv.addObject("sysLogs", sysLogs);
        mv.setViewName("syslog-list");
        return mv;
    }

    /**
     * 删除系统日记
     *
     * @param selectIds
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete.do")
    public String delete(String[] selectIds) throws Exception {
        sysLogService.delete(selectIds);
        return "redirect:findAll.do";
    }

}
