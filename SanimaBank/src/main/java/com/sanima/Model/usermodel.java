package com.sanima.Model;

import java.time.LocalDate;

public class usermodel {

    private int id;
    private String username;
    private String firstName;
    private String lastName;
    private String gender;
    private LocalDate dob;
    private String email;
    private String phoneNumber;
    private String password;
    private String role;

    // Constructor for login
    public usermodel(String username, String password) {
        this.username = username;
        this.password = password;
    }
    public usermodel(int id, String firstName, String lastName, String username, LocalDate dob, String gender,
            String email, String phoneNumber, String password, String role) {
this.id = id;
this.firstName = firstName;
this.lastName = lastName;
this.username = username;
this.dob = dob;
this.gender = gender;
this.email = email;
this.phoneNumber = phoneNumber;
this.password = password;
this.role = role;
}

    // Constructor for insert (without ID)
    public usermodel(String firstName, String lastName, String username, LocalDate dob, String gender,
            String email, String phoneNumber, String password, String role) {
			this.firstName = firstName;
			this.lastName = lastName;
			this.username = username;
			this.dob = dob;
			this.gender = gender;
			this.email = email;
			this.phoneNumber = phoneNumber;
			this.password = password;
			this.role = role;
	}


    // Getters and Setters

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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}