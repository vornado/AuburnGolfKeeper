package com.example.augolf.Servlets;

import com.example.augolf.model.AccountModel;
import com.example.augolf.services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ForgotPasswordServlet", value = "/Account/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String firstName = request.getParameter("firstName");

            try{
                MySQLdb db = MySQLdb.getInstance();

                if (username.length() <= 4){
                    //throw an error
                    request.setAttribute("errorMessageUsername", "The username provided is not valid. Please enter a valid username.");
                    request.getRequestDispatcher("/Account/forgotPassword.jsp").forward(request, response);
                }

                if (email.indexOf("@") == -1){
                    //throw an error
                    request.setAttribute("errorMessageEmail", "The email provided is not valid. Please enter a valid username.");
                    request.getRequestDispatcher("/Account/forgotPassword.jsp").forward(request, response);
                }

                if (!db.checkEmailValid(email) ){
                    request.setAttribute("errorMessage", "The all information provided must match our records for a password reset.");
                    request.getRequestDispatcher("/Account/forgotPassword.jsp").forward(request, response);
                }

                AccountModel am = null;
                am = db.lookupUserByEmail(email);
                if (am == null || am.getFirstName() != firstName || am.getUserName() != username){
                    request.setAttribute("errorMessage", "The all information provided must match our records for a password reset.");
                    request.getRequestDispatcher("/Account/forgotPassword.jsp").forward(request, response);
                }
                String password = null;
                password = db.generatingPassword(am);

                if (password == null){
                    request.setAttribute("errorMessage", "Failed to reset password. Please try again later.");
                    request.getRequestDispatcher("/Account/forgotPassword.jsp").forward(request, response);
                }
                else{
                    request.setAttribute("newPassword", "Your new password is " + password);
                    request.getRequestDispatcher("/Account/forgotPassword.jsp").forward(request, response);
                }
            }
            catch (Exception ex){
                request.setAttribute("errorMessage", "Sorry, the information you provided is not on our system.");
                request.getRequestDispatcher("Account/forgotPassword.jsp").forward(request, response);
            }
        }
        catch (Exception ex){
            request.setAttribute("errorMessage", "Sorry, the information you provided is not on our system.");
            request.getRequestDispatcher("Account/forgotPassword.jsp").forward(request, response);
        }
    }
}
