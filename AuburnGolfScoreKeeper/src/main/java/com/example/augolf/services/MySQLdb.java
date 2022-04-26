package com.example.augolf.services;

import com.example.augolf.model.AccountModel;
import com.example.augolf.model.RegisterModel;

import java.nio.charset.Charset;
import java.sql.*;
import java.lang.String;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Random;

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

    private AccountModel loadAccountModel(ResultSet resultSet){
        try{
            String firstName = resultSet.getString("firstName");
            String lastName = resultSet.getString("lastName");
            String email = resultSet.getString("email");
            int gender = resultSet.getInt("gender");
            int accountStatusId = resultSet.getInt("accountStatusId");
            int accountRoleId = resultSet.getInt("accountRoleId");
            int userId = resultSet.getInt("userId");
            return new AccountModel(firstName, lastName, email, gender, accountStatusId, accountRoleId, userId, 1);
        } catch (SQLException e) {
            return null;
        }
    }

    private String getDateTime(Date date){
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        return dateFormat.format(date);
    }

    //#region AccountLookup

    //Check to see if a username if valid
    //returns false if username is already taken
    //returns true if the username is ready to be used
    public boolean checkUsernameValid(String username) {
        try {
            //Lock Table maybe
            String query = "SELECT * FROM user WHERE userName= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
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

    public AccountModel lookupUserByEmail(String email){
        try {
            //Lock Table maybe
            String query = "SELECT * FROM user WHERE email= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            AccountModel am = null;
            if (resultSet.next()) {
                am = loadAccountModel(resultSet);
                resultSet.close();
                preparedStatement.close();
                return am;
            } else {
                resultSet.close();
                preparedStatement.close();
                return null;
            }
        } catch (Exception exception) {
            return null;
        }
    }


    public AccountModel getUserByUserName(String username){
        try {
            //Lock Table maybe
            String query = "SELECT * FROM user WHERE userName= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            AccountModel am = null;
            if (resultSet.next()) {
                am = loadAccountModel(resultSet);
                resultSet.close();
                preparedStatement.close();
                return am;
            } else {
                resultSet.close();
                preparedStatement.close();
                return null;
            }
        } catch (Exception exception) {
            return null;
        }
    }


    //Check to see if a username if valid
    //returns false if username is already taken
    //returns true if the username is ready to be used
    public boolean checkEmailValid(String email) {
        try {
            //Lock Table maybe
            String query = "SELECT * FROM user WHERE email= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
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

    //endregion

    //region Inserts

    public boolean registerUser(RegisterModel rm) {
        try {
            String query = "INSERT INTO user (firstName, lastName, userName, email, password, gender, isActive, accountStatusId, accountRoleId, createdDate, lastModified, lastModifiedBy) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
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
            preparedStatement.setString(12, "SYSTEM");
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet == 1;
        } catch (Exception ex) {
            return false;
        }
    }

    //endregion

    //region Update

    public String generatingPassword(AccountModel am){
        try{
            byte[] array = new byte[10];
            new Random().nextBytes(array);
            String generatedString = new String(array, Charset.forName("UTF-8"));
            String query = "Update user SET password= ?, lastModified=? where username= ? AND email= ? AND firstName= ?";
            Date now = new Date();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, generatedString);
            preparedStatement.setString(2, getDateTime(now));
            preparedStatement.setString(3, am.getUserName());
            preparedStatement.setString(4, am.getEmail());
            preparedStatement.setString(5, am.getFirstName());
            int resultSet = preparedStatement.executeUpdate();
            if (resultSet == 1){
                return generatedString;
            }
            else if (resultSet != 1){
                //panic
                //ToDo: consider implementing a logger
                return null;
            }
            else{
                return null;
            }
        }
        catch (Exception ex){
            return null;
        }
    }

    //endregion

    //region functionality

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
                userModel = loadAccountModel(resultSet);
            }
            resultSet.close();
            preparedStatement.close();
            return userModel;
        } catch (SQLException ex) {
            return null;
        }
    }

    //endregion
}
