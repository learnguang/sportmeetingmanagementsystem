//package com.handy.test;
//
//import com.handy.dao.*;
//import com.handy.domain.*;
//import com.handy.service.*;
//import org.apache.ibatis.session.SqlSession;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import java.util.List;
//import java.util.Map;
//
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
//public class AnnotationCRUDTest {
//
//
//    @Autowired
//    private SqlSession sqlSession;
//
//    @Autowired
//    private StudentService studentService;
//
//    @Autowired
//    private UserService userService;
//
//    @Autowired
//    private MatchesService matchesService;
//
//    @Autowired
//    private SportmeetingService sportmeetingService;
//
//
//    @Autowired
//    private BroadcastMapper broadcastMapper;
//
//    @Autowired
//    private MatchesMapper matchesMapper;
//
//    @Autowired
//    private EventService eventService;
//
//    @Autowired
//    private BorrowService borrowService;
//
//    @Autowired
//    private DepartmentService departmentService;
//
//    @Autowired
//    private DepartmentMapper departmentMapper;
//
//    @Autowired
//    private ClassesMapper classesMapper;
//
//    @Autowired
//    private UserMapper userMapper;
//
//    @Autowired
//    private SportmeetingMapper sportmeetingMapper;
//
//
//    /**
//     * 测试student的findall方法
//     */
//    @Test
//    public void testStudentFindAll() {
//        StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
//        List<Student> studentList = studentMapper.findAll();
//        for (Student s : studentList)
//            System.out.println(s);
//    }
//
//    @Test
//    public void testStudentDelByPK() {
//        StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
//        Integer[] sId = {71, 72, 73};
//        studentService.deleteByPK(sId);
//    }
//
//    @Test
//    public void testFindDetailsBysId() {
//        StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
//        Map<String, Object> map = studentService.findDetailsBysId(1);
//        Student student = (Student) map.get("student");
//        System.out.println(student);
//
//        //Student(sId=1, sNo=201624131201, sName=闻青美, sGender=true, sGenderStr=男, sClassid=1, sPhone=13600264709, sEmail=dvww8la9td2tf3cs3k@qq.com, sIdcard=360308200001217206, c=Class(cId=1, cName=16科技2班, cHeadmasterid=2, cMajor=计算机科学与技术, cDeptid=1))
//    }
//
//
//    @Test
//    public void testonetomany() {
//        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
//        User userList = userMapper.selectByPK("201624131201");
//        System.out.println(userList);
//    }
//
//    @Test
//    public void test1() {
//        Map<String, Object> map = studentService.findDetailsBysId(1);
//        Student student = (Student) map.get("student");
//
//        List<Matches> matchesList = (List<Matches>) map.get("matchesList");
//        List<Borrow> borrowList = (List<Borrow>) map.get("borrowList");
//    }
//
//    @Test
//    public void test2() {
//        StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
//        String val = studentMapper.selectsNoBysId(1);
//    }
//
//
//    @Test
//    public void test4() {
////        Map<String, Object> map = scoreService.findDetailsBysId(1);
////        Score score = (Score) map.get("score");
//        Map<String, Object> map = sportmeetingService.findDetailsBysId(2018);
//
//        Sportmeeting sportmeeting = (Sportmeeting) map.get("sportmeeting");
//
//    }
//
//    @Test
//    public void test5() {
//        List<Broadcast> broadcastVoList = broadcastMapper.selectBroadcastByS();
//        for (Broadcast b : broadcastVoList)
//            System.out.println(b);
//    }
//
//    @Test
//    public void test6() {
////        List<Matches> matchesList = matchesMapper.selectBymEid(5);
//        Map<String, Object> map = eventService.findDetailsByeId(5);
//        Event event = (Event) map.get("event");
//        List<Matches> matchesList = (List<Matches>) map.get("matches");
//    }
//
//    @Test
//    public void test7() {
//        List<Borrow> borrowList = borrowService.selectByeId(1);
//
//    }
//
//    @Test
//    public void test8() {
//        Map<String, Object> map = departmentService.findDetailsBydId(2);
//        Department department = (Department) map.get("department");
//        List<Classes> classesList = (List<Classes>) map.get("classesList");
//    }
//
////    @Test
////    public void test9(){
////        User u = userMapper.selectByPKToLogin("admin");
////        List<Role> roleList = userMapper.selectrNameByuId("admin");
////
////        getAuthority("admin");
////    }
//
////    public List<SimpleGrantedAuthority> getAuthority(String uId)
////    {
////        List<SimpleGrantedAuthority> list = new ArrayList<>();
////        List<Role> roleList = userMapper.selectrNameByuId(uId);
////        for (Role role:roleList){
////            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRName()));
////        }
////
////        return list;
////    }
//
//    @Test
//    public void test10() {
//        Student student = userService.findSDetails("201624131201");
//    }
//
//    @Test
//    public void test11() {
//        String password = userMapper.selectPW("admin");
//
//        userMapper.updatePW("admin", "admin");
//    }
//
//    @Test
//    public void test12() {
//
//        List<User> userList = userMapper.findAll();
//    }
//
//
//
//}
