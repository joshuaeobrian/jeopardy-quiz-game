package com.tiy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by josh on 4/14/17.
 */
@Controller
public class GameController {
	@Autowired
	private CategoryRepository categoryRepository;

	@RequestMapping("/")
	public String game(Model model){
		model.addAttribute("categories",categoryRepository.getBoardCategories());
		return "game";
	}
}
