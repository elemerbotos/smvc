package com.epam.cooking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.persistence.PersistenceException;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epam.cooking.jpa.domain.Authorities;
import com.epam.cooking.jpa.domain.User;
import com.epam.cooking.jpa.service.RecipesIngredientsService;
import com.epam.cooking.json.SimpleUser;
import com.epam.cooking.json.SimpleUsername;

@Controller
public class UserController {

	private static final String ANONYMUS = "Anonymus";

	private static final String ADMIN = "admin";

	@Autowired
	private RecipesIngredientsService recipeService;

	private static final Logger LOGGER = LoggerFactory
			.getLogger(UserController.class);

	private static final Mapper dozerMapper = new DozerBeanMapper();

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
	public String addUser(@ModelAttribute("userForm") User user, Locale locale,
			BindingResult result, Model model) {
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
			model.addAttribute("errorMsg",
					"Already existing username!\\\n Please specify another!");
			return "register";
		} catch (ConstraintViolationException ex) {
			model.addAttribute("error", true);
			model.addAttribute("errorMsg",
					"Password can only contain a-Z, 0-9, _, ?, ");
			return "register";
		}
		return "redirect:/login?successfullRegistration=true";
	}

	@RequestMapping(value = "/userNamesAJAX", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String usersNamesAJAX(Locale locale, Model model)
			throws JsonGenerationException, JsonMappingException, IOException {
		List<User> users = recipeService.getUsers();
		List<SimpleUsername> simpleUsernames = new ArrayList<>();
		for (User user : users) {

			simpleUsernames.add(dozerMapper.map(user, SimpleUsername.class));
		}

		ObjectMapper mapper = new ObjectMapper();
		LOGGER.info(mapper.writeValueAsString(simpleUsernames));
		String result = mapper.writeValueAsString(simpleUsernames);
		LOGGER.info(result);
		return result;
	}
	
	@RequestMapping(value = "/usersAJAX", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String usersAJAX(Locale locale, Model model)
			throws JsonGenerationException, JsonMappingException, IOException {
		List<User> users = recipeService.getUsers();
		List<SimpleUser> simpleUsers = new ArrayList<>();
		for (User user : users) {
			if (!specialUser(user)) {
				simpleUsers.add(dozerMapper.map(user, SimpleUser.class));
			}
		}

		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(simpleUsers);
	}

	private boolean specialUser(User user) {
		boolean result = false;
		String userName = user.getUsername();
		if (userName.equals(ADMIN) || userName.equals(ANONYMUS)) {
			result = true;
		}
		return result;
	}
}
