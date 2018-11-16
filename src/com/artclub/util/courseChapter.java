package com.artclub.util;

import com.artclub.model.ac_course_video;

import java.util.List;

public class courseChapter {
    int courseId;
    String chapterName;
    int chapterId;
    String chapterContext;
    List<ac_course_video> episodes;

    public String getChapterContext() {
        return chapterContext;
    }

    public void setChapterContext(String chapterContext) {
        this.chapterContext = chapterContext;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public int getChapterId() {
        return chapterId;
    }

    public void setChapterId(int chapterId) {
        this.chapterId = chapterId;
    }

    public List<ac_course_video> getEpisodes() {
        return episodes;
    }

    public void setEpisodes(List<ac_course_video> episodes) {
        this.episodes = episodes;
    }
}
