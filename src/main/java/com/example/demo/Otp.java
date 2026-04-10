package com.example.demo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Otp {
@Id
@GeneratedValue
private long id;
private String name;
private String email;
private String otp;

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getOtp() {
	return otp;
}
public void setOtp(String otp) {
	this.otp = otp;
}

}
