package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.TagsServlet", urlPatterns = "/tags")
public class TagsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tagString = request.getParameter("tag");
        long tagId = 0;
        List<Ad> ads = DaoFactory.getAdsDao().all();
        List<Ad> searchedAds = new ArrayList<>();
        for (Ad ad : ads) {
            if (tagString.matches(".*\\d.*")) {
                tagId = Long.parseLong(tagString);
                if(tagId == ad.getTagId()){
                    searchedAds.add(ad);
                }
            }
        }
        request.setAttribute("tag", DaoFactory.getTagsDao().findById(tagId));
        request.setAttribute("ads", searchedAds);
        try {
            request.getRequestDispatcher("/WEB-INF/tags.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
}
