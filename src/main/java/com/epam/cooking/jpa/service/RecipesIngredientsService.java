package com.epam.cooking.jpa.service;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epam.cooking.jpa.dao.CategoryDao;
import com.epam.cooking.jpa.dao.IngredientDao;
import com.epam.cooking.jpa.dao.RecipeDao;
import com.epam.cooking.jpa.dao.UserDao;
import com.epam.cooking.jpa.domain.Category;
import com.epam.cooking.jpa.domain.Ingredient;
import com.epam.cooking.jpa.domain.Recipe;
import com.epam.cooking.jpa.domain.User;

@Service
public class RecipesIngredientsService {

	@Autowired
	private RecipeDao recipeDao;
	@Autowired
	private IngredientDao ingredientDao;
	@Autowired
	private UserDao user;
	@Autowired
	private CategoryDao categoryDao;

	@Transactional
	public void addNewRecipe(Recipe recipe) {
		recipeDao.addRecipe(recipe);
	}

	public Recipe getRecipe(Long id) {
		return recipeDao.getRecipe(id);
	}

	public List<Recipe> getRecipes() {
		return recipeDao.getRecipes();
	}

	public Recipe createRecipeFromJson(String json) {
		Recipe recipe = new Recipe();
		JSONObject obj = new JSONObject(json);
		recipe.setName(obj.getString("name"));
		recipe.setDescription(obj.getString("desc"));
		recipe.setAuthor(getUserByName(obj.getString("author")));
		recipe.setCategory(categoryDao.getCategoryByName(obj.getString("category")));
		JSONArray array = obj.getJSONArray("ingreds");
		for (int i = 0; i < array.length(); ++i) {
			recipe.addIngredient(
					ingredientDao.getIngredient(array.getJSONObject(i).getLong("id")), 
					array.getJSONObject(i).getInt("quantity"));
		}
		return recipe;
	}

	@Transactional
	public void addNewIngredient(Ingredient ingredient) {
		ingredientDao.addIngredient(ingredient);
	}

	public Ingredient getIngredientById(Long id) {
		return ingredientDao.getIngredient(id);
	}

	public List<Ingredient> getIngredients() {
		return ingredientDao.getIngredients();
	}

	@Transactional
	public void addUser(User user) {
		this.user.addUser(user);
	}
	
	public User getUserByName(String name) {
		return user.findUserByName(name);
	}

	public List<Category> getCategories() {
		return categoryDao.getCategories();
	}

	public List<User> getUsers() {
		return user.getUsers();
	}
}
