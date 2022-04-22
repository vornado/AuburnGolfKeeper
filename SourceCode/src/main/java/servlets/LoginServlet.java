package com.agsk.auburngolfscorekeeper;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "loginServlet", value = "/Loginservlet")
public class LoginServlet extends HttpServlet {
    private String message;

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String dbURL = "jdbc:mysql://localhost:3306/augolfdb";
        String usernameDB = "root";
        String passwordDB = "password";

        if (username.length() <= 0 || password.length() <= 0){
            //Deny access to website
        }



    }

    public void destroy() {
    }
}