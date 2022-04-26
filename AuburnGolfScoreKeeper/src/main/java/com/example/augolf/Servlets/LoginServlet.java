package com.example.augolf.Servlets;

import com.example.augolf.model.AccountModel;
import com.example.augolf.services.MySQLdb;
import com.example.augolf.services.ReadXML;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Queue;

@WebServlet(name = "LoginServlet", value = "/Login/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Getting user's username and password that they passed
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //If somehow the user information was passed null reject it
        if (username == null || password == null) {
            request.setAttribute("errorMessage", "Username or Password is invalid.");
            request.getRequestDispatcher("/Login/login.jsp").forward(request, response);
        }

        //If somehow the user information was passed blank reject it
        if (username.length() == 0 || password.length() == 0) {
            request.setAttribute("errorMessage", "Username or Password is invalid.");
            request.getRequestDispatcher("/Login/login.jsp").forward(request, response);
        }
        try {
            //trying to find user in the db table
            MySQLdb db = MySQLdb.getInstance();
            AccountModel userModel = null;
            userModel = db.doLogin(username, password);
            ReadXML status = new ReadXML();
            status.readFile("accountStatusLookup.xml");

            //unable to find user throw them the default error
            if (userModel == null) {
                //No user found
                request.setAttribute("errorMessage", "Username or Password is invalid.");
                request.getRequestDispatcher("/Login/login.jsp").forward(request, response);
            } else {
                //Found the user
                HttpSession session = request.getSession();
                session.setAttribute("userToken", userModel);
                session.setAttribute("golfStatus", status.getAsm());

                //ToDo Need to actually use the AccountStatusXML
                //Is the user approved
                if (userModel.getAccountStatusId() == 3){
                    request.getRequestDispatcher("/Home/home.jsp").forward(request, response);
                }
                //Checking if user is pending
                else if (userModel.getAccountStatusId() == 1){
                    request.getRequestDispatcher("/pending.jsp").forward(request, response);
                }
                //failed to find the user send them to denied
                else{
                    request.getRequestDispatcher("/denied.jsp").forward(request, response);
                }
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }
}
