package com.example.augolf.model;

public class AccountRoleModel {

    private int statusNumber;
    private String statusName;

    public AccountRoleModel(int statusNumber, String statusName) {
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
