package com.example.augolf.Servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ScoreServlet", value = "/ScoreServlet")
public class ScoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try
        {

        }
        catch ( Exception ex){
            //Google's Nest Error Message! Easter Egg!
            request.setAttribute("errorMessage", "Something went wrong! Please Try Again in a few seconds!");
            request.getRequestDispatcher("/Score/Score.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
