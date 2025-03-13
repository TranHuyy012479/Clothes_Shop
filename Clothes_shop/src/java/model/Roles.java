/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tranh
 */
public class Roles {
    private int roleID;
    private String role;

    public Roles() {
    }

    public Roles(String role) {
        this.role = role;
    }

    public Roles(int roleID, String role) {
        this.roleID = roleID;
        this.role = role;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    
    
    
}
