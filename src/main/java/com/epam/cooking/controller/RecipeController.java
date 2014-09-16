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

	private static final int UNIT_PER_PRICE = 100;

	private static final Logger LOGGER = LoggerFactory
			.getLogger(RecipeController.class);

	private static final Mapper dozerMapper = new DozerBeanMapper();

	@Autowired
	private RecipesIngredientsService recipeService;

	@RequestMapping(value = "/recipe/removeRecipe", method = RequestMethod.GET)
	public String removeRecipe(@RequestParam("id") long id, Locale locale, Model model) {
//		recipeService.deleteRecipe(id);
		recipeService.removeIngredients(id);
		LOGGER.info("Components of recipe id:" + id + " removed");
		recipeService.removeRecipe(id);
		LOGGER.info("Recipe with id:" + id + " removed");
		return "redirect:/recipes";
		
	}
	
	@RequestMapping(value = "/addRecipe", method = RequestMethod.GET)
	public String addRecipe(@RequestParam(defaultValue = "false") boolean categoryAdded, Locale locale, Model model) {
		model.addAttribute("categories", recipeService.getCategories());
		model.addAttribute("ingredients", recipeService.getIngredients());
		model.addAttribute("categoryAdded", categoryAdded);
		return "addRecipe";
	}

	@RequestMapping(value = "/addNewRecipe", method = RequestMethod.POST)
	@ResponseBody
	public String addNewRecipe(@RequestParam("recipe") String recipeJson,
			Model model) {
		Recipe recipe = recipeService.createRecipeFromJson(recipeJson);
		try {
			recipeService.addNewRecipe(recipe);
		} catch (ConstraintViolationException ex) {
			model.addAttribute("errorMsg", "Please don't user < > characters!");
			model.addAttribute("error", true);
			return "addRecipe";
		}

		LOGGER.info("Recipe added");
		return "done";
	}

	@RequestMapping(value = "/recipes", method = RequestMethod.GET)
	public String recipes(Locale locale, Model model) {
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
			totalPrice += (component.getAmount()
					* component.getIngredientPrice()) / UNIT_PER_PRICE;
		}

		model.addAttribute("recipe", recipe);
		model.addAttribute("totalPrice", totalPrice);

		return "recipe";
	}
}
