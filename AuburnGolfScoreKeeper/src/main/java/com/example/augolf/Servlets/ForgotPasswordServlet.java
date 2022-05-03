package com.example.augolf.Servlets;

import com.example.augolf.model.AccountModel;
import com.example.augolf.services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ForgotPasswordServlet", value = "/ForgotPassword/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String email = request.getParameter("email");
            String username = request.getParameter("uname");
            String firstName = request.getParameter("firstName");

            try{
                MySQLdb db = MySQLdb.getInstance();

                if (username.length() <= 4){
                    //throw an error
                    request.setAttribute("errorMessageUsername", "The username provided is not valid. Please enter a valid username.");
                    request.getRequestDispatcher("/ForgotPassword/ForgotPassword.jsp").forward(request, response);
                    return;
                }

                if (email.indexOf("@") == -1){
                    //throw an error
                    request.setAttribute("errorMessageEmail", "The email provided is not valid. Please enter a valid username.");
                    request.getRequestDispatcher("/ForgotPassword/ForgotPassword.jsp").forward(request, response);
                    return;
                }

                if (db.checkEmailValid(email) ){
                    request.setAttribute("errorMessage", "The all information provided must match our records for a password reset.");
                    request.getRequestDispatcher("/ForgotPassword/ForgotPassword.jsp").forward(request, response);
                    return;
                }

                AccountModel am = null;
                am = db.lookupUserByEmail(email);
                if (am == null || !am.getFirstName().equals(firstName) || !am.getUserName().equals(username)){
                    request.setAttribute("errorMessage", "The all information provided must match our records for a password reset.");
                    request.getRequestDispatcher("/ForgotPassword/ForgotPassword.jsp").forward(request, response);
                    return;
                }
                String password = null;
                password = db.generatingPassword(am);

                if (password == null){
                    request.setAttribute("errorMessage", "Failed to reset password. Please try again later.");
                    request.getRequestDispatcher("/ForgotPassword/ForgotPassword.jsp").forward(request, response);
                    return;
                }
                else{
                    request.setAttribute("newPassword", "Your new password is " + password);
                    request.getRequestDispatcher("/ForgotPassword/ForgotPassword.jsp").forward(request, response);
                    return;
                }
            }
            catch (Exception ex){
                request.setAttribute("errorMessage", "Sorry, the information you provided is not on our system.");
                request.getRequestDispatcher("/ForgotPassword/ForgotPassword.jsp").forward(request, response);
                return;
            }
        }
        catch (Exception ex){
            request.setAttribute("errorMessage", "Sorry, the information you provided is not on our system.");
            request.getRequestDispatcher("/ForgotPassword/ForgotPassword.jsp").forward(request, response);
            return;
        }
    }
}
