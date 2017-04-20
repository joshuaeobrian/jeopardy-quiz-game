package com.tiy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * Created by josh on 4/14/17.
 */
@Controller
@SessionAttributes({"id","name"})

public class GameController {
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private PlayerRepository playerRepository;

	@ModelAttribute("id")
	public Integer getId(){
		return 0;
	}

	@RequestMapping("/")
	public String index(){

		return "redirect:/login";
	}

	@RequestMapping("/login")
	public String login(){
		return "login";
	}

	@PostMapping("/checkLogin")
	public String checkLogin(ModelMap modelMap, String username, String password){
		Player player  = playerRepository.getPlayerByUsernameAndPassword(username,password);
		//get player id
		if(player != null) {
			modelMap.put("id", player.getId());
			modelMap.put("name",player.getUsername());
			return "redirect:/game";
		}else{
			return"redirect:/login";
		}
	}
	@RequestMapping("/signup")
	public String signUp(){
		return "sign_up";
	}

	@PostMapping("/addAccount")
	public String addNewAccount(ModelMap modelMap, Player player){
		Integer id = playerRepository.createNewPlayer(player);
		modelMap.put("id",id);
		return "redirect:/game";
	}

	@RequestMapping("/game")
	public String game(Model model, @ModelAttribute("id") Integer id){
		model.addAttribute("sessionId", playerRepository.startSession(id));
		model.addAttribute("player",playerRepository.getPlayer(id));
		model.addAttribute("categories",categoryRepository.getBoardCategories());
		return "game";
	}
}
