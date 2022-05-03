package com.example.augolf.Servlets;

import com.example.augolf.model.AccountModel;
import com.example.augolf.services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AccountServlet", value = "/AccountServlet")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            AccountModel am = (AccountModel) request.getSession().getAttribute("userToken");
            String newPassword = request.getParameter("password");
            MySQLdb db = MySQLdb.getInstance();
            if (!db.updatePersonalPassword(am, newPassword)) {
                request.setAttribute("errorMessage", "Failed to update password");
                request.getRequestDispatcher("/Account/UserProfile.jsp").forward(request, response);
                return;
            }
            request.getSession().invalidate();
            response.sendRedirect(request.getContextPath() +  "/index.jsp");
            return;
        }
        catch (Exception ex){
            request.setAttribute("errorMessage", "Failed to update password");
            request.getRequestDispatcher("/Account/UserProfile.jsp").forward(request, response);
            return;
        }
    }
}
