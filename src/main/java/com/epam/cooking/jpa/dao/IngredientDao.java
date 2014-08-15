package com.epam.cooking.jpa.dao;

import java.util.List;

import com.epam.cooking.jpa.domain.Ingredient;

public interface IngredientDao {
	
	void addIngredient(Ingredient ingredient);
	
	Ingredient getIngredient(int id);
	
	List<Ingredient> getIngredients();
}
