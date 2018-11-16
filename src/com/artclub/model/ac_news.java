package com.artclub.model;

import java.io.Serializable;

public class ac_news implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_news.ac_news_id
     *
     * @mbggenerated
     */
    private Integer acNewsId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_news.ac_news_title
     *
     * @mbggenerated
     */
    private String acNewsTitle;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_news.ac_news_date
     *
     * @mbggenerated
     */
    private String acNewsDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_news.ac_news_time
     *
     * @mbggenerated
     */
    private String acNewsTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_news.ac_news_context
     *
     * @mbggenerated
     */
    private String acNewsContext;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_news.ac_news_status
     *
     * @mbggenerated
     */
    private Integer acNewsStatus;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_news.ac_news_type
     *
     * @mbggenerated
     */
    private Integer acNewsType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_news.ac_news_sourse
     *
     * @mbggenerated
     */
    private String acNewsSourse;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ac_news.ac_news_views
     *
     * @mbggenerated
     */
    private Integer acNewsViews;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table ac_news
     *
     * @mbggenerated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_news.ac_news_id
     *
     * @return the value of ac_news.ac_news_id
     *
     * @mbggenerated
     */
    public Integer getAcNewsId() {
        return acNewsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_news.ac_news_id
     *
     * @param acNewsId the value for ac_news.ac_news_id
     *
     * @mbggenerated
     */
    public void setAcNewsId(Integer acNewsId) {
        this.acNewsId = acNewsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_news.ac_news_title
     *
     * @return the value of ac_news.ac_news_title
     *
     * @mbggenerated
     */
    public String getAcNewsTitle() {
        return acNewsTitle;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_news.ac_news_title
     *
     * @param acNewsTitle the value for ac_news.ac_news_title
     *
     * @mbggenerated
     */
    public void setAcNewsTitle(String acNewsTitle) {
        this.acNewsTitle = acNewsTitle == null ? null : acNewsTitle.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_news.ac_news_date
     *
     * @return the value of ac_news.ac_news_date
     *
     * @mbggenerated
     */
    public String getAcNewsDate() {
        return acNewsDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_news.ac_news_date
     *
     * @param acNewsDate the value for ac_news.ac_news_date
     *
     * @mbggenerated
     */
    public void setAcNewsDate(String acNewsDate) {
        this.acNewsDate = acNewsDate == null ? null : acNewsDate.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_news.ac_news_time
     *
     * @return the value of ac_news.ac_news_time
     *
     * @mbggenerated
     */
    public String getAcNewsTime() {
        return acNewsTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_news.ac_news_time
     *
     * @param acNewsTime the value for ac_news.ac_news_time
     *
     * @mbggenerated
     */
    public void setAcNewsTime(String acNewsTime) {
        this.acNewsTime = acNewsTime == null ? null : acNewsTime.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_news.ac_news_context
     *
     * @return the value of ac_news.ac_news_context
     *
     * @mbggenerated
     */
    public String getAcNewsContext() {
        return acNewsContext;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_news.ac_news_context
     *
     * @param acNewsContext the value for ac_news.ac_news_context
     *
     * @mbggenerated
     */
    public void setAcNewsContext(String acNewsContext) {
        this.acNewsContext = acNewsContext == null ? null : acNewsContext.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_news.ac_news_status
     *
     * @return the value of ac_news.ac_news_status
     *
     * @mbggenerated
     */
    public Integer getAcNewsStatus() {
        return acNewsStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_news.ac_news_status
     *
     * @param acNewsStatus the value for ac_news.ac_news_status
     *
     * @mbggenerated
     */
    public void setAcNewsStatus(Integer acNewsStatus) {
        this.acNewsStatus = acNewsStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_news.ac_news_type
     *
     * @return the value of ac_news.ac_news_type
     *
     * @mbggenerated
     */
    public Integer getAcNewsType() {
        return acNewsType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_news.ac_news_type
     *
     * @param acNewsType the value for ac_news.ac_news_type
     *
     * @mbggenerated
     */
    public void setAcNewsType(Integer acNewsType) {
        this.acNewsType = acNewsType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_news.ac_news_sourse
     *
     * @return the value of ac_news.ac_news_sourse
     *
     * @mbggenerated
     */
    public String getAcNewsSourse() {
        return acNewsSourse;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_news.ac_news_sourse
     *
     * @param acNewsSourse the value for ac_news.ac_news_sourse
     *
     * @mbggenerated
     */
    public void setAcNewsSourse(String acNewsSourse) {
        this.acNewsSourse = acNewsSourse == null ? null : acNewsSourse.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ac_news.ac_news_views
     *
     * @return the value of ac_news.ac_news_views
     *
     * @mbggenerated
     */
    public Integer getAcNewsViews() {
        return acNewsViews;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ac_news.ac_news_views
     *
     * @param acNewsViews the value for ac_news.ac_news_views
     *
     * @mbggenerated
     */
    public void setAcNewsViews(Integer acNewsViews) {
        this.acNewsViews = acNewsViews;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_news
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
        ac_news other = (ac_news) that;
        return (this.getAcNewsId() == null ? other.getAcNewsId() == null : this.getAcNewsId().equals(other.getAcNewsId()))
            && (this.getAcNewsTitle() == null ? other.getAcNewsTitle() == null : this.getAcNewsTitle().equals(other.getAcNewsTitle()))
            && (this.getAcNewsDate() == null ? other.getAcNewsDate() == null : this.getAcNewsDate().equals(other.getAcNewsDate()))
            && (this.getAcNewsTime() == null ? other.getAcNewsTime() == null : this.getAcNewsTime().equals(other.getAcNewsTime()))
            && (this.getAcNewsContext() == null ? other.getAcNewsContext() == null : this.getAcNewsContext().equals(other.getAcNewsContext()))
            && (this.getAcNewsStatus() == null ? other.getAcNewsStatus() == null : this.getAcNewsStatus().equals(other.getAcNewsStatus()))
            && (this.getAcNewsType() == null ? other.getAcNewsType() == null : this.getAcNewsType().equals(other.getAcNewsType()))
            && (this.getAcNewsSourse() == null ? other.getAcNewsSourse() == null : this.getAcNewsSourse().equals(other.getAcNewsSourse()))
            && (this.getAcNewsViews() == null ? other.getAcNewsViews() == null : this.getAcNewsViews().equals(other.getAcNewsViews()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_news
     *
     * @mbggenerated
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getAcNewsId() == null) ? 0 : getAcNewsId().hashCode());
        result = prime * result + ((getAcNewsTitle() == null) ? 0 : getAcNewsTitle().hashCode());
        result = prime * result + ((getAcNewsDate() == null) ? 0 : getAcNewsDate().hashCode());
        result = prime * result + ((getAcNewsTime() == null) ? 0 : getAcNewsTime().hashCode());
        result = prime * result + ((getAcNewsContext() == null) ? 0 : getAcNewsContext().hashCode());
        result = prime * result + ((getAcNewsStatus() == null) ? 0 : getAcNewsStatus().hashCode());
        result = prime * result + ((getAcNewsType() == null) ? 0 : getAcNewsType().hashCode());
        result = prime * result + ((getAcNewsSourse() == null) ? 0 : getAcNewsSourse().hashCode());
        result = prime * result + ((getAcNewsViews() == null) ? 0 : getAcNewsViews().hashCode());
        return result;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ac_news
     *
     * @mbggenerated
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", acNewsId=").append(acNewsId);
        sb.append(", acNewsTitle=").append(acNewsTitle);
        sb.append(", acNewsDate=").append(acNewsDate);
        sb.append(", acNewsTime=").append(acNewsTime);
        sb.append(", acNewsContext=").append(acNewsContext);
        sb.append(", acNewsStatus=").append(acNewsStatus);
        sb.append(", acNewsType=").append(acNewsType);
        sb.append(", acNewsSourse=").append(acNewsSourse);
        sb.append(", acNewsViews=").append(acNewsViews);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}