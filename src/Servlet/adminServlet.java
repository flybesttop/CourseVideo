package Servlet;


import com.artclub.dao.*;
import com.artclub.model.*;
import com.artclub.util.Comments;
import com.artclub.util.SensitiveWord;
import com.artclub.util.courseChapter;
import com.sun.org.apache.regexp.internal.RE;
import com.zlzkj.core.util.Fn;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.text.SimpleDateFormat;
import java.util.*;

import com.alibaba.fastjson.JSON;


@Controller
public class adminServlet {
    static ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");
    static ac_video_assessMapper ac_video_assessMapper = (ac_video_assessMapper)act.getBean("ac_video_assess");
    static ac_studentvideoMapper ac_studentvideoMapper = (ac_studentvideoMapper) act.getBean("ac_studentvideo");
    static ac_resumeMapper ac_resumeMapper = (ac_resumeMapper) act.getBean("ac_resume");
    static ac_course_videoMapper ac_course_videoMapper=(ac_course_videoMapper) act.getBean("ac_course_video");
    static ac_newsMapper ac_newsMapper=(ac_newsMapper) act.getBean("ac_news");
    static ac_userMapper ac_userMapper=(ac_userMapper) act.getBean("ac_user");
    static ac_relationshipsMapper ac_relationshipsMapper= (ac_relationshipsMapper) act.getBean("ac_relationships");
    static ac_courseMapper ac_courseMapper=(ac_courseMapper)act.getBean("ac_course");
    static ac_course_objectMapper ac_course_objectMapper= (ac_course_objectMapper) act.getBean("ac_course_object");
    static ac_objectCourseMapper ac_objectCourseMapper=(ac_objectCourseMapper)act.getBean("ac_objectCourse");
    static ac_teacherMapper ac_teacherMapper=(ac_teacherMapper)act.getBean("ac_teacher");
    static ac_student_courseMapper ac_student_courseMapper=(ac_student_courseMapper) act.getBean("ac_student_course");
    static ac_messageMapper ac_messageMapper=(ac_messageMapper)act.getBean("ac_message");
    static ac_commentsMapper ac_commentsMapper=(ac_commentsMapper) act.getBean("ac_comments");
    SensitiveWord wordFilter = new SensitiveWord();

    public static void main(String[] args) {

        System.out.println();
    }
    @RequestMapping(value = "openvideo")
    public String openvideo(Model model,String courseId,String chapterId,String episodeId,String userId){
        if(userId!=null){
            String lastIP=courseId+"-"+chapterId+"-"+episodeId;
            ac_user user=ac_userMapper.selectByPrimaryKey(Integer.parseInt(userId));
            user.setAcUserLastip(lastIP);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINESE);
            Date date = new Date();
            String dateStr = sdf.format(date);
            user.setAcUserLastlointime(dateStr);
            ac_userMapper.updateByPrimaryKeySelective(user);
            String str[]=lastIP.split("-");
            String courseIdI=str[0];
            String chapter=str[1];
            String episode=str[2];
            model.addAttribute("lastCourseId",courseIdI);//获取用户上一次登录的课程id
            ac_course course=ac_courseMapper.selectByPrimaryKey(Integer.parseInt(courseIdI));
            model.addAttribute("lastChapter",chapter);
            model.addAttribute("lastEpidode",episode);
            model.addAttribute("lastCourse",course);
        }

        List<ac_relationships> ac_relationshipslevel1=ac_relationshipsMapper.selectByLeveL1();
        model.addAttribute("bestObjs",ac_relationshipslevel1);
        Map map1=new HashMap();
        map1.put("courseId",courseId);
        map1.put("chapterId",chapterId);
        map1.put("episodeId",episodeId);
        ac_course_video course_video=ac_course_videoMapper.selectEpisodeByCourseIdAndChapterIdAndEpisode(map1);
        ac_teacher teacher=ac_teacherMapper.selectByCourseId(Integer.parseInt(courseId));
        ac_user tUser=ac_userMapper.selectByPrimaryKey(teacher.getAcTeacherUserid());
        List<ac_course> tCourses=ac_courseMapper.selectByTeacherId(teacher.getAcTeacherId());

        List<ac_course_video> ac_course_videoChapters=ac_course_videoMapper.selectChapterByCourseId(Integer.parseInt(courseId));
        int preEpisodeId=Integer.parseInt(episodeId)-1;//上一个视频的节数
        int preChapterId=Integer.parseInt(chapterId);//上一个视频的章数
        if(preEpisodeId==0){
            preChapterId-=1;
            if(preChapterId!=0){
                Map map2=new HashMap();
                map2.put("courseId",courseId);
                map2.put("chapterId",preChapterId);
                List<ac_course_video> ac_course_videoEpisodes=ac_course_videoMapper.selectEpisodeByCourseIdAndChapterId(map2);
                //获取上一章的总节数
                preEpisodeId=ac_course_videoEpisodes.size();
            }else{
                preChapterId=1;preEpisodeId=1;
            }
        }

        int nextEpisodeId=Integer.parseInt(episodeId)+1;//下一个视频的节数
        int nextChapterId=Integer.parseInt(chapterId);//下一个视频的章数
        List<ac_course_video> ac_course_videoDangQianChapter=ac_course_videoMapper.selectEpisodeByCourseIdAndChapterId(map1);
        //获取当前章的总节数
        if(nextEpisodeId==(ac_course_videoDangQianChapter.size()+1)){
            nextChapterId+=1;
            if(nextChapterId!=(ac_course_videoChapters.size()+1)){
                nextEpisodeId=1;
            }else{
                nextChapterId=Integer.parseInt(chapterId);
                nextEpisodeId=Integer.parseInt(episodeId);
            }
        }
        ac_course course=ac_courseMapper.selectByPrimaryKey(Integer.parseInt(courseId));
        model.addAttribute("preEpisodeId",preEpisodeId);
        model.addAttribute("preChapterId",preChapterId);
        model.addAttribute("nextEpisodeId",nextEpisodeId);
        model.addAttribute("nextChapterId",nextChapterId);

        model.addAttribute("courseVideo",course_video);
        model.addAttribute("teacher",teacher);
        model.addAttribute("tUser",tUser);
        model.addAttribute("tCourses",tCourses);
        model.addAttribute("course",course);
        model.addAttribute("nowCourseId",courseId);



        Map getlevel1map=new HashMap();
        getlevel1map.put("level",1);
        getlevel1map.put("start",0);
        getlevel1map.put("end",5);
        getlevel1map.put("courseId",courseId);
        List<Comments> level1Comments=new ArrayList<>();
        List<ac_comments> comments1=ac_commentsMapper.selectInPageAndCourseId(getlevel1map);
        for(ac_comments comments:comments1){
            Comments comment=new Comments();
            ac_user user=ac_userMapper.selectByPrimaryKey(comments.getAcCommentsFrom());
            comment.setUser(user);
            comment.setAc_comments(comments);
            comment.setChildcomments(new ArrayList<>());
            List<ac_comments> comments2=ac_commentsMapper.selectParentId(comments.getAcCommentsId());
            for(ac_comments commentss:comments2){
                Comments commentt=new Comments();
                ac_user userr=ac_userMapper.selectByPrimaryKey(commentss.getAcCommentsFrom());
                ac_user toUserr=ac_userMapper.selectByPrimaryKey(commentss.getAcCommentsTo());
                commentt.setUser(userr);
                commentt.setToUserName(toUserr.getAcUserUsername());
                commentt.setToUserId(toUserr.getAcUserId());
                commentt.setAc_comments(commentss);
                commentt.setChildcomments(new ArrayList<>());
                List<ac_comments> comments3=ac_commentsMapper.selectParentId(commentss.getAcCommentsId());
                for(ac_comments commentsss:comments3){
                    Comments commenttt=new Comments();
                    ac_user userrr=ac_userMapper.selectByPrimaryKey(commentsss.getAcCommentsFrom());
                    ac_user toUserrr=ac_userMapper.selectByPrimaryKey(commentsss.getAcCommentsTo());
                    commenttt.setUser(userrr);
                    commenttt.setToUserName(toUserrr.getAcUserUsername());
                    commenttt.setToUserId(toUserrr.getAcUserId());
                    commenttt.setAc_comments(commentsss);
                    commentt.getChildcomments().add(commenttt);
                }
                comment.getChildcomments().add(commentt);
            }
            level1Comments.add(comment);
        }//获取一级留言


        model.addAttribute("level1Comments",level1Comments);

//        List<ac_course_video> ac_course_videoEpisodes=ac_course_videoMapper.selectEpisodeByCourseIdAndChapterId(map);
        return "video";
    }

    @RequestMapping(value = "addcomments")
    public void addComments(HttpServletResponse response,int level,int from,int to,String pId,String message){
        if(pId==null){
            pId="0";
        }
        ac_comments comments=new ac_comments();
        comments.setAcCommentsFrom(from);
        comments.setAcCommentsParent(Integer.parseInt(pId));
        comments.setAcCommentsTo(to);
        comments.setAcCommentsMessage(message);
        comments.setAcCommentsLevel(level);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINESE);
        Date date = new Date();
        String dateStr = sdf.format(date);
        comments.setAcCommentsAddtime(dateStr);

        ac_commentsMapper.insertSelective(comments);

        Fn.ajaxReturn(response,null);

    }

    @RequestMapping(value = "index")
    public String index(Model model,HttpSession session){
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

        //主页新闻
        List<ac_news> allnewsifm=ac_newsMapper.selectALLfour();
        List<ac_news> allnews=ac_newsMapper.selectNewsfour();
        List<ac_news> allifm=ac_newsMapper.selectifmfour();
        ac_news newifm=ac_newsMapper.selectNewifm();
        model.addAttribute("allnewsifm",allnewsifm);
        model.addAttribute("allnews",allnews);
        model.addAttribute("allifm",allifm);
        model.addAttribute("newifm",newifm);

        //主页课程
        List<ac_course> fourNewcourses=ac_courseMapper.selectfourNew();
        List<ac_course> fourhotcourses=ac_courseMapper.selectfourhot();
        model.addAttribute("fourNewcourses",fourNewcourses);
        model.addAttribute("fourhotcourses",fourhotcourses);


        return "index";
    }




    @RequestMapping(value = "updateUserMessage")
    public void updateUserMessage(HttpServletResponse response,String userId,String email,String username){

        ac_user ac_user=ac_userMapper.selectByPrimaryKey(Integer.parseInt(userId));
        ac_user.setAcUserEmail(email);
        ac_user.setAcUserUsername(username);
        Fn.ajaxReturn(response,null);
    }





    @RequestMapping(value = "userinfo_buy")
    public String userinfo_buy(Model model,int userId,String pageNum){

        List<ac_relationships> ac_relationshipslevel1=ac_relationshipsMapper.selectByLeveL1();
        model.addAttribute("bestObjs",ac_relationshipslevel1);

        if(pageNum==null){
            pageNum="1";
        }

        List<ac_student_course> ac_student_courses=ac_student_courseMapper.selectByStuId(userId);
        model.addAttribute("hasCourseNum",ac_student_courses.size());

        ac_user user=ac_userMapper.selectByPrimaryKey(userId);//获取用户信息

        String lastIp=user.getAcUserLastip();
        String str[]=lastIp.split("-");
        String courseId=str[0];
        String chapter=str[1];
        String episode=str[2];
        model.addAttribute("page",pageNum);

        model.addAttribute("lastCourseId",courseId);//获取用户上一次登录的课程id
        ac_teacher ac_teacher=ac_teacherMapper.selectByCourseId(Integer.parseInt(courseId));//获取教师

        model.addAttribute("courseteacher",ac_teacher);
        ac_course course=ac_courseMapper.selectByPrimaryKey(Integer.parseInt(courseId));
        model.addAttribute("lastChapter",chapter);
        model.addAttribute("lastEpidode",episode);
        model.addAttribute("lastCourse",course);

        List<ac_course> courses=new ArrayList<>();
        for(ac_student_course student_course:ac_student_courses){
            courses.add(ac_courseMapper.selectByPrimaryKey(student_course.getAcStudentCourseCourseid()));
        }

        model.addAttribute("total",courses.size());
        List<ac_course> pageCourses=new ArrayList<>();
        for(int i=(Integer.parseInt(pageNum)-1)*12;i<(((Integer.parseInt(pageNum)-1)*12+12)>courses.size()?courses.size():((Integer.parseInt(pageNum)-1)*12+12));i++){
            pageCourses.add(courses.get(i));
        }
        model.addAttribute("pageCourses",pageCourses);
        return "userinfo_buy";
    }

    @RequestMapping(value = "userinfo")
    public String userinfo(String userId,Model model){

        List<ac_relationships> ac_relationshipslevel1=ac_relationshipsMapper.selectByLeveL1();
        model.addAttribute("bestObjs",ac_relationshipslevel1);

        List<ac_student_course> ac_student_courses=ac_student_courseMapper.selectByStuId(Integer.parseInt(userId));
        model.addAttribute("hasCourseNum",ac_student_courses.size());

        ac_user user=ac_userMapper.selectByPrimaryKey(Integer.parseInt(userId));//获取用户信息

        String lastIp=user.getAcUserLastip();
        String str[]=lastIp.split("-");
        String courseId=str[0];
        String chapter=str[1];
        String episode=str[2];


        model.addAttribute("lastCourseId",courseId);//获取用户上一次登录的课程id
        ac_teacher ac_teacher=ac_teacherMapper.selectByCourseId(Integer.parseInt(courseId));//获取教师

        model.addAttribute("courseteacher",ac_teacher);
        ac_course course=ac_courseMapper.selectByPrimaryKey(Integer.parseInt(courseId));
        model.addAttribute("lastChapter",chapter);
        model.addAttribute("lastEpidode",episode);
        model.addAttribute("lastCourse",course);
        Map map=new HashMap();
        map.put("courseId",courseId);
        map.put("chapterId",chapter);
        map.put("episodeId",episode);
//        ac_course_video courseVideo=ac_course_videoMapper.selectEpisodeByCourseIdAndChapterIdAndEpisode(map);
//        model.addAttribute("lastcourseVideo",courseVideo);
        return "userinfo";
    }



    @RequestMapping(value = "userinfo_message")
    public String userinfo_message(){
        return "userinfo_message";
    }

    @RequestMapping(value = "addCommentsViews")
    public void addCommentsViews(HttpServletResponse response,int level1commentsId){
        ac_comments comment=ac_commentsMapper.selectByPrimaryKey(level1commentsId);
        int i=Integer.parseInt(comment.getAcCommentsFromtable());
        comment.setAcCommentsFromtable(++i+"");
        ac_commentsMapper.updateByPrimaryKeySelective(comment);
        Fn.ajaxReturn(response,null);
    }


    /**
     * ac_comments
     * <p>
     * 添加评论 所以父节点为0 根据关键字进行筛选，如果有敏感词汇，那么需要人工审核
     *
     * @param message   评论信息
     * @param to        发给谁
     * @param level     等级0：评论 1：回复 2：对1的回复
     * @param fromwhom  谁发的
     */
    // test
    @RequestMapping(value = "/addComments")
    public void addComments(HttpServletResponse response, String message, int to, int level ,int fromwhom,int pId) {
        ac_comments ac_comments = new ac_comments();
        ac_comments.setAcCommentsAddtime(String.valueOf(Fn.time()));
        ac_comments.setAcCommentsMessage(message);
        ac_comments.setAcCommentsTo(to);
        ac_comments.setAcCommentsLevel(level);
        ac_comments.setAcCommentsFrom(fromwhom);
        Map map = wordFilter.CheckWord(message);
        // status = 0 说明有敏感词， =1 没有
        if (map.get("status").equals("0")) {
            ac_comments.setAcCommentsSeneitive((String) map.get("index"));
            ac_comments.setAcCommentsStatus(2);
        } else {
            ac_comments.setAcCommentsStatus(1);
        }
        if(level==1){
            ac_comments.setAcCommentsParent(0);
        }else if(level==2){
            ac_comments.setAcCommentsParent(pId);
        }else if(level==3){
            ac_comments.setAcCommentsParent(pId);
        }
        ac_commentsMapper.insert(ac_comments);
        Fn.ajaxReturn(response, "", "插入成功", 1);
    }

    @RequestMapping(value = "sendMessage")
    public void sendMessage(HttpServletResponse response,String courseId,String userId,String email,String message){
        ac_message sendmessage=new ac_message();
        sendmessage.setAcMessageAddtime(Fn.time()+"");
        sendmessage.setAcMessageFrom(userId);
        sendmessage.setAcMessageTo(courseId);
        String message1=email+" $$$ "+message;
        sendmessage.setAcMessageMessage(message1);
        ac_messageMapper.insertSelective(sendmessage);
        Fn.ajaxReturn(response,null);
    }

    @RequestMapping(value = "learing")
    public String learing(Model model,int courseId,HttpSession session){
        ac_user user=(ac_user) session.getAttribute("nowUser");
        if(user!=null){
            String lastIp=user.getAcUserLastip();
            String str[]=lastIp.split("-");
            String courseIdI=str[0];
            String chapter=str[1];
            String episode=str[2];
            model.addAttribute("lastCourseId",courseIdI);//获取用户上一次登录的课程id
            ac_course course=ac_courseMapper.selectByPrimaryKey(Integer.parseInt(courseIdI));
            model.addAttribute("lastChapter",chapter);
            model.addAttribute("lastEpidode",episode);
            model.addAttribute("lastCourse",course);
        }

        List<ac_relationships> ac_relationshipslevel1=ac_relationshipsMapper.selectByLeveL1();
        ac_course course=ac_courseMapper.selectByPrimaryKey(courseId);
        if(course.getAcCourseMoney().equals("0")){
            int i=course.getAcCoursePicknum();
            course.setAcCoursePicknum(++i);
            ac_courseMapper.updateByPrimaryKeySelective(course);
        }
        model.addAttribute("course",course);
        model.addAttribute("bestObjs",ac_relationshipslevel1);
        List<courseChapter> courseChapters=new ArrayList<>();
        List<ac_course_video> ac_course_videoChapters=ac_course_videoMapper.selectChapterByCourseId(courseId);
        for(ac_course_video ac_course_video:ac_course_videoChapters){
            courseChapter chapter=new courseChapter();
            chapter.setChapterId(Integer.parseInt(ac_course_video.getAcVideoCourseChapter()));
            chapter.setChapterName(ac_course_video.getAcVideoCourseTitle());
            chapter.setCourseId(ac_course_video.getAcVideoCourseCourseid());
            chapter.setChapterContext(ac_course_video.getAcVideoCourseLikes());
            Map map=new HashMap();
            map.put("courseId",chapter.getCourseId());
            map.put("chapterId",chapter.getChapterId());
            List<ac_course_video> ac_course_videoEpisodes=ac_course_videoMapper.selectEpisodeByCourseIdAndChapterId(map);
            chapter.setEpisodes(ac_course_videoEpisodes);
            courseChapters.add(chapter);
        }
        model.addAttribute("courseChapters",courseChapters);
        return "learing";
    }

    @RequestMapping(value = "insertcourse")
    public void insertcourse(HttpServletResponse response,int courseId,int userId){
        Map map=new HashMap();
        map.put("courseId",courseId);
        map.put("stuId",userId);
        ac_student_course ac_student_course=new ac_student_course();
        ac_student_course.setAcStudentCourseCourseid(courseId);
        ac_student_course.setAcStudentCoursePicktime(""+Fn.time());
        ac_student_course.setAcStudentCourseStuid(userId);
        ac_course course=ac_courseMapper.selectByPrimaryKeyPay(courseId);
        if(course!=null){
            int i=course.getAcCoursePicknum();
            course.setAcCoursePicknum(++i);
            ac_courseMapper.updateByPrimaryKeySelective(course);
        }
        ac_student_courseMapper.insertSelective(ac_student_course);
        Fn.ajaxReturn(response,null);
    }

    @RequestMapping(value = "checkHasCourse")
    public void checkHasCourse(HttpServletResponse response,int courseId,int userId){
        Map map=new HashMap();
        map.put("courseId",courseId);
        map.put("stuId",userId);
        ac_student_course ac_student_course=ac_student_courseMapper.selectByStuIdAndCourseId(map);
        if(ac_student_course==null){
            Fn.ajaxReturn(response,null,"还没有该课程",0);
        }else{
            Fn.ajaxReturn(response,null,"您已拥有该课程",1);
        }
    }

    @RequestMapping(value = "News")
    public String News(Model model,String status,String pageNum,HttpSession session){
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
        if(status==null){
            status="1";
        }
        if(pageNum==null){
            pageNum="1";
        }
        model.addAttribute("page",pageNum);
        model.addAttribute("status",status);
        if(status.equals("2")){
            Map map = new HashMap();
            map.put("page", 15 * (Integer.parseInt(pageNum) - 1));
            map.put("rows", 15);
            List<ac_news> ac_news=ac_newsMapper.selectInPageifm(map);
            List<ac_news> ac_allnews=ac_newsMapper.selectAllifm();
            model.addAttribute("total",ac_allnews.size());
            model.addAttribute("newss",ac_news);
            return "News";
        }else if(status.equals("3")){
            Map map = new HashMap();
            map.put("page", 15 * (Integer.parseInt(pageNum) - 1));
            map.put("rows", 15);
            List<ac_news> ac_news=ac_newsMapper.selectInPageNews(map);
            List<ac_news> ac_allnews=ac_newsMapper.selectAllNews();
            model.addAttribute("total",ac_allnews.size());
            model.addAttribute("newss",ac_news);
            return "News";
        }else{
            Map map = new HashMap();
            map.put("page", 15 * (Integer.parseInt(pageNum) - 1));
            map.put("rows", 15);
            List<ac_news> ac_news=ac_newsMapper.selectInPage(map);
            List<ac_news> ac_allnews=ac_newsMapper.selectAll();
            model.addAttribute("total",ac_allnews.size());
            model.addAttribute("newss",ac_news);
            return "News";
        }
    }

    @RequestMapping(value = "News_content")
    public String News_content(Model model,int NewsId,HttpSession session){
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
        ac_news ac_new=ac_newsMapper.selectByPrimaryKey(NewsId);
        int i=ac_new.getAcNewsViews();
        ac_new.setAcNewsViews(++i);
        ac_newsMapper.updateByPrimaryKey(ac_new);
        model.addAttribute("news",ac_new);
        return "News_content";
    }


    @RequestMapping(value = "selectFreeCourse")
    public String selectFreeCourse(Model model,String bestObjId,String objs,String pageNum,HttpSession session){
        if(bestObjId==null){
            bestObjId="-1";
        }
        if(objs==null) {
            objs = "-1";
        }
        if(pageNum==null){
            pageNum="1";
        }

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

        model.addAttribute("page",pageNum);
//        Map map = new HashMap();
//        map.put("page", 20 * (Integer.parseInt(pageNum) - 1));
//        map.put("rows", 20);
        List<ac_relationships> ac_relationshipslevel1=ac_relationshipsMapper.selectByLeveL1();
        //获取第一级标签
        model.addAttribute("bestObjs",ac_relationshipslevel1);
        //将第一级标签存入model
        List<ac_course> ac_courses=new ArrayList<>();
        if(bestObjId.equals("-1")){
            List<ac_relationships> ac_relationshipslevel2=ac_relationshipsMapper.selectAllLeveL2();
            model.addAttribute("relationshipslevel2",ac_relationshipslevel2);
            //得到所有二级标签


            for(ac_relationships ac_relationshiplist:ac_relationshipslevel2){
                List<ac_course_object> ac_course_objects=ac_course_objectMapper.selectByObjectId(Integer.parseInt(ac_relationshiplist.getAcRelationshipsItemid()));
                //先查到course_object中所有对应的课程
                for(ac_course_object ac_course_objectlist:ac_course_objects){
                    ac_course insertcourse=ac_courseMapper.selectByPrimaryKeyFree(ac_course_objectlist.getAcCourseObjectCourseid());
                    if(insertcourse!=null){
                        ac_courses.add(insertcourse);
                    }
//                    ac_courses.add(ac_courseMapper.selectByPrimaryKeyFree(ac_course_objectlist.getAcCourseObjectCourseid()));
                }
            }
//            List<ac_course> ac_courseList= ac_courseMapper.selectAllFree();

            //获取全部课程
        }else{
            List<ac_relationships> ac_relationshipslevel2=ac_relationshipsMapper.selectByLeveL2(Integer.parseInt(bestObjId));
            model.addAttribute("relationshipslevel2",ac_relationshipslevel2);
            //得到二级标签
            ac_relationships ac_relationships=ac_relationshipsMapper.selectByPrimaryKey(Integer.parseInt(bestObjId));
            model.addAttribute("bestObjname",ac_relationships.getAcRelationshipsItemname());
            model.addAttribute("bestObjId",bestObjId);
            if(objs=="-1"){
                for(ac_relationships ac_relationshiplist:ac_relationshipslevel2){
                    List<ac_course_object> ac_course_objects=ac_course_objectMapper.selectByObjectId(Integer.parseInt(ac_relationshiplist.getAcRelationshipsItemid()));
                    //先查到course_object中所有对应的课程
                    for(ac_course_object ac_course_objectlist:ac_course_objects){
                        ac_course insertcourse=ac_courseMapper.selectByPrimaryKeyFree(ac_course_objectlist.getAcCourseObjectCourseid());
                        if(insertcourse!=null){
                            ac_courses.add(insertcourse);
                        }
//                        ac_courses.add(ac_courseMapper.selectByPrimaryKeyFree(ac_course_objectlist.getAcCourseObjectCourseid()));
                    }
                }
            }else{
                List<ac_course_object> ac_course_objects=ac_course_objectMapper.selectByObjectId(Integer.parseInt(objs));
                ac_objectCourse ac_objectCourse=ac_objectCourseMapper.selectByPrimaryKey(Integer.parseInt(objs));
                model.addAttribute("objId",objs);
                model.addAttribute("objName",ac_objectCourse.getAcObjectcourseName());
                for(ac_course_object ac_course_objectlist:ac_course_objects){
                    ac_course insertcourse=ac_courseMapper.selectByPrimaryKeyFree(ac_course_objectlist.getAcCourseObjectCourseid());
                    if(insertcourse!=null){
                        ac_courses.add(insertcourse);
                    }
//                    ac_courses.add(ac_courseMapper.selectByPrimaryKeyFree(ac_course_objectlist.getAcCourseObjectCourseid()));
                }
            }
            //获取对应的大课类课程
        }
        List<ac_course> pageCourses=new ArrayList<>();
        for(int i=(Integer.parseInt(pageNum)-1)*12;i<(((Integer.parseInt(pageNum)-1)*12+12)>ac_courses.size()?ac_courses.size():((Integer.parseInt(pageNum)-1)*12+12));i++){
            pageCourses.add(ac_courses.get(i));
        }
        model.addAttribute("total",ac_courses.size());
        model.addAttribute("courses",pageCourses);
        return "selectFreeCourse";
    }

    @RequestMapping(value = "selectPayCourse")
    public String selectPayCourse(Model model,String bestObjId,String objs,String pageNum,HttpSession session){
        if(bestObjId==null){
            bestObjId="-1";
        }
        if(objs==null) {
            objs = "-1";
        }
        if(pageNum==null){
            pageNum="1";
        }

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

        model.addAttribute("page",pageNum);
        List<ac_relationships> ac_relationshipslevel1=ac_relationshipsMapper.selectByLeveL1();
        //获取第一级标签
        model.addAttribute("bestObjs",ac_relationshipslevel1);
        //将第一级标签存入model
        List<ac_course> ac_courses=new ArrayList<>();
        if(bestObjId.equals("-1")){
            List<ac_relationships> ac_relationshipslevel2=ac_relationshipsMapper.selectAllLeveL2();
            model.addAttribute("relationshipslevel2",ac_relationshipslevel2);
            //得到所有二级标签


            for(ac_relationships ac_relationshiplist:ac_relationshipslevel2){
                List<ac_course_object> ac_course_objects=ac_course_objectMapper.selectByObjectId(Integer.parseInt(ac_relationshiplist.getAcRelationshipsItemid()));
                //先查到course_object中所有对应的课程
                for(ac_course_object ac_course_objectlist:ac_course_objects){
                    ac_course insertcourse=ac_courseMapper.selectByPrimaryKeyPay(ac_course_objectlist.getAcCourseObjectCourseid());
                    if(insertcourse!=null){
                        ac_courses.add(insertcourse);
                    }
//                    ac_courses.add(ac_courseMapper.selectByPrimaryKeyPay(ac_course_objectlist.getAcCourseObjectCourseid()));
                }
            }
//            List<ac_course> ac_courseList= ac_courseMapper.selectAllPay();
            //获取全部课程
        }else{
            List<ac_relationships> ac_relationshipslevel2=ac_relationshipsMapper.selectByLeveL2(Integer.parseInt(bestObjId));
            model.addAttribute("relationshipslevel2",ac_relationshipslevel2);
            //得到二级标签
            ac_relationships ac_relationships=ac_relationshipsMapper.selectByPrimaryKey(Integer.parseInt(bestObjId));
            model.addAttribute("bestObjname",ac_relationships.getAcRelationshipsItemname());
            model.addAttribute("bestObjId",bestObjId);
            if(objs=="-1"){
                for(ac_relationships ac_relationshiplist:ac_relationshipslevel2){
                    List<ac_course_object> ac_course_objects=ac_course_objectMapper.selectByObjectId(Integer.parseInt(ac_relationshiplist.getAcRelationshipsItemid()));
                    //先查到course_object中所有对应的课程
                    for(ac_course_object ac_course_objectlist:ac_course_objects){
                        ac_course insertcourse=ac_courseMapper.selectByPrimaryKeyPay(ac_course_objectlist.getAcCourseObjectCourseid());
                        if(insertcourse!=null){
                            ac_courses.add(insertcourse);
                        }
//                        ac_courses.add(ac_courseMapper.selectByPrimaryKeyPay(ac_course_objectlist.getAcCourseObjectCourseid()));
                    }
                }
            }else{
                List<ac_course_object> ac_course_objects=ac_course_objectMapper.selectByObjectId(Integer.parseInt(objs));
                ac_objectCourse ac_objectCourse=ac_objectCourseMapper.selectByPrimaryKey(Integer.parseInt(objs));
                model.addAttribute("objId",objs);
                model.addAttribute("objName",ac_objectCourse.getAcObjectcourseName());
                for(ac_course_object ac_course_objectlist:ac_course_objects){
                    ac_course insertcourse=ac_courseMapper.selectByPrimaryKeyPay(ac_course_objectlist.getAcCourseObjectCourseid());
                    if(insertcourse!=null){
                        ac_courses.add(insertcourse);
                    }
//                    ac_courses.add(ac_courseMapper.selectByPrimaryKeyPay(ac_course_objectlist.getAcCourseObjectCourseid()));
                }
            }
            //获取对应的大课类课程
        }
        List<ac_course> pageCourses=new ArrayList<>();
        for(int i=(Integer.parseInt(pageNum)-1)*12;i<(((Integer.parseInt(pageNum)-1)*12+12)>ac_courses.size()?ac_courses.size():((Integer.parseInt(pageNum)-1)*12+12));i++){
            pageCourses.add(ac_courses.get(i));
        }
        model.addAttribute("total",ac_courses.size());
        model.addAttribute("courses",pageCourses);
        return "selectPayCourse";
    }

    @RequestMapping(value="search")
    public String search(Model model,String message,String pageNum,HttpSession session){
//        System.out.println(message);
        if(message==null){
            message="";
        }
        if(pageNum==null){
            pageNum="1";
        }

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

        model.addAttribute("page",pageNum);
        model.addAttribute("message",message);
        Map map=new HashMap();
        map.put("key",message);
        List<ac_course> finAcCourses=new ArrayList<>();
        List<ac_course> ac_courses=ac_courseMapper.selectByCourseNameLike(map);
        for(ac_course ac_course:ac_courses){
            ac_course.setTeacherName(ac_teacherMapper.selectByCourseId(ac_course.getAcCourseId()).getAcTeacherName());
            finAcCourses.add(ac_course);
        }
        List<ac_teacher> ac_teachers=ac_teacherMapper.selectTeacherLikely(message);
        for(ac_teacher ac_teacher:ac_teachers){
            List<ac_course> ac_courses1=ac_courseMapper.selectByTeacherId(ac_teacher.getAcTeacherId());
            for(ac_course ac_course:ac_courses1){
                ac_course.setTeacherName(ac_teacher.getAcTeacherName());
                finAcCourses.add(ac_course);
            }
        }

        List<ac_course> AllpageCourses=new ArrayList<>();
        for(int i=0;i<finAcCourses.size();i++){
            boolean check=true;
            for(int j=i+1;j<finAcCourses.size();j++){
                if(finAcCourses.get(i).getAcCourseId()==finAcCourses.get(j).getAcCourseId()){
                    check=false;
                }
            }
            if(check){
                AllpageCourses.add(finAcCourses.get(i));
            }
        }

//        model.addAttribute("searchCourses",finAcCourses);
        List<ac_course> pageCourses=new ArrayList<>();
        for(int i=(Integer.parseInt(pageNum)-1)*12;i<(((Integer.parseInt(pageNum)-1)*12+12)>AllpageCourses.size()?AllpageCourses.size():((Integer.parseInt(pageNum)-1)*12+12));i++){
            pageCourses.add(AllpageCourses.get(i));
        }
        model.addAttribute("total",AllpageCourses.size());
        model.addAttribute("courses",pageCourses);

        return "search";
    }

    @RequestMapping(value="addCourseVideoVisitors")
    public void addVisitors(HttpServletResponse response,int coursevideoId){
        ac_course_video ac_course_video=ac_course_videoMapper.selectByPrimaryKey(coursevideoId);
        ac_course_video.setAcVideoCourseLikes(""+(Integer.parseInt(ac_course_video.getAcVideoCourseLikes())+1));
    }

    @RequestMapping(value="addNewsVisitors")
    public void addNewsVisitors(HttpServletResponse response,int coursevideoId){
        ac_news ac_news=ac_newsMapper.selectByPrimaryKey(coursevideoId);
        ac_news.setAcNewsViews(ac_news.getAcNewsViews()+1);
    }

    @RequestMapping(value="putResume")
    public void putResume(HttpServletResponse response,String name,String userId,String context,String contextUrl,String videoUrl){
//        Map map=new HashMap();
//        map.put("name",name);
//        map.put("userId",userId);
//        map.put("context",context);
//        map.put("contextUrl",contextUrl);
//        map.put("videoUrl",videoUrl);
        ac_resume ac_resume=new ac_resume();
        ac_resume.setAcResumeContext(context);
        ac_resume.setAcResumeContexturl(contextUrl);
        ac_resume.setAcResumeRealid(userId);
        ac_resume.setAcResumeName(name);
        ac_resume.setAcResumeVideo(videoUrl);
        ac_resumeMapper.insertSelective(ac_resume);
    }

    @RequestMapping(value="getOneResume")
    public void getOneResume(HttpServletResponse response,String userId){
        ac_resume ac_resume=ac_resumeMapper.selectByUserId(userId);
        ajaxReturn(response,ac_resume);
    }

    @RequestMapping(value="getResume")
    public void getResume(HttpServletResponse response,int status){
        List<ac_resume> lists=ac_resumeMapper.selectByStatus(status);
        ajaxReturn(response,lists);
    }

    @RequestMapping(value="setResumeStatus")
    public void setResumeStatusTo1(HttpServletResponse response,int id,int statusId){
        ac_resume ac_resume=ac_resumeMapper.selectByPrimaryKey(id);
        ac_resume.setAcResumeStatus(statusId);
        ac_resumeMapper.updateByPrimaryKeySelective(ac_resume);
    }

    /**
     * ac_news
     * <p>
     * 添加新闻
     *
     * @param title     新闻标题
     * @param newStatus 新闻状态
     * @param newType   新闻类型
     * @param context   内容
     * @param source    来源（人发布/转载）
     */
    @RequestMapping(method = RequestMethod.POST, value = "/addNews")
    public void addNews(HttpServletResponse response, String title, String newStatus, String newType, String context, String source) {
        ac_news news = new ac_news();
        news.setAcNewsStatus(Integer.valueOf(newStatus));
        news.setAcNewsTime(String.valueOf(Fn.time()));
        news.setAcNewsContext(context);
        news.setAcNewsType(Integer.valueOf(newType));
        news.setAcNewsTitle(title);
        news.setAcNewsSourse(source);
        ac_newsMapper.insert(news);
        Fn.ajaxReturn(response, "插入成功");
    }

    /**
     * ac_news
     * <p>
     * 获取全部新闻
     *
     * @param page 页数
     * @param size 规模
     */
    @RequestMapping(method = RequestMethod.POST, value = "/getNewsLimit")
    public void getAllNews(HttpServletResponse response, int page, int size) {
        Map map = new HashMap<>();
        map.put("start", (page - 1) * size);
        map.put("end", size);
        List<ac_news> ac_news = ac_newsMapper.selectInPage(map);
        Fn.ajaxReturn(response, ac_news);
    }

    /**
     * ac_news
     * <p>
     * 根据新闻id进行新闻删除操作，如果该id不存在则取消
     *
     * @param newsId 新闻id
     */
    @RequestMapping(method = RequestMethod.POST, value = "/removeNews")
    public void removeNews(HttpServletResponse response, int newsId) {
        ac_news ac_news = ac_newsMapper.selectByPrimaryKey(newsId);
        if (ac_news == null) {
            Fn.ajaxReturn(response, "失败");
        } else {
            ac_newsMapper.deleteByPrimaryKey(newsId);
            Fn.ajaxReturn(response, "删除成功");
        }
    }

    /**
     * ac_news
     * <p>
     * 修改新闻的信息
     *
     * @param newsId    新闻id
     * @param title     新闻标题
     * @param newStatus 新闻状态
     * @param newType   新闻类型
     * @param context   新闻内容
     * @param source    新闻来源
     */
    @RequestMapping(method = RequestMethod.POST, value = "/editNews")
    public void editNews(HttpServletResponse response, int newsId, String title, String newStatus, String newType, String context, String source) {
        ac_news news = ac_newsMapper.selectByPrimaryKey(newsId);
        if (news == null) {
            Fn.ajaxReturn(response, "不存在");
        } else {
            news.setAcNewsStatus(Integer.valueOf(newStatus));
            news.setAcNewsTime(String.valueOf(Fn.time()));
            news.setAcNewsContext(context);
            news.setAcNewsType(Integer.valueOf(newType));
            news.setAcNewsTitle(title);
            news.setAcNewsSourse(source);
            ac_newsMapper.updateByPrimaryKey(news);
            Fn.ajaxReturn(response, "插入成功");
        }
    }

    /**
     * ac_news
     * <p>
     * 根据标题模糊查找
     *
     * @param title 新闻标题
     * @param page  分页页数
     * @param size  分页大小
     */
    @RequestMapping(method = RequestMethod.POST, value = "/getNewsLikely")
    public void getNewsLikely(HttpServletResponse response, String title, int page, int size) {
        Map map = new HashMap();
        map.put("title", title);
        map.put("start", (page - 1) * size);
        map.put("end", size);
        List<ac_news> news = ac_newsMapper.selectByTitleLikely(map);
        Fn.ajaxReturn(response, news);
    }

    /**
     * ac_user
     * 添加前台用户
     *
     * @param account
     * @param password
     */
    @RequestMapping(method = RequestMethod.POST, value = "/addAcUser")
    public void addAcUser(HttpServletResponse response,String headimgUrl, String account, String password,String username,String realId,String realname,String email) {
        ac_user user = ac_userMapper.selectByAccount(account);
        if (user == null) {
            user = new ac_user();
            user.setAcUserUseraccount(account);
            user.setAcUserUsername(username);
            user.setAcUserAddtime(""+Fn.time());
            user.setAcUserEmail(email);
            user.setAcUserHeadimg(headimgUrl);
            user.setAcUserRealid(realId);
            user.setAcUserLastip("0-0-0");
            user.setAcUserRealname(realname);
            user.setAcUserHeadimg("morenHeadimg.jpg");
            user.setAcUserPassword(DigestUtils.md5DigestAsHex(password.getBytes()));
            ac_userMapper.insert(user);
            Fn.ajaxReturn(response, "", "注册成功", 1);
        } else {
            Fn.ajaxReturn(response, "", "该手机号已被注册", 0);
        }
    }

    /**
     * ac_user
     * 登录
     *
     * @param account
     * @param password
     */
    @RequestMapping(method = RequestMethod.POST, value = "/login")
    public void login(HttpServletResponse response, String account, String password, HttpSession session) {
        ac_user user = ac_userMapper.selectByAccount(account);
        if (user != null) {
            boolean checkpassword=user.getAcUserPassword().equals(DigestUtils.md5DigestAsHex(password.getBytes()));
            if(checkpassword){
                ac_userMapper.updateByPrimaryKeySelective(user);
                session.setAttribute("nowUser",user);
                Fn.ajaxReturn(response, "", "登陆成功", 1);
            }else{
                Fn.ajaxReturn(response, "", "账号或密码不正确", 2);
            }
        } else {
            Fn.ajaxReturn(response, "", "用户不存在", 0);
        }
    }

    @RequestMapping(method = RequestMethod.POST, value = "/logout")
    public void logout(HttpServletResponse response,HttpSession session) {
        session.removeAttribute("nowUser");
        Fn.ajaxReturn(response, "", "已注销", 0);
    }




    private void ajaxReturn(HttpServletResponse response, Object obj) {
        String jsonStr = JSON.toJSONString(obj);
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Contral", "no-cache");
        response.setDateHeader("Expires", 0);
        PrintWriter pw = null;
        try {
            pw = response.getWriter();
            pw.print(jsonStr);
            pw.flush();
            pw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void debug(String message) {
        System.out.println(message);
    }



    /**
     * ac_video_assess
     * 未完成！！！！！！！！！
     * 点赞判断，如果已经点赞就不做操作，若何原来的评价有区别则直接改变
     *
     * @param videoId
     * @param userId
     * @param assess
     * @param tableName
     * @param response
     */
    @RequestMapping("/assess")
    public void assess(@RequestParam("videoId") Integer videoId, @RequestParam("userId") Integer userId, @RequestParam("assess") Integer assess, @RequestParam("tableName") String tableName, HttpServletResponse response) {
        debug("评分");
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINESE);
//        Date date = new Date();
//        String dateStr = sdf.format(date);
        Map acVideoAssessMessage = new HashMap();
        acVideoAssessMessage.put("acVideoAssessVideoid", videoId);
        acVideoAssessMessage.put("acVideoAssessUserid", userId);
        acVideoAssessMessage.put("acVideoAssessVideotable", tableName);

        ac_video_assess ac_video_assess2 = ac_video_assessMapper.selectByPrimaryKeys(acVideoAssessMessage);
        ac_video_assess ac_video_assess1 = new ac_video_assess();
        ac_video_assess1.setAcVideoAssessVideoid(videoId);
        ac_video_assess1.setAcVideoAssessUserid(userId);
        ac_video_assess1.setAcVideoAssessVideotable(tableName);
        ac_video_assess1.setAcVideoAssessAssess(assess);


        if (ac_video_assess2 == null) {
            ac_video_assessMapper.insertSelective(ac_video_assess1);
            if(tableName.equals("ac_studentvideo")){
                ac_studentvideo ac_studentvideo= ac_studentvideoMapper.selectByPrimaryKey(videoId);
                String likes[]=ac_studentvideo.getAcStudentvideoLikes().split("_");
                if(assess==1){
                    likes[0]=""+(Integer.parseInt(likes[0])+1);
                }else if(assess==0){
                    likes[1]=""+(Integer.parseInt(likes[1])+1);
                }
            }else if(tableName.equals("ac_course_video")){
                ac_course_video ac_course_video=ac_course_videoMapper.selectByPrimaryKey(videoId);
                String likes[]=ac_course_video.getAcVideoCourseLikes().split("_");
            }
        } else if (ac_video_assess2.getAcVideoAssessAssess() != assess) {
            ac_video_assess2.setAcVideoAssessAssess(assess);
            ac_video_assessMapper.updateByPrimaryKeySelective(ac_video_assess2);
            if(tableName.equals("ac_studentvideo")){
                ac_studentvideo ac_studentvideo= ac_studentvideoMapper.selectByPrimaryKey(videoId);
                String likes[]=ac_studentvideo.getAcStudentvideoLikes().split("_");
                if(assess==1){
                    likes[0]=""+(Integer.parseInt(likes[0])+1);
                    likes[1]=""+(Integer.parseInt(likes[1])-1);
                }else if(assess==0){
                    likes[0]=""+(Integer.parseInt(likes[0])-1);
                    likes[1]=""+(Integer.parseInt(likes[1])+1);
                }
            }else if(tableName.equals("ac_course_video")){
                ac_studentvideo ac_studentvideo= ac_studentvideoMapper.selectByPrimaryKey(videoId);
                String likes[]=ac_studentvideo.getAcStudentvideoLikes().split("_");
                if(assess==1){
                    likes[0]=""+(Integer.parseInt(likes[0])+1);
                    likes[1]=""+(Integer.parseInt(likes[1])-1);
                }else if(assess==0){
                    likes[0]=""+(Integer.parseInt(likes[0])-1);
                    likes[1]=""+(Integer.parseInt(likes[1])+1);
                }
            }
        } else {
            return;
        }
        ajaxReturn(response, "");
    }

    /**
     * ac_video_assess
     * <p>
     * 点赞判断,获取当前视频的点赞情况
     *
     * @param response
     * @param videoId
     * @param tableName
     * @param userId
     */
    @RequestMapping("/getAssess")
    public void getAssess(HttpServletResponse response, @RequestParam("videoId") Integer videoId, @RequestParam("tableName") String tableName, @RequestParam("userId") Integer userId) {
        Map acVideoAssessMessage = new HashMap();
        acVideoAssessMessage.put("acVideoAssessVideoid", videoId);
        acVideoAssessMessage.put("acVideoAssessUserid", userId);
        acVideoAssessMessage.put("acVideoAssessVideotable", tableName);
        ac_video_assess ac_video_assess = ac_video_assessMapper.selectByPrimaryKeys(acVideoAssessMessage);
        if (ac_video_assess == null) {
            ajaxReturn(response, null);
        } else {
            ajaxReturn(response, ac_video_assess.getAcVideoAssessAssess());
        }
    }

    /**
     * ac_video_assess
     * <p>
     * 获取当前视频的好评数和差评数
     *
     * @param response
     * @param videoId
     * @param tableName
     */
    @RequestMapping("/getAllAssessNum")
    public void getAllAssessNum(HttpServletResponse response, @RequestParam("videoId") Integer videoId, @RequestParam("tableName") String tableName) {
        Map acVideoAssessMessage = new HashMap();
        acVideoAssessMessage.put("acVideoAssessVideoid", videoId);
        acVideoAssessMessage.put("acVideoAssessVideotable", tableName);
        List<ac_video_assess> ac_video_assess = ac_video_assessMapper.selectAllByKeys(acVideoAssessMessage);
        int goodnum = 0;
        int badnum = 0;
        for (ac_video_assess acVideoAssess : ac_video_assess) {
            if (acVideoAssess.getAcVideoAssessAssess() == 1) {
                goodnum++;
            } else if (acVideoAssess.getAcVideoAssessAssess() == 0) {
                badnum++;
            }
        }
        int nums[] = {goodnum, badnum};
        ajaxReturn(response, nums);
    }

    /**
     * ac_video_assess
     * <p>
     * 删除该视频的评价信息
     *
     * @param response
     * @param videoId
     * @param tableName
     */
    @RequestMapping("/removeAllAssess")
    public void removeAllAssess(HttpServletResponse response, @RequestParam("videoId") Integer videoId, @RequestParam("tableName") String tableName) {
        Map acVideoAssessMessage = new HashMap();
        acVideoAssessMessage.put("acVideoAssessVideoid", videoId);
        acVideoAssessMessage.put("acVideoAssessVideotable", tableName);
        ac_video_assessMapper.deleteByPrimaryKeys(acVideoAssessMessage);
    }

    /**
     * ac_studentVideo
     * <p>
     * 近似查询学生风采
     *
     * @param response
     * @param message
     */
    @RequestMapping("/getStudnetVideoByKey")
    public void getStudnetVideoByKey(HttpServletResponse response, String message) {
        List<ac_studentvideo> ac_studentvideos = ac_studentvideoMapper.selectByValue("%" + message.trim() + "%");
        ajaxReturn(response, ac_studentvideos);
    }

    @RequestMapping("/getStudnetVideoAuditing")
    public void getStudnetVideoAuditing(HttpServletResponse response, int stuId,int status) {
        Map map=new HashMap();
        map.put("stuId",stuId);
        map.put("status",status);
        List<ac_studentvideo> ac_studentvideos = ac_studentvideoMapper.selectStudnetVideoAuditing(map);
        ajaxReturn(response, ac_studentvideos);
    }

    @RequestMapping("/insertStudentVideo")
    public void insertStudentVideo(HttpServletResponse response,String url,String studentName,String time,int stuId,String context,String summary){
        ac_studentvideo ac_studentvideo=new ac_studentvideo();
        ac_studentvideo.setAcStudentvideoUrl(url);
        ac_studentvideo.setAcStudentvideoStudentname(studentName);
        ac_studentvideo.setAcStudentvideoStuid(stuId);
        ac_studentvideo.setAcStudentvideoTime(time);
        ac_studentvideo.setAcStudentvideoContext(context);
        ac_studentvideo.setAcStudentvideoSummary(summary);
        ac_studentvideoMapper.insertSelective(ac_studentvideo);
    }

    @RequestMapping("/findAuditingStudentVideo")
    public void removeStudentVideo(HttpServletResponse response){
        List<ac_studentvideo> ac_studentvideos=ac_studentvideoMapper.selcetAllAuditingVideo();
        ajaxReturn(response,ac_studentvideos);
    }

    @RequestMapping("/setStudentVideoStatus")
    public void setStudentVideoStatus(HttpServletResponse response,int statusNum,int VideoId){
        ac_studentvideo ac_studentvideo=new ac_studentvideo();
        ac_studentvideo.setAcStudentvideoId(VideoId);
        ac_studentvideo.setAcStudentvideoStatus(statusNum);
        ac_studentvideoMapper.updateByPrimaryKeySelective(ac_studentvideo);
    }
}
