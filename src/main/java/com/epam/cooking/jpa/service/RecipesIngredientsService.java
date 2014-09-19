package com.epam.cooking.jpa.service;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.NoResultException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.epam.cooking.jpa.dao.CategoryDao;
import com.epam.cooking.jpa.dao.ComponentDao;
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
	private UserDao userDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ComponentDao componentDao;

	@Resource
	protected PlatformTransactionManager txManager;

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

	public Recipe createRecipeFromJson(String json) throws JSONException {
		Recipe recipe = new Recipe();
		JSONObject obj = new JSONObject(json);
		recipe.setName(obj.getString("name"));
		recipe.setDescription(obj.getString("desc"));
		recipe.setAuthor(getUserByName(obj.getString("author")));
		recipe.setCategory(categoryDao.getCategoryById(obj.getLong("category")));
		JSONArray array = obj.getJSONArray("ingreds");
		for (int i = 0; i < array.length(); ++i) {
			recipe.addIngredient(
					ingredientDao.getIngredient(array.getJSONObject(i).getLong(
							"id")), array.getJSONObject(i).getInt("quantity"));
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
		this.userDao.addUser(user);
	}

	public User getUserByName(String name) {
		return userDao.findUserByName(name);
	}

	public List<Category> getCategories() {
		return categoryDao.getCategories();
	}

	public List<User> getUsers() {
		return userDao.getUsers();
	}

	@Transactional
	public void addCategory(Category category) {
		categoryDao.save(category);
	}

	public boolean hasCategory(Category category) {
		boolean result = true;
		try {
			categoryDao.getCategoryByName(category.getName());
		} catch (NoResultException e) {
			result = false;
		}
		return result;
	}

	@Transactional
	public void removeRecipe(long id) {
		TransactionStatus status = txManager
				.getTransaction(new DefaultTransactionDefinition());
		recipeDao.deleteRecipeBy(id);
		txManager.commit(status);
	}

	@Transactional
	public void removeIngredients(long id) {
		TransactionStatus status = txManager
				.getTransaction(new DefaultTransactionDefinition());
		componentDao.deleteComponentWhereRecipe(id);
		txManager.commit(status);
	}

	public void deleteRecipe(long id) {
		removeIngredients(id);
		removeRecipe(id);
	}
}
