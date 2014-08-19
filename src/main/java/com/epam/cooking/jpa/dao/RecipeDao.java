package com.epam.cooking.jpa.dao;

import java.util.List;

import com.epam.cooking.jpa.domain.Recipe;

public interface RecipeDao {

	void addRecipe(Recipe recipe);
	
	Recipe getRecipe(Long id);
	
	List<Recipe> getRecipes();

}
