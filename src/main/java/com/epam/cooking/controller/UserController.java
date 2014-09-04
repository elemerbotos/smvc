package com.epam.cooking.controller;

import java.util.Locale;

import javax.persistence.PersistenceException;
import javax.validation.ConstraintViolationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.epam.cooking.jpa.domain.Authorities;
import com.epam.cooking.jpa.domain.User;
import com.epam.cooking.jpa.service.RecipesIngredientsService;

@Controller
public class UserController {
	
	@Autowired
	private RecipesIngredientsService recipeService;
	
	private static final Logger LOGGER = LoggerFactory
			.getLogger(HomeController.class);
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String users(Locale locale, Model model) {

		return "users";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		model.addAttribute("userForm", new User());
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("userForm") User user, Locale locale, BindingResult result,
			Model model) {
		LOGGER.info(user.getUsername() + " registered!");
		Authorities auth = new Authorities();
		auth.setUser(user);
		auth.setAuthority("ROLE_USER");
		user.setAuthority(auth);
		user.setEnabled(true);
		try {
			recipeService.addUser(user);
		} catch (PersistenceException ex) {
			model.addAttribute("error", true);
			model.addAttribute("errorMsg", "Already existing username!\n Please specify another!");
			return "register";
		} catch (ConstraintViolationException ex) {
			model.addAttribute("error", true);
			model.addAttribute("errorMsg", "Password can only contain a-Z, 0-9, _, ?, ");
			return "register";
		}
		return "redirect:/login?successfullRegistration=true";
	}
}
