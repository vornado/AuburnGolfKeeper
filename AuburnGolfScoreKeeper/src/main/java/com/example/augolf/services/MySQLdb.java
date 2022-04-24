package com.example.augolf.services;

import com.example.augolf.model.AccountModel;
import com.example.augolf.model.RegisterModel;

import java.sql.*;
import java.lang.String;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class MySQLdb {
    String dbConnectionString = "jdbc:mysql://localhost:3306/augolfdb";
    String dbuser = "root";
    String dbpass = "password";

    Connection connection = null;
    static MySQLdb instance = null;

    public MySQLdb() throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try {
            connection = DriverManager.getConnection(dbConnectionString, dbuser, dbpass);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static synchronized MySQLdb getInstance() throws ClassNotFoundException {
        if (instance == null) {
            instance = new MySQLdb();
        }
        return instance;
    }

    //Check to see if a username if valid
    //returns false if username is already taken
    //returns true if the username is ready to be used
    public boolean checkUsernameValid(RegisterModel rm) {
        try {
            //Lock Table maybe

            String query = "SELECT * FROM user WHERE userName= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, rm.getUsername());
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                resultSet.close();
                preparedStatement.close();
                return false;
            } else {
                resultSet.close();
                preparedStatement.close();
                return true;
            }
        } catch (Exception exception) {
            return false;
        }
    }

    public boolean registerUser(RegisterModel rm) {
        try {
            String query = "INSERT INTO user (firstName, lastName, userName, email, password, gender, isActive, accountStatusId, accountRoleId, createdDate, lastModified) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String currentTime = dateFormat.format(new Date());

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, rm.getFirstName());
            preparedStatement.setString(2, rm.getLastName());
            preparedStatement.setString(3, rm.getUsername());
            preparedStatement.setString(4, rm.getEmail());
            preparedStatement.setString(5, rm.getPassword());
            preparedStatement.setInt(6, rm.getGender());
            preparedStatement.setInt(7, 1);
            preparedStatement.setInt(8, 1);
            preparedStatement.setInt(9, 1);
            preparedStatement.setString(10, currentTime);
            preparedStatement.setString(11, currentTime);

            boolean resultSet = preparedStatement.execute();
            preparedStatement.close();
            return resultSet;
        } catch (Exception ex) {
            return false;
        }
    }

    public AccountModel doLogin(String userName, String userPass) {
        try {
            AccountModel userModel = null;
            String query = "SELECT * FROM user WHERE userName= ? and password= ? and isActive= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, userPass);
            preparedStatement.setInt(3, 1);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String firstName = resultSet.getString("firstName");
                String lastName = resultSet.getString("lastName");
                String email = resultSet.getString("email");
                int gender = resultSet.getInt("gender");
                int accountStatusId = resultSet.getInt("accountStatusId");
                int accountRoleId = resultSet.getInt("accountRoleId");
                userModel = new AccountModel(firstName, lastName, email, gender, accountStatusId, accountRoleId);
            }
            resultSet.close();
            preparedStatement.close();
            return userModel;
        } catch (SQLException ex) {
            return null;
        }
    }
}
