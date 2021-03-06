package com.artclub.dao;

import com.artclub.model.ac_objectCourse;

import java.util.List;

public interface ac_objectCourseMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_objectcourse
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer acObjectcourseId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_objectcourse
     *
     * @mbggenerated
     */
    int insert(ac_objectCourse record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_objectcourse
     *
     * @mbggenerated
     */
    int insertSelective(ac_objectCourse record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_objectcourse
     *
     * @mbggenerated
     */
    ac_objectCourse selectByPrimaryKey(Integer acObjectcourseId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_objectcourse
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ac_objectCourse record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_objectcourse
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ac_objectCourse record);

    List<ac_objectCourse> selectAll();

    ac_objectCourse selectByObjectName(String instrumentName);
}