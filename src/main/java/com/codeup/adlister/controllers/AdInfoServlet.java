package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AdInfoServlet", urlPatterns = "/info")
public class AdInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedAdTitle = (String) request.getParameter("selectedad");
        Ad selectedAd = DaoFactory.getAdsDao().findByTitle(selectedAdTitle);
        long userId = selectedAd.getUserId();
        User adCreator = DaoFactory.getUsersDao().findByUserId(userId);
        request.setAttribute("adCreator", adCreator);
        request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
    }
}
