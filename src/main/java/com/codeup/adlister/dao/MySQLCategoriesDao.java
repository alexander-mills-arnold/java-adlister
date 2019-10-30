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
            stmt = connection.prepareStatement("SELECT * FROM categories");
            ResultSet rs = stmt.executeQuery();
            System.out.println(stmt);
            return createCategories(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all Categories.", e);
        }
    }

    public Category extractCategory(ResultSet rs) {
        try {
            return new Category(
                    rs.getLong("id"),
                    rs.getString("title")
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all Categories.", e);
        }
    }


    private List<Category> createCategories(ResultSet rs) throws SQLException {
        List<Category> categories = new ArrayList<>();
        while (rs.next()) {
            categories.add(extractCategory(rs));
        }
        return categories;
    }


}
