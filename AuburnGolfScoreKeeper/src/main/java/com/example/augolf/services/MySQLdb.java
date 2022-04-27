package com.example.augolf.services;

import com.example.augolf.model.AccountModel;
import com.example.augolf.model.CourseModel;
import com.example.augolf.model.RegisterModel;
import com.example.augolf.model.ScoreCardModel;

import java.sql.*;
import java.lang.String;
import java.util.ArrayList;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.Random;
import com.mysql.cj.jdbc.Blob;

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

    //#region load model

    private AccountModel loadAccountModel(ResultSet resultSet){
        try{
            String firstName = resultSet.getString("firstName");
            String lastName = resultSet.getString("lastName");
            String email = resultSet.getString("email");
            String userName = resultSet.getString("userName");
            int gender = resultSet.getInt("gender");
            int accountStatusId = resultSet.getInt("accountStatusId");
            int accountRoleId = resultSet.getInt("accountRoleId");
            int userId = resultSet.getInt("userId");
            return new AccountModel(userId, firstName, lastName, userName, email, gender, accountStatusId, accountRoleId, 1);
        } catch (SQLException e) {
            return null;
        }
    }

    private CourseModel loadCourseModel(ResultSet resultSet){
        try{
           int courseId = resultSet.getInt("courseId");
           String clubName = resultSet.getString("clubName");
           String courseName = resultSet.getString("courseName");
           String courseCity = resultSet.getString("courseCity");
           String courseState = resultSet.getString("courseState");
           String coursePar = resultSet.getString("coursePar");
           return new CourseModel(courseId, clubName, courseName, courseCity, courseState, coursePar);
        }catch (SQLException e){
            return null;
        }
    }

    private ScoreCardModel loadScoreCard(ResultSet resultSet){
        try{
            int scoreCardId = resultSet.getInt("scoreCardId");
            int userId = resultSet.getInt("userId");
            int courseId = resultSet.getInt("courseId");
            ArrayList<Integer> score = new ArrayList<Integer>();
            for (int index = 1; index != 19; index++){
                score.add(resultSet.getInt("scoreHole" + index));
            }
            int locked = resultSet.getInt("locked");
            Blob picture = (Blob) resultSet.getBlob("picture");
            return new ScoreCardModel(scoreCardId, userId, courseId, score, locked, picture);
        } catch (SQLException ex){
            return null;
        }
    }

    //#endregion

    private String getDateTime(Date date){
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        return dateFormat.format(date);
    }

    //#region selects

    //Check to see if a username if valid
    //returns false if username is already taken
    //returns true if the username is ready to be used
    public boolean checkUsernameValid(String username) {
        try {
            //Lock Table maybe
            String query = "SELECT * FROM user WHERE userName= ? AND isActive=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setInt(2,1);
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
            String query = "SELECT * FROM user WHERE email= ? AND isActive=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setInt(2,1);
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

    public ArrayList<AccountModel> getAllUsers(){
        try{
            String query = "SELECT * FROM user WHERE isActive= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,1);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<AccountModel> am = new ArrayList<AccountModel>();
            while (resultSet.next()){
                am.add(loadAccountModel(resultSet));
            }
            return am;
        }
        catch(Exception exception){
            return null;
        }
    }

    public ArrayList<AccountModel> getAllActiveUsers(){
        try{
            String query = "SELECT * FROM user WHERE accountStatus= ? AND isActive= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, 3);
            preparedStatement.setInt(2,1);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<AccountModel> am = new ArrayList<AccountModel>();
            while (resultSet.next()){
                am.add(loadAccountModel(resultSet));
            }
            return am;
        }
        catch(Exception exception){
            return null;
        }
    }

    public ArrayList<AccountModel> getAllPendingUsers(){
        try{
            String query = "SELECT * FROM user WHERE accountStatus= ? AND isActive= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, 1);
            preparedStatement.setInt(2,1);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<AccountModel> am = new ArrayList<AccountModel>();
            while (resultSet.next()){
                am.add(loadAccountModel(resultSet));
            }
            return am;
        }
        catch(Exception exception){
            return null;
        }
    }

    public ArrayList<AccountModel> getAllDeniedUsers(){
        try{
            String query = "SELECT * FROM user WHERE accountStatus= ? AND isActive= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, 2);
            preparedStatement.setInt(2,1);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<AccountModel> am = new ArrayList<AccountModel>();
            while (resultSet.next()){
                am.add(loadAccountModel(resultSet));
            }
            return am;
        }
        catch(Exception exception){
            return null;
        }
    }

    public AccountModel getUserByUserName(String username){
        try {
            //Lock Table maybe
            String query = "SELECT * FROM user WHERE userName= ? AND isActive=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setInt(2, 1);
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

    public ArrayList<CourseModel> getAllCourses(){
        try{
            ArrayList<CourseModel> cm = new ArrayList<>();
           String query = "SELECT * FROM courselookup WHERE isActive= ?";
           PreparedStatement preparedStatement = connection.prepareStatement(query);
           preparedStatement.setInt(1,1);
           ResultSet resultSet = preparedStatement.executeQuery();
           while (resultSet.next()){
               cm.add(loadCourseModel(resultSet));
           }
           return cm;
        } catch (SQLException ex){
            return null;
        }
    }

    public ScoreCardModel getHomeScoreCard(AccountModel am){
        try{
            ScoreCardModel scm = null;
            String query = "SELECT * FROM scorecardlookup WHERE userId= ? AND isActive= ? ORDER BY lastModified LIMIT 1";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, am.getAccountId());
            preparedStatement.setInt(2, 1);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                return loadScoreCard(resultSet);
            }
            else{
                return null;
            }
        }
        catch (SQLException ex){
            return null;
        }
    }

    public ScoreCardModel getAllScoreCard(AccountModel am){
        try{
            ScoreCardModel scm = null;
            String query = "SELECT * FROM scorecardlookup WHERE userId= ? AND isActive= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, am.getAccountId());
            preparedStatement.setInt(2, 1);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                return loadScoreCard(resultSet);
            }
            else{
                return null;
            }
        }
        catch (SQLException ex){
            return null;
        }
    }

    //Check to see if a username if valid
    //returns false if username is already taken
    //returns true if the username is ready to be used
    public boolean checkEmailValid(String email) {
        try {
            //Lock Table maybe
            String query = "SELECT * FROM user WHERE email= ? AND isActive=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setInt(2, 1);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                resultSet.close();
                preparedStatement.close();
                return true;
            } else {
                resultSet.close();
                preparedStatement.close();
                return false;
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
            String currentTime = getDateTime(new Date());

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

    public boolean addCourse(CourseModel cm, AccountModel am){
        try{
            String query = "INSERT INTO courselookup (clubName, courseName, courseCity, courseState, coursePar, createdDate, lastModified, lastModifiedBy, isActive) "
                    + "VALUES (?,?,?,?,?,?,?,?,?)";
            String currentTime = getDateTime(new Date());
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,cm.getClubName());
            preparedStatement.setString(2, cm.getCourseName());
            preparedStatement.setString(3, cm.getCourseCity());
            preparedStatement.setString(4, cm.getCourseState());
            preparedStatement.setString(5, cm.getCoursePar());
            preparedStatement.setString(6, currentTime);
            preparedStatement.setString(7, currentTime);
            preparedStatement.setString(8, am.getUserName());
            preparedStatement.setInt(9, 1);
            int resultSet = preparedStatement.executeUpdate();
            return resultSet == 1;
        }
        catch (SQLException ex){
            return false;
        }
    }

    public boolean addScoreCard(ScoreCardModel scm, CourseModel cm,AccountModel am){
        try{
            String query = "INSERT INTO scorecardlookup (userId, courseId, score, locked, picture, createdDate, lastModified, lastModifiedBy, isActive) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?<?<?<?)";
            String currentTime = getDateTime(new Date());
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, am.getAccountId());
            preparedStatement.setInt(2, cm.getCourseId());
            ArrayList<Integer> tempScore = scm.getScore();
            Iterator<Integer> iter = tempScore.iterator();
            for (int index = 1; index != 19; index++){
                preparedStatement.setInt(index + 2, iter.next());
            }
            preparedStatement.setInt(21, scm.getLocked());
            preparedStatement.setBlob(22, scm.getPicture());
            preparedStatement.setString(23, currentTime);
            preparedStatement.setString(24, currentTime);
            preparedStatement.setString(25, am.getUserName());
            preparedStatement.setInt(26, 1);
            int resultSet = preparedStatement.executeUpdate();
            return resultSet == 1;
        }
        catch (SQLException ex){
            return false;
        }
    }

    //endregion

    //region Update

    public String generatingPassword(AccountModel am){
        try{
            int leftLimit = 97; // letter 'a'
            int rightLimit = 122; // letter 'z'
            int targetStringLength = 10;
            Random random = new Random();
            StringBuilder buffer = new StringBuilder(targetStringLength);
            for (int i = 0; i < targetStringLength; i++) {
                int randomLimitedInt = leftLimit + (int)
                        (random.nextFloat() * (rightLimit - leftLimit + 1));
                buffer.append((char) randomLimitedInt);
            }
            String generatedString = buffer.toString();
            String query = "Update user SET password= ?, lastModified=?, lastModifiedBy where username= ? AND email= ? AND firstName= ? AND isActive=?";
            Date now = new Date();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, generatedString);
            preparedStatement.setString(2, getDateTime(now));
            preparedStatement.setString(3, "SYSTEM");
            preparedStatement.setString(4, am.getUserName());
            preparedStatement.setString(5, am.getEmail());
            preparedStatement.setString(6, am.getFirstName());
            preparedStatement.setInt(7, 1);
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

    public boolean updateUserStatus(AccountModel am, int newStatus, AccountModel privUser){
       try{
           if (privUser.getAccountRoleId() == 1){
               return false;
           }
           String query = "UPDATE user SET accountStatusId= ?, lastModified= ?, lastModifiedBy= ? WHERE userId= ? AND isActive= ?";
           PreparedStatement preparedStatement = connection.prepareStatement(query);
           preparedStatement.setInt(1, newStatus);
           preparedStatement.setString(2, getDateTime(new Date()));
           preparedStatement.setString(3, privUser.getUserName());
           preparedStatement.setInt(4, am.getAccountId());
           preparedStatement.setInt(5, 1);
           int resultSet = preparedStatement.executeUpdate();
           return resultSet == 1;
       } catch (SQLException ex){
           return false;
       }
    }

    public boolean updateUserRole(AccountModel am, int newRole, AccountModel privUser){
        try{
            if (newRole == 3 && privUser.getAccountRoleId() != 3){
                return false;
            }
            if (newRole == 2 && privUser.getAccountRoleId() == 1){
                return false;
            }
            String query = "UPDATE user SET accountRoleId= ? WHERE userId= ? AND isActive= ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, newRole);
            preparedStatement.setInt(2, am.getAccountId());
            preparedStatement.setInt(3, 1);
            int resultSet = preparedStatement.executeUpdate();
            return resultSet == 1;
        } catch (SQLException ex){
            return false;
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
