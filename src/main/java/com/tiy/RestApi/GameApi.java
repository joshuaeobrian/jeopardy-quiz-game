package com.tiy.RestApi;

import com.tiy.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by josh on 4/15/17.
 */

@RestController
public class GameApi {

	@Autowired
	AnswerRepository answerRepository;
	@Autowired
	PlayerRepository playerRepository;
	@Autowired
	QuestionRepository questionRepository;

	@PostMapping("/Card")
	public List<Answer> getAnswers(Integer questionId, Integer categoryId){

		System.out.println("Question: "+ questionId);
		System.out.println("Category: "+ categoryId);


		return answerRepository.getQuestionAnswers(questionId, categoryId);
	}

	@PostMapping("/checkAnswer")
	public Integer checkAnswer(Integer answerId, Integer questionId, Integer sessionId){
		Player player = playerRepository.getPlayerBySessionId(sessionId);
		Answer answer = answerRepository.getAnswerByID(answerId);
		Question question = questionRepository.getQuestionById(questionId);
		if(!answer.isAnswer()){
			player.getPoints().removePoints(question.getValue());
		}else{
			player.getPoints().addPoints(question.getValue());
		}
		playerRepository.updatePoints(player);
			//send back Current Value
		return player.getPoints().getPoints();

	}
}
