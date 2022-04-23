package com.example.augolf.services;

import com.example.augolf.model.AccountModel;
import java.sql.*;
import java.lang.String;

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

    public AccountModel doLogin(String userName, String userPass) {
        try{
            AccountModel userModel = null;
            String query = "SELECT * FROM user WHERE userName= ? and password= ? and isActive= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, userPass);
            preparedStatement.setInt(3, 1);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
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
        }
        catch (SQLException ex){
            return null;
        }
    }
}
