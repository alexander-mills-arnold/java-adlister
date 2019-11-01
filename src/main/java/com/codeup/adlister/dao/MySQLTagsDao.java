package com.codeup.adlister.dao;

import com.codeup.adlister.models.Tag;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLTagsDao implements Tags {
    private Connection connection = null;

    public MySQLTagsDao(Config config) {
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
    public List<Tag> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM tags");
            ResultSet rs = stmt.executeQuery();
            return createCategories(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all Categories.", e);
        }
    }

    public Tag extractCategory(ResultSet rs) {
        try {
            return new Tag(
                    rs.getLong("id"),
                    rs.getLong("category_id"),
                    rs.getString("title")
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all Sub-Categories.", e);
        }
    }


    private List<Tag> createCategories(ResultSet rs) throws SQLException {
        List<Tag> tags = new ArrayList<>();
        while (rs.next()) {
            tags.add(extractCategory(rs));
        }
        return tags;
    }

    @Override
    public List<Tag> getTagsByCategory(String tagCategory) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM tags WHERE category_id IN (SELECT id FROM categories WHERE title = ?)");
            stmt.setString(1, tagCategory);
            ResultSet rs = stmt.executeQuery();
            return createCategories(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all Categories.", e);
        }

    }
}