package com.example.demo;

import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;

@Entity

public class takeQUiz {
@Id
@GeneratedValue
private long id;
//private long quizId;
private String title;
private int numOfQuestion;

@OneToOne(fetch=FetchType.EAGER)
@JoinColumn(name="quiz_id", unique=true)

private Quiz quiz;


public int getNumOfQuestion() {
	return numOfQuestion;
}
public void setNumOfQuestion(int numOfQuestion) {
	this.numOfQuestion = numOfQuestion;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public Quiz getQuiz() {
	return quiz;
}
public void setQuiz(Quiz quiz) {
	this.quiz = quiz;
}
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}


}
