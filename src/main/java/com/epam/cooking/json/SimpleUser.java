package com.epam.cooking.json;

import java.util.List;

public class SimpleUser {
	private String username;
	private List<SimpleRecipe> recipes;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<SimpleRecipe> getRecipes() {
		return recipes;
	}

	public void setRecipes(List<SimpleRecipe> recipes) {
		this.recipes = recipes;
	}

}
