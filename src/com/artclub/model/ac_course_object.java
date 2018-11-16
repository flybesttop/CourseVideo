package com.artclub.model;

import java.io.Serializable;

public class ac_course_object implements Serializable {
    private String lv2id;
    private String lv1id;

    public String getLv2id() {
        return lv2id;
    }

    public void setLv2id(String lv2id) {
        this.lv2id = lv2id;
    }

    public String getLv1id() {
        return lv1id;
    }

    public void setLv1id(String lv1id) {
        this.lv1id = lv1id;
    }

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_course_object.ac_course_object_id
     *
     * @mbggenerated
     */
    private Integer acCourseObjectId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_course_object.ac_course_object_courseid
     *
     * @mbggenerated
     */
    private Integer acCourseObjectCourseid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_course_object.ac_course_object_objectId
     *
     * @mbggenerated
     */
    private Integer acCourseObjectObjectid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_course_object.ac_course_objetc_addtime
     *
     * @mbggenerated
     */
    private String acCourseObjetcAddtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_course_object.ac_course_object_courseName
     *
     * @mbggenerated
     */
    private String acCourseObjectCoursename;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table ac_course_object
     *
     * @mbggenerated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_course_object.ac_course_object_id
     *
     * @return the value of ac_course_object.ac_course_object_id
     * @mbggenerated
     */
    public Integer getAcCourseObjectId() {
        return acCourseObjectId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_course_object.ac_course_object_id
     *
     * @param acCourseObjectId the value for ac_course_object.ac_course_object_id
     * @mbggenerated
     */
    public void setAcCourseObjectId(Integer acCourseObjectId) {
        this.acCourseObjectId = acCourseObjectId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_course_object.ac_course_object_courseid
     *
     * @return the value of ac_course_object.ac_course_object_courseid
     * @mbggenerated
     */
    public Integer getAcCourseObjectCourseid() {
        return acCourseObjectCourseid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_course_object.ac_course_object_courseid
     *
     * @param acCourseObjectCourseid the value for ac_course_object.ac_course_object_courseid
     * @mbggenerated
     */
    public void setAcCourseObjectCourseid(Integer acCourseObjectCourseid) {
        this.acCourseObjectCourseid = acCourseObjectCourseid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_course_object.ac_course_object_objectId
     *
     * @return the value of ac_course_object.ac_course_object_objectId
     * @mbggenerated
     */
    public Integer getAcCourseObjectObjectid() {
        return acCourseObjectObjectid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_course_object.ac_course_object_objectId
     *
     * @param acCourseObjectObjectid the value for ac_course_object.ac_course_object_objectId
     * @mbggenerated
     */
    public void setAcCourseObjectObjectid(Integer acCourseObjectObjectid) {
        this.acCourseObjectObjectid = acCourseObjectObjectid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_course_object.ac_course_objetc_addtime
     *
     * @return the value of ac_course_object.ac_course_objetc_addtime
     * @mbggenerated
     */
    public String getAcCourseObjetcAddtime() {
        return acCourseObjetcAddtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_course_object.ac_course_objetc_addtime
     *
     * @param acCourseObjetcAddtime the value for ac_course_object.ac_course_objetc_addtime
     * @mbggenerated
     */
    public void setAcCourseObjetcAddtime(String acCourseObjetcAddtime) {
        this.acCourseObjetcAddtime = acCourseObjetcAddtime == null ? null : acCourseObjetcAddtime.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_course_object.ac_course_object_courseName
     *
     * @return the value of ac_course_object.ac_course_object_courseName
     * @mbggenerated
     */
    public String getAcCourseObjectCoursename() {
        return acCourseObjectCoursename;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_course_object.ac_course_object_courseName
     *
     * @param acCourseObjectCoursename the value for ac_course_object.ac_course_object_courseName
     * @mbggenerated
     */
    public void setAcCourseObjectCoursename(String acCourseObjectCoursename) {
        this.acCourseObjectCoursename = acCourseObjectCoursename == null ? null : acCourseObjectCoursename.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_course_object
     *
     * @mbggenerated
     */
    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        ac_course_object other = (ac_course_object) that;
        return (this.getAcCourseObjectId() == null ? other.getAcCourseObjectId() == null : this.getAcCourseObjectId().equals(other.getAcCourseObjectId())) && (this.getAcCourseObjectCourseid() == null ? other.getAcCourseObjectCourseid() == null : this.getAcCourseObjectCourseid().equals(other.getAcCourseObjectCourseid())) && (this.getAcCourseObjectObjectid() == null ? other.getAcCourseObjectObjectid() == null : this.getAcCourseObjectObjectid().equals(other.getAcCourseObjectObjectid())) && (this.getAcCourseObjetcAddtime() == null ? other.getAcCourseObjetcAddtime() == null : this.getAcCourseObjetcAddtime().equals(other.getAcCourseObjetcAddtime())) && (this.getAcCourseObjectCoursename() == null ? other.getAcCourseObjectCoursename() == null : this.getAcCourseObjectCoursename().equals(other.getAcCourseObjectCoursename()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_course_object
     *
     * @mbggenerated
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getAcCourseObjectId() == null) ? 0 : getAcCourseObjectId().hashCode());
        result = prime * result + ((getAcCourseObjectCourseid() == null) ? 0 : getAcCourseObjectCourseid().hashCode());
        result = prime * result + ((getAcCourseObjectObjectid() == null) ? 0 : getAcCourseObjectObjectid().hashCode());
        result = prime * result + ((getAcCourseObjetcAddtime() == null) ? 0 : getAcCourseObjetcAddtime().hashCode());
        result = prime * result + ((getAcCourseObjectCoursename() == null) ? 0 : getAcCourseObjectCoursename().hashCode());
        return result;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_course_object
     *
     * @mbggenerated
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", acCourseObjectId=").append(acCourseObjectId);
        sb.append(", acCourseObjectCourseid=").append(acCourseObjectCourseid);
        sb.append(", acCourseObjectObjectid=").append(acCourseObjectObjectid);
        sb.append(", acCourseObjetcAddtime=").append(acCourseObjetcAddtime);
        sb.append(", acCourseObjectCoursename=").append(acCourseObjectCoursename);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}