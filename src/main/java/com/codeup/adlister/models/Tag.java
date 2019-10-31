package com.codeup.adlister.models;

public class Tag {
    public long id;

    public Tag(long id) {
        this.id = id;

    }

    private long categoryId;
    private String title;

    public Tag(long id, long categoryId, String title) {
        this.id = id;
        this.title = title;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


}
