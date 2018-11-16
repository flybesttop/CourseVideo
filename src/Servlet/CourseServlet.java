package Servlet;


import com.artclub.dao.*;
import com.artclub.model.*;
import com.zlzkj.core.util.Fn;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CourseServlet {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    ac_courseMapper ac_courseMapper = (com.artclub.dao.ac_courseMapper) context.getBean("ac_course");
    ac_teacher_courseMapper ac_teacher_courseMapper = (com.artclub.dao.ac_teacher_courseMapper) context.getBean("ac_teacher_course");
    ac_relationshipsMapper ac_relationshipsMapper = (com.artclub.dao.ac_relationshipsMapper) context.getBean("ac_relationships");
    ac_course_videoMapper ac_course_videoMapper = (com.artclub.dao.ac_course_videoMapper) context.getBean("ac_course_video");
    ac_course_objectMapper ac_course_objectMapper = (com.artclub.dao.ac_course_objectMapper) context.getBean("ac_course_object");
    ac_teacherMapper ac_teacherMapper = (com.artclub.dao.ac_teacherMapper) context.getBean("ac_teacher");

    @RequestMapping("/creatcourse")
    public String creatcourse(Model model, HttpSession session) {
        ac_user user=(ac_user) session.getAttribute("nowUser");
        if(user!=null){
            String lastIp=user.getAcUserLastip();
            String str[]=lastIp.split("-");
            String courseId=str[0];
            String chapter=str[1];
            String episode=str[2];
            model.addAttribute("lastCourseId",courseId);//获取用户上一次登录的课程id
            ac_course course=ac_courseMapper.selectByPrimaryKey(Integer.parseInt(courseId));
            model.addAttribute("lastChapter",chapter);
            model.addAttribute("lastEpidode",episode);
            model.addAttribute("lastCourse",course);
        }
        List<ac_relationships> ac_relationshipslevel1=ac_relationshipsMapper.selectByLeveL1();
        model.addAttribute("bestObjs",ac_relationshipslevel1);
        return "creatcourse";
    }

    @RequestMapping("/getAllCourse")
    public void getAllCourse(HttpServletResponse response, int id) {
        ac_teacher teacher = ac_teacherMapper.selectByUid(id);
        List<ac_teacher_course> teacher_course = ac_teacher_courseMapper.selectByTid(teacher.getAcTeacherId());
        List<ac_course> courses = new ArrayList<ac_course>();
        for (int i = 0; i < teacher_course.size(); i++) {
            ac_course course = ac_courseMapper.selectByPrimaryKey(teacher_course.get(i).getAcTeacherCourseCourseid());
            List<ac_course_object> object = ac_course_objectMapper.selectByCourseId(course.getAcCourseId());
            ac_relationships relationships = ac_relationshipsMapper.selectByItemId(object.get(0).getAcCourseObjectObjectid());
            ac_relationships relationships1 = ac_relationshipsMapper.selectByPrimaryKey(relationships.getAcRelationshipsParendid());
            course.setLv1Name(relationships1.getAcRelationshipsItemname());
            course.setLv2Name(relationships.getAcRelationshipsItemname());
            courses.add(course);
        }
        Fn.ajaxReturn(response, courses, "加载完毕", 1);
    }

    @RequestMapping("/getAllRelations")
    public void getAllRelations(HttpServletResponse response) {
        List<ac_relationships> relationships = ac_relationshipsMapper.selectAll();
        Fn.ajaxReturn(response, relationships);
    }

    @RequestMapping("/getAllChapter")
    public void getAllChapter(HttpServletResponse response, int id) {
        List<ac_course_video> course_videos = ac_course_videoMapper.selectByCourseId(id);
        Fn.ajaxReturn(response, course_videos);
    }

    @RequestMapping(value = "/addCourse")
    public void addCourse(HttpServletResponse response, String id, String img, String courseName, String price, String lv2, String context) {
        ac_teacher teacher = ac_teacherMapper.selectByUserId(id);
        ac_course course = new ac_course();
        course.setAcCourseImg(img);
        course.setAcCoursePlace("Internet");
        course.setAcCourseContext(context);
        course.setAcCourseNum("无限制");
        course.setAcCourseName(courseName);
        course.setAcCourseMoney(price);
        course.setAcCourseTime("Internet");
        course.setAcCoursePicknum(0);
        course.setAcCourseImg("img/trash/5.png");
        course.setAcCourseStatus("2");
        ac_courseMapper.insert(course);

        ac_course_object object = new ac_course_object();
        object.setAcCourseObjectCoursename(courseName);
        object.setAcCourseObjetcAddtime(String.valueOf(Fn.time()));
        object.setAcCourseObjectObjectid(Integer.valueOf(lv2));
        object.setAcCourseObjectCourseid(course.getAcCourseId());
        ac_course_objectMapper.insert(object);
        ac_teacher_course teacher_course = new ac_teacher_course();
        teacher_course.setAcTeacherCourseTeacherid(teacher.getAcTeacherId());
        teacher_course.setAcTeacherCourseTime("Internet");
        teacher_course.setAcTeacherCourseCourseid(course.getAcCourseId());
        ac_teacher_courseMapper.insert(teacher_course);
        Fn.ajaxReturn(response, "", "插入完成", 1);

    }

    @RequestMapping(value = "/addCourseVideo")
    public void addCourseVideo(HttpServletResponse response, int courseId, String videoPath, String title, String chapter, String episode, String parentChapter, String pptPath, String context) {
        ac_course_video course_video = new ac_course_video();
        course_video.setAcVideoCourseTitle(title);
        course_video.setAcVideoCourseCourseid(courseId);
        course_video.setAcVideoCourseLikes(context);
        course_video.setAcVideoCourseStatus(2);
        course_video.setAcVideoCourseChapter(chapter);
        course_video.setAcVideoCourseFile(pptPath);
        course_video.setAcVideoCourseEpisode(episode);
        course_video.setAcVideoCourseUrl(videoPath);
        course_video.setAcVideoCourseTime(String.valueOf(com.zlzkj.core.util.Fn.time()));
        if (episode == null) {
            course_video.setAcVideoCourseParentchapter("0");
        } else {
            course_video.setAcVideoCourseParentchapter(parentChapter);
        }
        ac_course_videoMapper.insert(course_video);
        com.zlzkj.core.util.Fn.ajaxReturn(response, "", "插入完毕", 1);
    }
}
    