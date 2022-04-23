package com.example.augolf.model;

public class AccountStatusModel {
    //Yes I am fully aware that an enum or db table where I can join would work
    //But this is an XML JSP class.
    private int statusNumber;
    private String statusName;

    public AccountStatusModel(int statusNumber, String statusName) {
        this.statusNumber = statusNumber;
        this.statusName = statusName;
    }

    public int getStatusNumber() {
        return statusNumber;
    }

    public void setStatusNumber(int statusNumber) {
        this.statusNumber = statusNumber;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}
