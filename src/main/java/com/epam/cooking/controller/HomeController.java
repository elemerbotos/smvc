package com.epam.cooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epam.cooking.jpa.domain.Component;
import com.epam.cooking.jpa.domain.Ingredient;
import com.epam.cooking.jpa.domain.Recipe;
import com.epam.cooking.jpa.domain.User;
import com.epam.cooking.jpa.service.RecipesIngredientsService;
import com.epam.cooking.json.SimpleComponent;
import com.epam.cooking.json.SimpleUser;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final int NUMBER_OF_RECIPES_TO_DISPLAY = 4;

	private static final Logger LOGGER = LoggerFactory
			.getLogger(HomeController.class);
	
	private static final Mapper dozerMapper = new DozerBeanMapper();

	@Autowired
	private RecipesIngredientsService recipeService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping(value = "/addRecipe", method = RequestMethod.GET)
	public String addRecipe(Locale locale, Model model) {
		model.addAttribute("categories", recipeService.getCategories());
		model.addAttribute("ingredients", recipeService.getIngredients());
		return "addRecipe";
	}

	@RequestMapping(value = "/addNewRecipe", method = RequestMethod.POST)
	@ResponseBody
	public String addNewRecipe(@RequestParam("recipe") String recipeJson) { // @RequestParam("recipe")
		Recipe recipe = recipeService.createRecipeFromJson(recipeJson);
		recipeService.addNewRecipe(recipe);
		LOGGER.info("Recipe added");
		return "done";
	}

	@RequestMapping(value = "/recipes", method = RequestMethod.GET)
	public String recipes(Locale locale, Model model) {
		List<Recipe> recipes = recipeService.getRecipes();
		int numOfRecipes = recipes.size();
		if (numOfRecipes > NUMBER_OF_RECIPES_TO_DISPLAY) {
			model.addAttribute(
					"latestRecipes",
					recipes.subList(numOfRecipes - NUMBER_OF_RECIPES_TO_DISPLAY
							- 1, numOfRecipes - 1));
		} else {
			model.addAttribute( "latestRecipes", recipes);
		}
		return "recipes";
	}

	@RequestMapping(value = "/ingredients", method = RequestMethod.GET)
	public String ingredients(Locale locale, Model model) {
		List<Ingredient> ingredients = recipeService.getIngredients();

		model.addAttribute( "ingredients", ingredients);
		return "ingredients";
	}
	
	@RequestMapping(value = "/ingredientsAJAX", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String ingredientsAJAX(Locale locale, Model model) throws JsonGenerationException, JsonMappingException, IOException {
		List<Ingredient> ingredients = recipeService.getIngredients();
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(ingredients);
	}
	
	@RequestMapping(value = "/addIngredient", method = RequestMethod.GET)
	public String addIngredient(Locale locale, Model model) {

		model.addAttribute( "ingredientForm", new Ingredient());
		return "addIngredient";
	}
	
	@RequestMapping(value = "/addIngredient", method = RequestMethod.POST)
	public String postIngredient(@ModelAttribute("ingredientForm") Ingredient ingredient , Model model) {
		ingredient.setAuthor(SecurityContextHolder.getContext().getAuthentication().getName());
		recipeService.addNewIngredient(ingredient);
		return "ingredients";
	}
	
	@RequestMapping(value = "/usersAJAX", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String usersAJAX(Locale locale, Model model) throws JsonGenerationException, JsonMappingException, IOException {
		List<User> users = recipeService.getUsers();
		List<SimpleUser> simpleUsers = new ArrayList<>();
		for(User user : users) {
			simpleUsers.add(dozerMapper.map(user, SimpleUser.class));
		}
		
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(simpleUsers);
	}
}
