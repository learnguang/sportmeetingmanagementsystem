package com.handy.controller;

import com.handy.annotation.FormToken;
import com.handy.domain.Borrow;
import com.handy.domain.Matches;
import com.handy.domain.Student;
import com.handy.service.StudentService;
import com.handy.utils.Excel.ExcelExportUtil;
import com.handy.utils.Excel.ExcelImportUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RolesAllowed("ADMIN")
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;


//    /**
//     * 查询所有学生信息，通过PageHelper进行封装
//     *
//     * @param page
//     * @param size
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping("/findAll.do")
//    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "50") Integer size) throws Exception {
//        ModelAndView mv = new ModelAndView();
//        List<Student> studentList = studentService.findAll(page, size);
//        PageInfo pageInfo = new PageInfo(studentList);
//        mv.addObject("pageInfo", pageInfo);
//        mv.setViewName("student-list");
//        return mv;
//    }


    /**
     * 查询所有学生信息
     *
     * @return
     */
    @FormToken(save = true)//添加session 防止表单重复提交，在进入列表的时候添加session，在保存项目的时候通过识别session就能防止表单重复提交
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<Student> studentList = studentService.findAll();
        mv.addObject("student", studentList);
        mv.setViewName("student-list");
        return mv;
    }


    /**
     * 删除学生信息
     *
     * @param sNo
     * @return
     */
    @RequestMapping("/deleteByPK.do")
    public String deleteByIds(String[] sNo) {
        studentService.deleteByPK(sNo);
        return "redirect:findAll.do";
    }

    /**
     * 查询学生详细信息
     *
     * @param sId
     * @return
     */
    @RequestMapping("/findDetailsBysId.do")
    public ModelAndView findDetailsBysId(Integer sId) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = studentService.findDetailsBysId(sId);
        Student student = (Student) map.get("student");
        List<Matches> matchesList = (List<Matches>) map.get("matchesList");
        List<Borrow> borrowList = (List<Borrow>) map.get("borrowList");
        mv.addObject("borrow", borrowList);
        mv.addObject("matches", matchesList);
        mv.addObject("student", student);
        mv.setViewName("student-details");
        return mv;
    }

    /**
     * 根据id查询学生信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById.do", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    @ResponseBody
    public Student findById(@RequestParam(name = "id") Integer id) {
        return studentService.findById(id);
    }

    /**
     * 插入学生信息
     *
     * @param student
     * @return
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insert(@RequestBody Student student) {
        try {
            studentService.insert(student);
        } catch (Exception e) {
            return "新增失败！";
        }
        return "200";
    }

    /**
     * 修改学生信息
     *
     * @param student
     * @return
     */
    @RequestMapping(value = "/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(@RequestBody Student student) {
        try {
            studentService.update(student);
        } catch (Exception e) {
            return "修改失败!";
        }
        return "200";
    }

    /**
     * 遍历所有学生信息到选择框里
     *
     * @return
     */
    @RequestMapping(value = "/findAllStudents.do", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<Student> findAllStudents() {
        return studentService.findAllStudents();
    }

    /**
     * 导出学生信息到Excel
     *
     * @param response
     * @throws Exception
     */
    @RequestMapping("/exportToExcel.do")
    public void exportExcelStyle(HttpServletResponse response) throws Exception {
        List<Student> students = studentService.exportExcel();
        ExcelExportUtil excelExportUtil = new ExcelExportUtil();
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("classFilePath", "excel/template.xlsx");
        params.put("styleIndex", 1);
        params.put("rowIndex", 2);
        params.put("objs", students);
        params.put("fileName", "学生表.xlsx");
        excelExportUtil.export(response, params);
    }


    @RequestMapping("/uploadExcel")
    public String fileUpload(MultipartFile uploadFile, Model model){
        try {
            ExcelImportUtil<Student> excelImportUtil=new ExcelImportUtil<>();
            List<Student> students = excelImportUtil.excelImportUtil(uploadFile.getInputStream(), Student.class, 1);
            studentService.importExcel(students);
            model.addAttribute("result","上传成功");
        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("result","上传失败");
        }
        return "uploadsuccess";
    }
    
}
