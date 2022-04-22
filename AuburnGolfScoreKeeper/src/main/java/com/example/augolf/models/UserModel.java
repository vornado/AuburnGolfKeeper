package com.example.augolf.models;

public class UserModel {
    private String firstName;
    private String lastName;
    private String userName;
    private String email;
    private int gender;
    private int accountStatusId;
    private int getAccountRoleId;

    public UserModel(String firstName, String lastName, String userName, String email, int gender, int accountStatusId, int getAccountRoleId) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.email = email;
        this.gender = gender;
        this.accountStatusId = accountStatusId;
        this.getAccountRoleId = getAccountRoleId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int isGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getAccountStatusId() {
        return accountStatusId;
    }

    public void setAccountStatusId(int accountStatusId) {
        this.accountStatusId = accountStatusId;
    }

    public int getGetAccountRoleId() {
        return getAccountRoleId;
    }

    public void setGetAccountRoleId(int getAccountRoleId) {
        this.getAccountRoleId = getAccountRoleId;
    }
}
