package com.codeup.adlister.dao;

import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLCategoriesDao implements Categories {
    private Connection connection = null;

    public MySQLCategoriesDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUsername(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Category> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT categories.title as category, categories.id as id, tags.title as subcategory FROM categories JOIN tags ON tags.category_id = categories.id;");
            ResultSet rs = stmt.executeQuery();
            System.out.println(rs);
            return createCategories(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error with categories joining subcategories.", e);
        }
    }


    public List<Category> headings() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT categories.id as id,categories.title as heading FROM categories;");
            ResultSet rs = stmt.executeQuery();
            System.out.println(rs);
            return createHeadings(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all Categories.", e);
        }
    }


    public Category extractHeading(ResultSet rs) {
        try {
            return new Category(
                    rs.getLong("id"),
                    rs.getString("heading").toUpperCase()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error extracting all Headings.", e);
        }
    }
    public Category extractCategory(ResultSet rs) {
        try {
            return new Category(
                    rs.getLong("id"),
                    rs.getString("category").toUpperCase(),
                    rs.getString("subcategory")
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error extracting all Categories.", e);
        }
    }


    private List<Category> createHeadings(ResultSet rs) throws SQLException {
        List<Category> headings = new ArrayList<>();
        while (rs.next()) {
            headings.add(extractHeading(rs));
        }
        return headings;
    }


    private List<Category> createCategories(ResultSet rs) throws SQLException {
        List<Category> categories = new ArrayList<>();
        while (rs.next()) {
            categories.add(extractCategory(rs));
        }
        return categories;
    }


}
