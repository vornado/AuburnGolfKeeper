package com.example.augolf.Servlets;

import com.example.augolf.model.AccountModel;
import com.example.augolf.model.CourseModel;
import com.example.augolf.services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CourseServlet", value = "/Course/CourseServlet")
public class CourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            AccountModel am = (AccountModel) request.getSession().getAttribute("userToken");
            if (am == null){
                request.setAttribute("errorMessage", "You need to sign in or sign up to access this page!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            String clubName = request.getParameter("cname");
            String courseName = request.getParameter("ccname");
            String par = request.getParameter("parname");
            String city = request.getParameter("LCname");
            String state = request.getParameter("LSname");

            MySQLdb db = MySQLdb.getInstance();
            CourseModel cm = null;
            cm = new CourseModel(0, clubName, courseName, city, state, par, 0);
            if (db.addCourse(cm, am)){
                request.setAttribute("successMessage", "Course has been successfully added");
                request.getRequestDispatcher("/Course/Course.jsp").forward(request, response);
            }
            else{
                request.setAttribute("errorMessage", "Failed to add a course. Please try again later.");
                request.getRequestDispatcher("/Course/Course.jsp").forward(request, response);
            }
        }
        catch(Exception ex){
            request.setAttribute("errorMessage", "Failed to add a course. Please try again later.");
            request.getRequestDispatcher("/Course/Course.jsp").forward(request, response);
        }
    }
}
