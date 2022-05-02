package com.example.augolf.Servlets;

import com.example.augolf.model.AccountModel;
import com.example.augolf.model.CourseModel;
import com.example.augolf.model.ScoreCardModel;
import com.example.augolf.services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ScoreServlet", value = "/Score/ScoreServlet")
public class ScoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            AccountModel am = (AccountModel) request.getSession().getAttribute("userToken");
            if (am == null){
                return;
            }

            MySQLdb db = MySQLdb.getInstance();
            ArrayList<ScoreCardModel> listAM = db.getUsersScoreCard(am);
            if (listAM == null){
                request.setAttribute("errorMessage", "Failed to get all the users. Please try again later!");
                request.getRequestDispatcher("../Score/ScoreCard.jsp").forward(request, response);
            }
            request.setAttribute("scoreCard", listAM);
            request.getRequestDispatcher("../Score/ScoreCard.jsp").forward(request, response);
        } catch (Exception ex) {
            //Google's Nest Error Message! Easter Egg!
            request.setAttribute("errorMessage", "Something went wrong! Please Try Again in a few seconds!");
            request.getRequestDispatcher("/Score/Score.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            AccountModel am = (AccountModel) request.getSession().getAttribute("userToken");
            String courseId = request.getParameter("golfCourseId");
            String[] score = request.getParameterValues("parName");

            if (courseId == "-1") {
                request.setAttribute("errorMessage", "Please Select a Course");
                request.getRequestDispatcher("../Score/Score.jsp").forward(request, response);
            }

            MySQLdb db = MySQLdb.getInstance();
            ScoreCardModel scm = null;
            ArrayList<Integer> newPar = new ArrayList<>();
            for (int index = 0; index < score.length; index++) {
                if (score[index] == "") {
                    break;
                }
                newPar.add(Integer.parseInt(score[index]));
            }
            scm = new ScoreCardModel(0, am.getAccountId(), Integer.parseInt(courseId), newPar);
            if (db.addScoreCard(scm, Integer.parseInt(courseId), am)) {
                request.setAttribute("successMessage", "Course has been successfully added");
                request.getRequestDispatcher("../Score/Score.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Score failed to upload");
                request.getRequestDispatcher("../Score/Score.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            request.setAttribute("errorMessage", "Score failed to upload");
            request.getRequestDispatcher("../Score/Score.jsp").forward(request, response);
        }
    }
}
