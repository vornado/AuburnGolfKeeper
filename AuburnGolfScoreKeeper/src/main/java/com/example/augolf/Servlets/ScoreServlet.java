package com.example.augolf.Servlets;

import com.example.augolf.model.AccountModel;
import com.example.augolf.services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ScoreServlet", value = "/ScoreServlet")
public class ScoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            AccountModel am = (AccountModel) request.getSession().getAttribute("userToken");
            if (am == null){
                request.setAttribute("errorMessage", "You need to sign in or sign up to access this page!");
                request.getRequestDispatcher("../Home/home.jsp").forward(request, response);
                return;
            }
            MySQLdb db = MySQLdb.getInstance();
            db.getAllScoreCard(am);
        }
        catch ( Exception ex){
            //Google's Nest Error Message! Easter Egg!
            request.setAttribute("errorMessage", "Something went wrong! Please Try Again in a few seconds!");
            request.getRequestDispatcher("/Score/Score.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Getting user's score that they passed
        String score = request.getParameter("ccname");

        //If somehow the user information was passed null reject it
        if (score == null ) {
            request.setAttribute("errorMessage", " Score you entered is invalid.");
            request.getRequestDispatcher("../Score/Score.jsp").forward(request, response);
        }
        //If somehow the user information was passed blank reject it
        if (score.length() == 0 ) {
            request.setAttribute("errorMessage", "Please Enter a Valid Score.");
            request.getRequestDispatcher("../Score/Score.jsp").forward(request, response);
        }
    }
}
