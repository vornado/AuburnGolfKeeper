package com.example.augolf.Servlets;

import com.example.augolf.models.UserModel;
import com.example.augolf.services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/Login/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //If somehow the user information was passed null reject it
        if (username == null || password == null) {
            return;
        }

        //If somehow the user information was passed blank reject it
        if (username.length() == 0 || password.length() == 0) {
            return;
        }
        try {
            MySQLdb db = MySQLdb.getInstance();
            UserModel userModel = null;
            userModel = db.doLogin(username, password);

            if (userModel == null) {
                System.out.println("Account Not Found");
            } else {
                System.out.println("Account Found");
                HttpSession session = request.getSession();
                session.setAttribute("userToken", userModel);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }
}
