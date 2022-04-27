package com.example.augolf.Servlets;

import com.example.augolf.model.AccountModel;
import com.example.augolf.services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet(name = "AdminServlet", value = "/Admin/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            AccountModel am = (AccountModel) request.getSession().getAttribute("userToken");
            if (am == null) {
                request.setAttribute("errorMessage", "You need to sign in or sign up to access this page!");
                request.getRequestDispatcher("/SignUp/SignUp.jsp").forward(request, response);
                return;
            }
            if (am.getAccountRoleId() == 1) {
                request.setAttribute("errorMessage", "You do not have permission to see this page!");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }

            MySQLdb db = MySQLdb.getInstance();
            ArrayList<AccountModel> listAM = db.getAllUsers();
            if (listAM == null){
                request.setAttribute("errorMessage", "Failed to get all the users. Please try again later!");
                request.getRequestDispatcher("/Admin/Admin.jsp").forward(request, response);
            }
            request.setAttribute("users", listAM);
            request.getRequestDispatcher("/Admin/Admin.jsp").forward(request, response);
            return;
        }
        catch ( Exception ex){
            //Google's Nest Error Message! Easter Egg!
            request.setAttribute("errorMessage", "Something went wrong! Please Try Again in a few seconds!");
            request.getRequestDispatcher("/SignUp/SignUp.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
