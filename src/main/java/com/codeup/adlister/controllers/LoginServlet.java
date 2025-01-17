package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    String returnTo;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        returnTo = (String) request.getSession().getAttribute("returnTo");
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String errorCodes = "";
        User user = DaoFactory.getUsersDao().findByUsername(username);

        if (user == null) {
            errorCodes += "1";
            request.getSession().setAttribute("wrongUsername", username);
            request.getSession().setAttribute("profileErrors", errorCodes);
            response.sendRedirect("/login");
            return;
        }

        boolean validAttempt = Password.check(password, user.getPassword());

        if (validAttempt && returnTo == null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");
        }else if(validAttempt && returnTo != null){
            request.getSession().setAttribute("user", user);
            request.getSession().removeAttribute("returnTo");
            response.sendRedirect(returnTo);
        } else {
            errorCodes += 2;
            request.getSession().setAttribute("profileErrors", errorCodes);
            request.getSession().setAttribute("wrongUsername", username);
            response.sendRedirect("/login");
        }
    }
}
