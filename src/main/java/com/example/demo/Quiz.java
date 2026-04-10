package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity

public class Quiz {
@Id
@GeneratedValue
private long id;
private String title;
private String description;
private int numOfQuestion;
private int timeOfq;
@OneToMany(mappedBy = "quiz", cascade = CascadeType.ALL,orphanRemoval=true)
@JsonIgnore
private List<Question> questions = new ArrayList<>();

public List<Question> getQuestions() {
	return questions;
}
public void setQuestions(List<Question> questions) {
	this.questions = questions;
}
public int getTimeOfq() {
	return timeOfq;
}
public void setTimeOfq(int timeOfq) {
	this.timeOfq = timeOfq;
}
public int getNumOfQuestion() {
	return numOfQuestion;
}
public void setNumOfQuestion(int numOfQuestion) {
	this.numOfQuestion = numOfQuestion;
}
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}

}
