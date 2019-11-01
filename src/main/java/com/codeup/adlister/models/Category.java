package com.codeup.adlister.models;



public class Category {
    private long id;
    private String subcategory;
    private String category;
    private long subid;

    public Category(long id, String category, String subcategory) {
        this.id = id;
        this.category = category;
        this.subcategory = subcategory;
    }


    public Category(long id, String category) {
        this.id = id;
        this.category = category;
    }

    public Category(long id, String category, String subcategory, long subid) {
        this.id = id;
        this.category = category;
        this.subcategory = subcategory;
        this.subid = subid;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSubcategory() {
        return subcategory;
    }

    public void setSubcategory(String subcategory) {
        this.subcategory = subcategory;
    }

    public long getSubid() {
        return subid;
    }

    public void setSubid(long subid) {
        this.subid = subid;
    }
}
