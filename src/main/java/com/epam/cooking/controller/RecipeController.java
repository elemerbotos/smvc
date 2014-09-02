package com.epam.cooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.validation.ConstraintViolationException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epam.cooking.jpa.domain.Component;
import com.epam.cooking.jpa.domain.Recipe;
import com.epam.cooking.jpa.service.RecipesIngredientsService;
import com.epam.cooking.json.SimpleRecipe;

@Controller
public class RecipeController {
	
	private static final int NUMBER_OF_RECIPES_TO_DISPLAY = 4;

	private static final Logger LOGGER = LoggerFactory
			.getLogger(HomeController.class);
	
	private static final Mapper dozerMapper = new DozerBeanMapper();
		
	@Autowired
	private RecipesIngredientsService recipeService;
	
	@RequestMapping(value = "/addRecipe", method = RequestMethod.GET)
	public String addRecipe(Locale locale, Model model) {
		model.addAttribute("categories", recipeService.getCategories());
		model.addAttribute("ingredients", recipeService.getIngredients());
		return "addRecipe";
	}

	@RequestMapping(value = "/addNewRecipe", method = RequestMethod.POST)
	@ResponseBody
	public String addNewRecipe(@RequestParam("recipe") String recipeJson, Model model) {
		Recipe recipe = recipeService.createRecipeFromJson(recipeJson);
		try {
			recipeService.addNewRecipe(recipe);
		} catch(ConstraintViolationException ex) {
			model.addAttribute("errorMsg", "Please don't user < > characters!");
			model.addAttribute("error", true);
			return "addRecipe";	
		}
		
		LOGGER.info("Recipe added");
		return "done";			
	}

	@RequestMapping(value = "/recipes", method = RequestMethod.GET)
	public String recipes(Locale locale, Model model) {
		List<Recipe> recipes = recipeService.getRecipes();
		int numOfRecipes = recipes.size();
		if (numOfRecipes > NUMBER_OF_RECIPES_TO_DISPLAY) {
			model.addAttribute("latestRecipes", recipes.subList(numOfRecipes
					- NUMBER_OF_RECIPES_TO_DISPLAY, numOfRecipes));
		} else {
			model.addAttribute("latestRecipes", recipes);
		}
		return "recipes";
	}
	
	@RequestMapping(value = "/recipesAJAX", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String recipesAJAX(Locale locale, Model model)
			throws JsonGenerationException, JsonMappingException, IOException {
		List<Recipe> recipes = recipeService.getRecipes();
		List<SimpleRecipe> simpleRecipes = new ArrayList<>();
		for (Recipe recipe : recipes) {
			simpleRecipes.add(dozerMapper.map(recipe, SimpleRecipe.class));
		}

		ObjectMapper mapper = new ObjectMapper();
		LOGGER.info(mapper.writeValueAsString(simpleRecipes));
		return mapper.writeValueAsString(simpleRecipes);
	}
	
	@RequestMapping(value = "/recipe/{id}", method = RequestMethod.GET)
	public String users(@PathVariable Long id, Model model) {
		Recipe recipe = recipeService.getRecipe(id);
		int totalPrice = 0;
		for (Component component : recipe.getComponents()) {
			totalPrice += component.getAmount()
					* component.getIngredientPrice();
		}

		model.addAttribute("recipe", recipe);
		model.addAttribute("totalPrice", totalPrice);

		return "recipe";
	}
}
