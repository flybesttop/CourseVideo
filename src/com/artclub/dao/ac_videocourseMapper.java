package com.artclub.dao;

import com.artclub.model.ac_videocourse;

public interface ac_videocourseMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_videocourse
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer acVideocourseId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_videocourse
     *
     * @mbggenerated
     */
    int insert(ac_videocourse record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_videocourse
     *
     * @mbggenerated
     */
    int insertSelective(ac_videocourse record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_videocourse
     *
     * @mbggenerated
     */
    ac_videocourse selectByPrimaryKey(Integer acVideocourseId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_videocourse
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ac_videocourse record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_videocourse
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ac_videocourse record);
}