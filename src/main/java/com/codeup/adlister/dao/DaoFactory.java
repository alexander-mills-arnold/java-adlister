package com.codeup.adlister.dao;

public class DaoFactory {
    private static Categories categoriesDao;
    private static Tags tagsDao;
    private static Ads adsDao;
    private static Users usersDao;
    private static Categories getHeadingsDao;
    private static Config config = new Config();

    public static Categories getCategoriesDao() {
        if (categoriesDao == null) {
            categoriesDao = new MySQLCategoriesDao(config);
        }
        return categoriesDao;
    }

    public static Categories getGetHeadingsDao() {
        if (getHeadingsDao == null) {
            getHeadingsDao = new MySQLCategoriesDao(config);
        }
        return categoriesDao;
    }

    public static Tags getTagsDao() {
        if (tagsDao == null) {
            tagsDao = new MySQLTagsDao(config);
        }
        return tagsDao;
    }

    public static Ads getAdsDao() {
        if (adsDao == null) {
            adsDao = new MySQLAdsDao(config);
        }
        return adsDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }
}
