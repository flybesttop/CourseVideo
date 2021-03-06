package com.artclub.dao;

import com.artclub.model.ac_relationships;

import java.util.List;
import java.util.Map;

public interface ac_relationshipsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_relationships
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_relationships
     *
     * @mbggenerated
     */
    int insert(ac_relationships record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_relationships
     *
     * @mbggenerated
     */
    int insertSelective(ac_relationships record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_relationships
     *
     * @mbggenerated
     */
    ac_relationships selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_relationships
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ac_relationships record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_relationships
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ac_relationships record);

    List<ac_relationships> selectByPid(int pid);

    List<ac_relationships> selectAll();

    List<ac_relationships> selectByLeveL1();

    List<ac_relationships> selectByLeveL1ById(int id);

    List<ac_relationships> selectByLeveL2(int level1);

    List<ac_relationships> selectAllLeveL2();

    ac_relationships selectByItemId(Integer acCourseObjectObjectid);
}