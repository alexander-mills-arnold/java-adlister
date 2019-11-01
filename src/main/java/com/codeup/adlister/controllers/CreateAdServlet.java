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
        System.out.println("tag = " + tag);
        long tagId = Long.parseLong(tag);
        Ad ad = new Ad(
            user.getId(),
            tagId,
            request.getParameter("title"),
            request.getParameter("description")
        );
        System.out.println(ad.getUserId());
        System.out.println(ad.getDescription());
        System.out.println(ad.getTitle());
        System.out.println(ad.getPostDate());
        System.out.println(ad.getTagId());
        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/ads");
    }
}
