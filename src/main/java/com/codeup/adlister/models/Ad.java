package com.codeup.adlister.models;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Ad {
    private long id;
    private long userId;
    private java.sql.Date postDate;


    private long tagId;
    private String title;
    private String description;


    private Date posted_date;

    public Ad(long id, long userId, long tagId, String title, String description, java.sql.Date posted_date) {
        this.id = id;
        this.userId = userId;
        this.tagId = tagId;
        this.title = title;
        this.description = description;
        this.postDate = posted_date;
    }

    public Ad(long userId, String title, String description) {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        java.sql.Date date = new Date(System.currentTimeMillis());
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.postDate = date;
    }
//    public Ad(long userId, long tag_id, String title, String description, java.util.Date posted_date) {
//        this.userId = userId;
//        this.title = title;
//        this.description = description;
//    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public Date getPosted_date() {
        return posted_date;
    }

    public void setPosted_date(Date posted_date) {
        this.posted_date = posted_date;
    }
//    public long getTagId() {
//        return tagId;
//    }

//    public void setTagId(long tagId) {
//        this.tagId = tagId;
//    }

    public java.sql.Date getPostDate() {
        return postDate;
    }

}
