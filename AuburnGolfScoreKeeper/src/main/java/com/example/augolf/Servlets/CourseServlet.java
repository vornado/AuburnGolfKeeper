package com.example.augolf.Servlets;

import com.example.augolf.model.AccountModel;
import com.example.augolf.model.CourseModel;
import com.example.augolf.services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CourseServlet", value = "/Course/CourseServlet")
public class CourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            AccountModel am = (AccountModel) request.getSession().getAttribute("userToken");
            if (am == null) {
                request.setAttribute("errorMessage", "You need to sign in or sign up to access this page!");
                request.getRequestDispatcher("../Home/home.jsp").forward(request, response);
                return;
            }
            MySQLdb db = MySQLdb.getInstance();
            ArrayList<CourseModel> cm = db.getAllCourses();
            if (cm == null) {
                request.setAttribute("errorMessage", "Failed to load courses. Please try again later");
                request.getRequestDispatcher("../Score/Score.jsp").forward(request, response);
                return;
            }
            request.setAttribute("courses", cm);
            request.getRequestDispatcher("../Score/Score.jsp").forward(request, response);
            return;
        } catch (Exception ex) {
            request.setAttribute("errorMessage", "Failed to load courses. Please try again later");
            request.getRequestDispatcher("../Score/Score.jsp").forward(request, response);
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            AccountModel am = (AccountModel) request.getSession().getAttribute("userToken");
            if (am == null) {
                request.setAttribute("errorMessage", "You need to sign in or sign up to access this page!");
                request.getRequestDispatcher("../Home/home.jsp").forward(request, response);
                return;
            }
            String clubName = request.getParameter("cname");
            String courseName = request.getParameter("ccname");
            String[] par = request.getParameterValues("parName");
            String city = request.getParameter("LCname");
            String state = request.getParameter("LSname");

            if (par.length >= 19) {
                request.setAttribute("errorMessage", "Failed to add a course. Please try again later.");
                request.getRequestDispatcher("../Course/Course.jsp").forward(request, response);
                return;
            }

            MySQLdb db = MySQLdb.getInstance();
            CourseModel cm = null;
            ArrayList<Integer> newPar = new ArrayList<>();
            for (int index = 0; index < par.length; index++) {
                if (par[index] == "") {
                    break;
                }
                newPar.add(Integer.parseInt(par[index]));
            }
            cm = new CourseModel(0, clubName, courseName, city, state, newPar);
            if (db.addCourse(cm, am)) {
                request.setAttribute("successMessage", "Course has been successfully added");
                request.getRequestDispatcher("../Course/Course.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("errorMessage", "Failed to add a course. Please try again later.");
                request.getRequestDispatcher("../Course/Course.jsp").forward(request, response);
                return;
            }
        } catch (Exception ex) {
            request.setAttribute("errorMessage", "Failed to add a course. Please try again later.");
            request.getRequestDispatcher("../Course/Course.jsp").forward(request, response);
            return;
        }
    }
}
