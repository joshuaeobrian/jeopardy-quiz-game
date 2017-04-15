package com.tiy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

/**
 * Created by josh on 4/14/17.
 */
@Component
public class CategoryRepository {
	@Autowired
	JdbcTemplate template;


	public List<Category> getBoardCategories() {
		List<Category> categories = template.query("Select id, category_type from category ORDER BY random() LIMIT 5;",
				(rs,i)->new Category(rs.getInt("id"),rs.getString("category_type")));

			for(Category category: categories){
				category.setQuestions(template.query("SELECT q.id as id,q.question as question, q.category_id as category, v.value_amount as amount FROM questions as q " +
								"JOIN item_value as v on v.id = q.value_id WHERE category_id=? " +
								"order by v.id asc LIMIT 5;",
						new Object[]{category.getId()},
						(rs,i)->new Question(rs.getInt("id"),
								rs.getString("question"),
								rs.getInt("category"),
								rs.getInt("amount"))));

			}


		return categories;
	}
}
