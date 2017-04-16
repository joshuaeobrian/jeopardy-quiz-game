package com.tiy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by josh on 4/14/17.
 */
@Controller
public class GameController {
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private PlayerRepository playerRepository;

	@RequestMapping("/")
	public String index(){

		return "redirect:/login";
	}

	@RequestMapping("/login")
	public String login(){
		return "login";
	}

	@PostMapping("/checkLogin")
	public String checkLogin(String username, String password){

		System.out.println(username+" "+password);
		return "redirect:/game?playerId="+1;
	}

	@RequestMapping("/game")
	public String game(Model model, Integer playerId){
		model.addAttribute("sessionId", playerRepository.startSession(playerId));
		model.addAttribute("player",playerRepository.getPlayer(playerId));
		model.addAttribute("categories",categoryRepository.getBoardCategories());
		return "game";
	}
}
