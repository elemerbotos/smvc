package com.epam.cooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epam.cooking.jpa.domain.Ingredient;
import com.epam.cooking.jpa.domain.User;
import com.epam.cooking.jpa.service.RecipesIngredientsService;
import com.epam.cooking.json.SimpleUser;

@Controller
public class IngredientController {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(IngredientController.class);

	private static final Mapper dozerMapper = new DozerBeanMapper();

	@Autowired
	private RecipesIngredientsService recipeService;

	@RequestMapping(value = "/ingredients", method = RequestMethod.GET)
	public String ingredients(Locale locale, Model model) {
		List<Ingredient> ingredients = recipeService.getIngredients();

		model.addAttribute("ingredients", ingredients);
		return "ingredients";
	}

	@RequestMapping(value = "/ingredientsAJAX", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String ingredientsAJAX(Locale locale, Model model)
			throws JsonGenerationException, JsonMappingException, IOException {
		List<Ingredient> ingredients = recipeService.getIngredients();
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(ingredients);
	}

	@RequestMapping(value = "/addIngredient", method = RequestMethod.GET)
	public String addIngredient(Locale locale, Model model) {

		model.addAttribute("ingredientForm", new Ingredient());

		return "addIngredient";
	}

	@RequestMapping(value = "/addIngredient", method = RequestMethod.POST)
	public String postIngredient(
			@ModelAttribute("ingredientForm") @Valid Ingredient ingredient,
			BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("status", bindingResult);

			return "addIngredient";
		}
		ingredient.setAuthor(SecurityContextHolder.getContext()
				.getAuthentication().getName());
		recipeService.addNewIngredient(ingredient);
		LOGGER.info(ingredient.getName());
		return "ingredients";
	}

}
