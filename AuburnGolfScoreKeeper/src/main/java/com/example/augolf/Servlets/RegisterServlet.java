package com.example.augolf.Servlets;

import com.example.augolf.model.RegisterModel;
import com.example.augolf.services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", value = "/SignUp/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Getting the user's registration
        try{
            String username = request.getParameter("uname");
            String password = request.getParameter("psw");
            String firstName = request.getParameter("regFirstName");
            String lastName = request.getParameter("regLastName");
            Integer gender = Integer.parseInt(request.getParameter("regGender"));
            String email = request.getParameter("email");

            if (username.length() <= 4){
                //throw an error
                request.setAttribute("errorMessage", "The username provided is not valid. Please enter a valid username.");
                request.getRequestDispatcher("../SignUp/SignUp.jsp").forward(request, response);
            }

            if (password.length() <= 4){
                //throw an error
                request.setAttribute("errorMessage", "The password provided is not valid. Please enter a valid password.");
                request.getRequestDispatcher("../SignUp/SignUp.jsp").forward(request, response);
            }

            if (email.indexOf('@') == -1){
                //throw error since not address is wrong
                request.setAttribute("errorMessage", "The email provided is not valid. Please enter a valid email.");
                request.getRequestDispatcher("../SignUp/SignUp.jsp").forward(request, response);
            }

            try{
                MySQLdb db = MySQLdb.getInstance();
                RegisterModel rm = null;
                rm = new RegisterModel(username, password, firstName, lastName, email, gender);
                if (db.checkUsernameValid(rm.getUsername())){
                    if (!db.checkEmailValid(rm.getEmail())){
                        request.setAttribute("errorMessage", "The email provided is already in use. Please Login");
                        request.getRequestDispatcher("../SignUp/SignUp.jsp").forward(request, response);
                    }

                    if (db.registerUser(rm)){
                        //Successfully created account
                        request.getRequestDispatcher("../Account/Wait.jsp").forward(request, response);
                    }
                    else{
                        // Failed to create account
                        request.setAttribute("errorMessage", "Failed to create your account. Please try again later.");
                        request.getRequestDispatcher("../SignUp/SignUp.jsp").forward(request, response);
                    }
                }
                else{
                    //Username is not valid send an error
                    request.setAttribute("errorMessage", "The username provided is already in use by another account. Please try another username.");
                    request.getRequestDispatcher("../SignUp/SignUp.jsp").forward(request, response);
                }
            }
            catch (Exception ex){
                request.setAttribute("errorMessage", "Failed to create your account. Please try again later.");
                request.getRequestDispatcher("../SignUp/SignUp.jsp").forward(request, response);
            }
        }
        catch (Exception exception){
            //Send error back
            request.setAttribute("errorMessage", "Failed to create your account. Please try again later.");
            request.getRequestDispatcher("../SignUp/SignUp.jsp").forward(request, response);
        }

    }
}
