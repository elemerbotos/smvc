package com.epam.cooking.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.epam.cooking.jpa.domain.Recipe;
import com.epam.cooking.jpa.service.RecipesIngredientsService;

@Controller
public class HomeController {
	
	private static final int NUMBER_OF_RECIPES_TO_DISPLAY = 4;

	@Autowired
	private RecipesIngredientsService recipeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<Recipe> recipes = recipeService.getRecipes();
		int numOfRecipes = recipes.size();
		if (numOfRecipes > NUMBER_OF_RECIPES_TO_DISPLAY) {
			model.addAttribute("latestRecipes", recipes.subList(numOfRecipes
					- NUMBER_OF_RECIPES_TO_DISPLAY, numOfRecipes));
		} else {
			model.addAttribute("latestRecipes", recipes);
		}
		return "home";
	}
	
}
