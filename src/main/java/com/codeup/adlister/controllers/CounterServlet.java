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

@WebServlet(name = "controllers.CounterServlet", urlPatterns = "/count")
public class CounterServlet extends HttpServlet {
    private int counter = 0;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userSearch = request.getParameter("search");
        List<Ad> ads = DaoFactory.getAdsDao().all();
        List<Ad> searchedAds = new ArrayList<>();
        for(Ad ad : ads){
            if(ad.getTitle().toLowerCase().contains(userSearch.toLowerCase())){
                searchedAds.add(ad);
            }
        }
        request.setAttribute("ads", searchedAds);
        try {
            request.getRequestDispatcher("/WEB-INF/temp-search.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
}
