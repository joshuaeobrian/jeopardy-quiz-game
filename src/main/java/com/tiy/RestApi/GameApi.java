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

	/**
	 * sends a list of answers to load buttons
	 * @param questionId
	 * @param categoryId
	 * @return
	 */
	@PostMapping("/Card")
	public List<Answer> getAnswers(Integer questionId, Integer categoryId){

		System.out.println("Question: "+ questionId);
		System.out.println("Category: "+ categoryId);


		return answerRepository.getQuestionAnswers(questionId, categoryId);
	}

	/**
	 * need to maybe return answer object and player
	 * @param answerId
	 * @param questionId
	 * @param sessionId
	 * @return
	 */
	@PostMapping("/checkAnswer")
	public Object[] checkAnswer(Integer answerId, Integer questionId, Integer sessionId){
		Player player = playerRepository.getPlayerBySessionId(sessionId);
		Answer answer = answerRepository.getAnswerByID(answerId);
		Integer correctAnswerID = answerRepository.getCorrectAnswerID(questionId);
		Question question = questionRepository.getQuestionById(questionId);
		if(!answer.isAnswer()){
			player.getPoints().removePoints(question.getValue());
		}else{
			player.getPoints().addPoints(question.getValue());
		}
		playerRepository.updatePoints(player);
			//send back Current Value
		return new Object[]{answer.isAnswer(),player.getPoints().getPoints(), correctAnswerID};

	}
	@PostMapping("/outOfTime")
	public Object[] outOfTime(Integer questionId, Integer sessionId){
		System.out.println("Player: "+ sessionId);
		System.out.println("Question id: "+questionId);
		Player player = playerRepository.getPlayerBySessionId(sessionId);
		Question question = questionRepository.getQuestionById(questionId);

		player.getPoints().removePoints(question.getValue());
		playerRepository.updatePoints(player);
		return new Object[]{player.getPoints().getPoints(),answerRepository.getCorrectAnswerID(questionId)};
	}
}
