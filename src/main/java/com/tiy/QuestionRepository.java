package com.tiy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by josh on 4/14/17.
 */
@Component
public class QuestionRepository {
	@Autowired
	JdbcTemplate template;

	public Question getQuestionById(Integer questionId){
		return template.queryForObject("SELECT q.id as id, q.question as question, q.category_id as category_id, i.value_amount as amount " +
						"FROM questions as q JOIN item_value as i on q.value_id = i.id WHERE q.id=?;",
				new Object[]{questionId},
				(rs,i)-> new Question(
						rs.getInt("id"),
						rs.getString("question"),
						rs.getInt("category_id"),
						rs.getInt("amount")
				));
	}

}
