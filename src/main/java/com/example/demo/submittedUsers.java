package com.example.demo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class submittedUsers {
@Id
@GeneratedValue
private long id;
private String userEmail;
private long quizId;
private long score;
private String name;
private String profilePhoto;
private long rank;

public long getRank() {
	return rank;
}
public void setRank(long rank) {
	this.rank = rank;
}
public String getProfilePhoto() {
	return profilePhoto;
}
public void setProfilePhoto(String profilePhoto) {
	this.profilePhoto = profilePhoto;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
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
public String getUserEmail() {
	return userEmail;
}
public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;
}
public long getQuizId() {
	return quizId;
}
public void setQuizId(long quizId) {
	this.quizId = quizId;
}

}
