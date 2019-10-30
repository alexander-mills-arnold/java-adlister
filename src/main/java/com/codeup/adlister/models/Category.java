package com.codeup.adlister.models;



public class Category {
    private long id;

    public Category(long id, String title) {
        this.id = id;
        this.title = title;
    }

    private String title;

    public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
