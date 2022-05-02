package com.example.augolf.model;

public class AccountRoleModel {

    private int roleNumber;
    private String roleName;

    public AccountRoleModel(int roleNumber, String roleName) {
        this.roleNumber = roleNumber;
        this.roleName = roleName;
    }

    public int getRoleNumber() {
        return roleNumber;
    }

    public void seRoleNumber(int roleNumber) {
        this.roleNumber = roleNumber;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setStatusName(String statusName) {
        this.roleName = roleName;
    }

}
