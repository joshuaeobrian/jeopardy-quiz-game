package com.tiy;

/**
 * Created by josh on 4/14/17.
 */
public class Answer {
	private Integer id;
	private String answer;
	private Integer questionId;
	private boolean isAnswer;

	public Answer(){

	}
	public Answer(Integer id, String answer, Integer questionId, boolean isAnswer){
		this.id = id;
		this.answer = answer;
		this.questionId = questionId;
		this.isAnswer = isAnswer;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public boolean isAnswer() {
		return isAnswer;
	}

	public void setAnswer(boolean answer) {
		isAnswer = answer;
	}
}
