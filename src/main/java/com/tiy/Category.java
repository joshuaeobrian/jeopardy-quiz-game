package com.tiy;

import java.util.List;

/**
 * Created by josh on 4/14/17.
 */
public class Category {
	private Integer id;
	private String category;
	private List<Question> questions;

	public Category(){

	}
	public Category(Integer id, String category){
		this.id = id;
		this.category = category;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
}
