package com.example.demo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class StudentAnswer {
@Id
@GeneratedValue
private long id;
private int selectedOption;
private long questionId;
private String userEmail;
private long quizId;

public long getQuizId() {
	return quizId;
}
public void setQuizId(long quizId) {
	this.quizId = quizId;
}
public String getUserEmail() {
	return userEmail;
}
public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;
}
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public int getSelectedOption() {
	return selectedOption;
}
public void setSelectedOption(int selectedOption) {
	this.selectedOption = selectedOption;
}
public long getQuestionId() {
	return questionId;
}
public void setQuestionId(long questionId) {
	this.questionId = questionId;
}

}
