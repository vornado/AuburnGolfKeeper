package com.example.augolf.services;

import com.example.augolf.models.UserModel;

import java.sql.*;

public class MySQLdb {
    String dbConnectionString = "jdbc:mysql://localhost:3306/augolfdb";
    String dbuser = "root";
    String dbpass = "password";

    Connection connection = null;
    static MySQLdb instance = null;

    public MySQLdb() throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try{
            connection = DriverManager.getConnection(dbConnectionString, dbuser, dbpass);
        }
        catch (SQLException ex){
           ex.printStackTrace();
        }
    }

    public static synchronized MySQLdb getInstance() throws ClassNotFoundException {
        if (instance == null){
            instance = new MySQLdb();
        }
        return instance;
    }

    public UserModel doLogin(String userName, String userPass) {
        try{
            UserModel userModel = null;
            String query = "SELECT * FROM user WHERE userName= ? and password= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, userPass);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                String firstName = resultSet.getString("firstName");
                String lastName = resultSet.getString("lastName");
                String email = resultSet.getString("email");
                int gender = resultSet.getInt("gender");
                int accountStatusId = resultSet.getInt("accountStatusId");
                int accountRoleId = resultSet.getInt("accountRoleId");
                UserModel temp = new UserModel(firstName, lastName, userName ,email, gender, accountStatusId, accountRoleId);
            }
            resultSet.close();
            preparedStatement.close();

            return userModel;
        }
        catch (SQLException ex){
            return null;
        }
    }
}
