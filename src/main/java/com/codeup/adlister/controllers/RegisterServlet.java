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
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String failedusername = (String) request.getAttribute("failedusername");
        String failedemail = (String) request.getAttribute("failedemail");
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String errorCodes = "";
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        User searchedUser = DaoFactory.getUsersDao().findByUsername(username);

        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation))
            || (searchedUser != null);

        if (inputHasErrors) {
            if(username.isEmpty()){
                errorCodes += 1;
            }
            if(email.isEmpty()){
                errorCodes += 2;
            }
            if(password.isEmpty()){
                errorCodes += 3;
            }
            if(!password.equals(passwordConfirmation)){
                errorCodes += 4;
            }
            if(searchedUser != null){
                errorCodes += 5;
            }

            request.getSession().setAttribute("errorCodes", errorCodes);
            request.getSession().setAttribute("failedusername", username);
            request.getSession().setAttribute("failedemail", email);
            response.sendRedirect("/register");
            return;
        }

        // create and save a new user
        User user = new User(username, email, password);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
