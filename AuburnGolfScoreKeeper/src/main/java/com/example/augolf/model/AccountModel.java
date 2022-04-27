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
    private int status;

    public AccountModel(int accountId, String firstName, String lastName, String userName, String email, int gender, int accountStatusId, int accountRoleId, int status) {
        this.accountId = accountId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.email = email;
        this.gender = gender;
        this.accountStatusId = accountStatusId;
        this.accountRoleId = accountRoleId;
        this.status = status;
    }

    public int getAccountId() { return accountId; }

    public void setAccountId(int accountId){ this.accountId = accountId; }

    public String getFirstName() { return firstName; }

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
