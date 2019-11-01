package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Tag;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EditServlet", urlPatterns = "/edit")
public class EditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().getAttribute("edit");
        response.sendRedirect("/edit-page");
//        User user = (User) request.getSession().getAttribute("user");
//        Tag tag = (Tag) request.getSession().getAttribute("tag");
//        Ad adDate = (Ad) request.getSession().getAttribute("ad");
//        Ad ad = new Ad(
//                user.getId(),
//                tag.getId(),
//                request.getParameter("edit"),
//                request.getParameter("description")
//                adDate.getPosted_date()
//        );
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        if (request.getSession().getAttribute("user") == null) {
//            response.sendRedirect("/login");
//            return;
//        }
        String adIdString = request.getParameter("selectedad");
        long adId = Long.parseLong(adIdString);
        Ad editAd = DaoFactory.getAdsDao().findById(adId);

        request.setAttribute("ad", editAd);

        try {
            request.getRequestDispatcher("/WEB-INF/edit-page.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
}
