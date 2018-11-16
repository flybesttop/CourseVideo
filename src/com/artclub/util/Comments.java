package com.artclub.util;

import com.artclub.model.ac_comments;
import com.artclub.model.ac_user;

import java.awt.*;
import java.util.List;

public class Comments {
    ac_user user;
    String toUserName;

    public int getToUserId() {
        return toUserId;
    }

    public void setToUserId(int toUserId) {
        this.toUserId = toUserId;
    }

    int toUserId;

    ac_comments ac_comments;//本体
    List<Comments> childcomments;

    public ac_user getUser() {
        return user;
    }

    public void setUser(ac_user user) {
        this.user = user;
    }

    public String getToUserName() {
        return toUserName;
    }

    public void setToUserName(String toUserName) {
        this.toUserName = toUserName;
    }

    public com.artclub.model.ac_comments getAc_comments() {
        return ac_comments;
    }

    public void setAc_comments(com.artclub.model.ac_comments ac_comments) {
        this.ac_comments = ac_comments;
    }

    public List<Comments> getChildcomments() {
        return childcomments;
    }

    public void setChildcomments(List<Comments> childcomments) {
        this.childcomments = childcomments;
    }


}
