package com.tiy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

/**
 * Created by josh on 4/14/17.
 */
@Component
public class AnswerRepository {

	@Autowired
	JdbcTemplate template;

	public List<Answer> getQuestionAnswers(Integer questionId, Integer categoryId){
		return template.query("select id, answer,question_id,isanswer from answers WHERE question_id=? ORDER BY random()LIMIT 4",
				new Object[]{questionId},(rs,i)-> new Answer(
						rs.getInt("id"),
						rs.getString("answer"),
						rs.getInt("question_id"),
						rs.getBoolean("isanswer")));
	}
	public Answer getAnswerByID(Integer answerId){
		return  template.queryForObject("select id, answer,question_id,isanswer from answers WHERE id=? ",
				new Object[]{answerId},(rs,i)-> new Answer(
						rs.getInt("id"),
						rs.getString("answer"),
						rs.getInt("question_id"),
						rs.getBoolean("isanswer")));
	}

	public String isAnswerCorrect(Integer answerId,Integer questionID){
		return  template.queryForObject("Select a.isanswer as is, i.value_amount as amount from answers as a " +
				"JOIN questions as q on q.id=a.question_id " +
				"JOIN item_value as i on i.id=q.value_id " +
				"where a.id=? and a.question_id=?",new Object[]{answerId,questionID},
				(rs,i)->String.format("{ \"isAnswer\": %s, \"amount\": %s}",rs.getBoolean("is"),rs.getInt("amount")));



	}
}
