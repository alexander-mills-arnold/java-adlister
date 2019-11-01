package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Tag;
import com.codeup.adlister.models.User;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            request.getSession().setAttribute("returnTo", "/ads/create");
            response.sendRedirect("/login");
            return;
        }

        List<Tag> communityTags = DaoFactory.getTagsDao().getTagsByCategory("community");
        List<Tag> servicesTags = DaoFactory.getTagsDao().getTagsByCategory("services");
        List<Tag> housingTags = DaoFactory.getTagsDao().getTagsByCategory("housing");
        List<Tag> forSaleTags = DaoFactory.getTagsDao().getTagsByCategory("for sale");
        List<Tag> jobsTags = DaoFactory.getTagsDao().getTagsByCategory("jobs");
        request.setAttribute("communityTags", communityTags);
        request.setAttribute("servicesTags", servicesTags);
        request.setAttribute("housingTags", housingTags);
        request.setAttribute("forSaleTags", forSaleTags);
        request.setAttribute("jobsTags", jobsTags);
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String tag = request.getParameter("tag_id");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String errorCodes = "";
        long tagId = 0;
        if(tag != null){
            tagId = Long.parseLong(tag);
        }
        boolean inputHasErrors = title.isEmpty()
                || description.isEmpty()
                || tagId == 0;
        if(inputHasErrors){
            if(title.isEmpty()){
                errorCodes += 1;
            }
            if(description.isEmpty()){
                errorCodes += 2;
            }
            if(tagId == 0){
                errorCodes += 3;
            }

            request.getSession().setAttribute("createErrors", errorCodes);
            request.getSession().setAttribute("failedTitle", title);
            request.getSession().setAttribute("failedDescription", description);
            response.sendRedirect("/ads/create");
            return;
        }
        Ad ad = new Ad(
            user.getId(),
            tagId,
            request.getParameter("title"),
            request.getParameter("description")
        );
        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/ads");
    }
}
