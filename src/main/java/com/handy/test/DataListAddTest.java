//package com.handy.test;
//
//import com.handy.dao.*;
//import com.handy.domain.*;
//import com.handy.utils.Random.RandomIDcard;
//import com.handy.utils.Random.RandomUtils;
//import org.apache.ibatis.session.SqlSession;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import java.util.Date;
//import java.util.UUID;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
//public class DataListAddTest {
//
//    @Autowired
//    EventMapper eventMapper;
//
//    @Autowired
//    SqlSession sqlSession;
//
//    @Autowired
//    UserMapper userMapper;
//
//    @Autowired
//    TeacherMapper teacherMapper;
//
//    @Autowired
//    StudentMapper studentMapper;
//
//    @Autowired
//    EquipmentMapper equipmentMapper;
//
//    @Autowired
//    RoleUserMapper roleUserMapper;
//
//
//    @Test
//    public void eventadd() {
//        /**
//         * 比赛项目event生成
//         */
//        EventMapper mapper = sqlSession.getMapper(EventMapper.class);
//        Boolean b;
//        for (int i = 1; i <= 10; i++) {
//            String eid = UUID.randomUUID().toString().substring(0, 5) + i;
//            b = ((int) (Math.random() * 10) > 5 ? 1 : 0) != 0;
//            mapper.insert(new Event(eid, "第二田径场", b, new Date(), new Date(), new Date(), 2019, "待定", "201624131224"));
//        }
//        System.out.println("批量完成");
//    }
//
//
//    @Test
//    public void useradd() {
//        /**
//         * user表学号密码批量生成
//         */
//        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
//        for (long i = 201624131201l; i <= 201624131500l; i++) {
//            userMapper.insert(new User(String.valueOf(i), "000000", true));
//        }
//        System.out.println("finished");
//    }
//
//
//    @Test
//    public void useradd2() {
//        /**
//         * user表教工号密码批量生成
//         */
//        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
//        for (long i = 10100010l; i <= 10100210l; i++) {
//            userMapper.insert(new User(String.valueOf(i), "123456", true));
//        }
//        System.out.println("finished");
//
//    }
//
//    @Test
//    public void studentadd() {
//        /**
//         * student学生信息表数据生成
//         */
//        StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
//        Boolean b;
//        RandomIDcard randomIDcard = new RandomIDcard();
//        for (int i = 301; i <= 360; i++) {
//            b = ((int) (Math.random() * 10) > 5 ? 1 : 0) != 0;
//            studentMapper.insert(new Student(String.valueOf(i + 201624131200l), RandomUtils.getChineseName(), b, 6, RandomUtils.getTelephone(), RandomUtils.getEmail(5, 10), randomIDcard.getRandomID()));
//        }
//        System.out.println("finished");
//    }
//
//
//    @Test
//    public void teacheradd() {
//        /**
//         * teacher表数据生成
//         */
//        TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
//        Boolean b;
//        RandomIDcard randomIDcard = new RandomIDcard();
//        for (int i = 10100011; i <= 10100210; i++) {
//            b = ((int) (Math.random() * 10) > 5 ? 1 : 0) != 0;
//            teacherMapper.insert(new Teacher(String.valueOf(i), RandomUtils.getChineseName(), b, "讲师", RandomUtils.getTelephone(), RandomUtils.getEmail(5, 10), randomIDcard.getRandomID()));
//        }
//        System.out.println("finished");
//    }
//
//    @Test
//    public void equipmentadd() {
//
//        /**
//         * Equipment表数据随机生成
//         */
//        EquipmentMapper equipmentMapper = sqlSession.getMapper(EquipmentMapper.class);
//        for (int i = 21; i < 31; i++) {
//            equipmentMapper.insert(new Equipment(RandomUtils.getChineseName(), RandomUtils.getModel(5, 5), "体育馆一楼104", (int) (Math.random() * 100) + 1, new Date()));
//        }
//    }
//
////    @Test
////    public void borrowadd() {
////        /**
////         * borrow表数据
////         */
////        BorrowMapper borrowMapper = sqlSession.getMapper(BorrowMapper.class);
////        for (long i = 1; i < 20; i++) {
////            borrowMapper.insert(new Borrow(String.valueOf(i + 201624131200l), (int) (Math.random() * (30 - 1)) + 1, (int) (Math.random() * (40 - 1)) + 1, new Date(), null, false, "上课需要"));
////        }
////
////    }
//
////    @Test
////    public void roleUserAdd() {
////        RoleUserMapper roleUserMapper = sqlSession.getMapper(RoleUserMapper.class);
//////        for (long i=201624131201l; i<2016241312500l; i++){
//////            roleUserMapper.insert(new RoleUser(1,String.valueOf(i)));
//////        }
////        for (long i = 10100011l; i < 10100209l; i++) {
////            roleUserMapper.insert(new RoleUser(1, String.valueOf(i)));
////        }
////
////    }
//
//}
