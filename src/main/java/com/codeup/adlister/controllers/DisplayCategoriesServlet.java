package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Categories;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.Tag;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.DisplayCategoriesServlet", urlPatterns = "/categories")
public class DisplayCategoriesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryString = request.getParameter("category");
        long categoryId = 0;
        List<Category> categories = DaoFactory.getCategoriesDao().all();
        List<Tag> tags = null;
        List<Ad> ads = DaoFactory.getAdsDao().all();
        List<Ad> searchedAds = new ArrayList<>();
        String categoryTitle = null;

        if (categoryString.matches(".*\\d.*")) {
            categoryId = Long.parseLong(categoryString);

            for (Category category : categories) {
                if (category.getId() == categoryId) {
                    categoryTitle = category.getCategory();
                    tags = DaoFactory.getTagsDao().getTagsByCategory(category.getCategory());
                    for(Tag tag : tags){
                        for(Ad ad : ads){
                            if((tag.getId() == ad.getTagId()) && !searchedAds.contains(ad)){
                                searchedAds.add(ad);
                            }
                        }
                    }
                }
            }
        }

        request.setAttribute("category", categoryTitle);
        request.setAttribute("ads", searchedAds);
        try {
            request.getRequestDispatcher("/WEB-INF/category-display.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
}
