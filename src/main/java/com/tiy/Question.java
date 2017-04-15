package com.tiy;

/**
 * Created by josh on 4/14/17.
 */
public class Question {
	private Integer id;
	private String question;
	private Integer categoryId;
	private Integer value;

	public Question(){

	}
	public Question(Integer id, String question, Integer categoryId,Integer value){
		this.id = id;
		this.question = question;
		this.categoryId = categoryId;
		this.value = value;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}
}
