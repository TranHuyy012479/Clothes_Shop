/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tranh
 */
public class Users {
    private int id;
    private String username;
    private String password;
    private String fullName;
    private String address;
    private String email;
    private String phoneNumber;
    private String dob;
    private int roleID;
    private int isActive;
    private String createdAt;
    private String updatedAt;

    public Users() {
    }

    public Users(int id, String username, String password, String fullName, String address, String email, String phoneNumber, String dob, int roleID, int isActive, String createdAt, String updatedAt) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dob = dob;
        this.roleID = roleID;
        this.isActive = isActive;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    
    
    
    public Users(String username, String password) {
        this.username = username;
        this.password = password;
    }
    
    public Users(String fullname,String username, String email) {
        this.username = username;
        this.email = email;
    }


    public Users(String fullName, String username,String password,String address, String email, String phoneNumber, String dob, String updatedAt) {
        this.fullName = fullName;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dob = dob;
        this.username = username;
        this.updatedAt = updatedAt;
        this.password = password;
    }

    public Users(String username, String address, String email, String phoneNumber, String dob,String updatedAt,String fullname,int isActive) {
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dob = dob;
        this.username = username;
        this.fullName = fullname;
        this.updatedAt = updatedAt;
        this.isActive = isActive;
    }
    
    
    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Users{" +"id=" + id + ", username=" + username + ", password=" + password + ", fullName=" + fullName + ", address=" + address + ", email=" + email + ", phoneNumber=" + phoneNumber + ", dob=" + dob + ", roleID=" + roleID + ", isActive=" + isActive + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + '}';
    }
    
        
    
}
