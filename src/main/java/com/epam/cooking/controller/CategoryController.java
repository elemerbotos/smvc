package com.epam.cooking.controller;

import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.epam.cooking.jpa.domain.Category;
import com.epam.cooking.jpa.service.RecipesIngredientsService;

@Controller
public class CategoryController {
	@Autowired
	private RecipesIngredientsService recipeService;

	private static final Logger LOGGER = LoggerFactory
			.getLogger(CategoryController.class);
	
	@RequestMapping(value = "/addCategory", method = RequestMethod.GET)
	public String addCategory(Locale locale, Model model) {
		model.addAttribute("categoryForm", new Category());

		return "addCategory";
	}
	
	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public String addNewCategory(@ModelAttribute("categoryForm") @Valid Category category, Locale locale, Model model) {
		String result = "redirect:/addRecipe?categoryAdded=true";
		if(recipeService.hasCategory(category)) {
			model.addAttribute("error", true);
			result = "addCategory";
		} else {
			recipeService.addCategory(category);
		}

		return result;
	}

}