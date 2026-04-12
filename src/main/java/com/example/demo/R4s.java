package com.example.demo;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class R4s {
@Id
@GeneratedValue
private long id;
private long lastActive;
private long HighestScore;
private long QuizzesSolved;
private double AverageScore;
private String userEmail;
private String name;
private String bio;
private String profilePhoto;
private LocalDateTime joinDate;
private String country;
private String tier;
private String fullName;
private long rank;

public long getRank() {
	return rank;
}
public void setRank(long rank) {
	this.rank = rank;
}
public String getFullName() {
	return fullName;
}
public void setFullName(String fullName) {
	this.fullName = fullName;
}
public String getBio() {
	return bio;
}
public void setBio(String bio) {
	this.bio = bio;
}
public String getProfilePhoto() {
	return profilePhoto;
}
public void setProfilePhoto(String profilePhoto) {
	this.profilePhoto = profilePhoto;
}
public LocalDateTime getJoinDate() {
	return joinDate;
}
public void setJoinDate(LocalDateTime joinDate) {
	this.joinDate = joinDate;
}
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
public long getLastActive() {
	return lastActive;
}
public void setLastActive(long lastActive) {
	this.lastActive = lastActive;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getTier() {
	return tier;
}
public void setTier(String tier) {
	this.tier = tier;
}
private long score;

public long getScore() {
	return score;
}
public void setScore(long score) {
	this.score = score;
}
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}

public long getHighestScore() {
	return HighestScore;
}
public void setHighestScore(long highestScore) {
	HighestScore = highestScore;
}
public long getQuizzesSolved() {
	return QuizzesSolved;
}
public void setQuizzesSolved(long quizzesSolved) {
	QuizzesSolved = quizzesSolved;
}
public double getAverageScore() {
	return AverageScore;
}
public void setAverageScore(double averageScore) {
	AverageScore = averageScore;
}
public String getUserEmail() {
	return userEmail;
}
public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;
}



}
