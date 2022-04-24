package com.example.augolf.model;

import java.io.Serializable;
import java.lang.String;

public class AccountModel implements Serializable {
    private int accountId;
    private String firstName;
    private String lastName;
    private String userName;
    private String email;
    private int gender;
    private int accountStatusId;
    private int accountRoleId;

    public AccountModel(String firstName, String lastName, String email, int gender, int accountStatusId, int accountRoleId, int accountId) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.gender = gender;
        this.accountStatusId = accountStatusId;
        this.accountRoleId = accountRoleId;
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

    public int getGender() {
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

    public int getAccountRoleId() {
        return accountRoleId;
    }

    public void setAccountRoleId(int accountRoleId) {
        this.accountRoleId = accountRoleId;
    }
}
