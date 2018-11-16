package com.artclub.dao;

import com.artclub.model.ac_comments;

import java.util.List;
import java.util.Map;

public interface ac_commentsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_comments
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer acCommentsId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_comments
     *
     * @mbggenerated
     */
    int insert(ac_comments record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_comments
     *
     * @mbggenerated
     */
    int insertSelective(ac_comments record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_comments
     *
     * @mbggenerated
     */
    ac_comments selectByPrimaryKey(Integer acCommentsId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_comments
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ac_comments record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_comments
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ac_comments record);

    List<ac_comments> selectInPage(Map map);

    List<ac_comments> selectInPageAndCourseId(Map map);

    List<ac_comments> selectParentInPage(Map map);

    List<ac_comments> selectParentId(Integer pId);

    List<ac_comments> selectByParentIdAndLevel(Map map);
}