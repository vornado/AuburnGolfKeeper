package com.example.augolf.Servlets;

import com.example.augolf.model.RegisterModel;
import com.example.augolf.services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", value = "Register/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Getting the user's registration
        try{
            String username = request.getParameter("regUsername");
            String password = request.getParameter("regPassword");
            String firstName = request.getParameter("regFirstname");
            String lastName = request.getParameter("regLastName");
            Integer gender = Integer.parseInt(request.getParameter("regGender"));
            String email = request.getParameter("regEmail");

            if (username.length() <= 4){
                //throw an error
                request.setAttribute("errorMessageUsername", "Username not long enough");
                request.getRequestDispatcher("/Account/register.jsp").forward(request, response);
            }

            if (password.length() <= 4){
                //throw an error
                request.setAttribute("errorMessagePassword", "Password not long enough");
                request.getRequestDispatcher("/Account/register.jsp").forward(request, response);
            }

            if (email.indexOf('@') == -1){
                //throw error since not address is wrong
                request.setAttribute("errorMessageEmail", "Not a valid email");
                request.getRequestDispatcher("/Account/register.jsp").forward(request, response);
            }

            try{
                MySQLdb db = MySQLdb.getInstance();
                RegisterModel rm = null;
                rm = new RegisterModel(username, password, firstName, lastName, email, gender);
                if (db.checkUsernameValid(rm)){
                    if (db.registerUser(rm)){
                        //Successfully created account
                        request.getRequestDispatcher("pending.jsp").forward(request, response);
                    }
                    else{
                        // Failed to create account
                        request.setAttribute("errorMessage", "Failed to create your account. Please try again later");
                        request.getRequestDispatcher("/Account/register.jsp").forward(request, response);
                    }
                }
                else{
                    //Username is not valid send an error
                    request.setAttribute("errorMessageUsername", "Username is already in-use");
                    request.getRequestDispatcher("/Account/register.jsp").forward(request, response);
                }
            }
            catch (Exception ex){
                request.setAttribute("errorMessage", "Failed to create your account. Please try again later");
                request.getRequestDispatcher("/Account/register.jsp").forward(request, response);
            }
        }
        catch (Exception exception){
            //Send error back
            request.setAttribute("errorMessage", "Failed to create your account. Please try again later");
            request.getRequestDispatcher("/Account/register.jsp").forward(request, response);
        }

    }
}
