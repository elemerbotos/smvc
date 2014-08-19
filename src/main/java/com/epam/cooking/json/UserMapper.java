package com.epam.cooking.json;

import java.util.ArrayList;
import java.util.List;

import com.epam.cooking.jpa.domain.Recipe;
import com.epam.cooking.jpa.domain.User;

public class UserMapper {
	private String username;
	private List<RecipeMapper> recipes;

	private UserMapper(String username, List<RecipeMapper> recipes) {
		this.username = username;
		this.recipes = recipes;
	}
	
	public UserMapper() {
		
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<RecipeMapper> getRecipes() {
		return recipes;
	}

	public void setRecipes(List<RecipeMapper> recipes) {
		this.recipes = recipes;
	}

	public static UserMapper jsonMapper(User user) {
		List<RecipeMapper> recipes = new ArrayList<>();
		
		for(Recipe recipe : user.getRecipes()) {
			recipes.add(RecipeMapper.jsonMapper(recipe));
		}
		
		return new UserMapper(user.getUsername(), recipes);
	}
}
