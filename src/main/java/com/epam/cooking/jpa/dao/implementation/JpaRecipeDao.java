package com.epam.cooking.jpa.dao.implementation;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.epam.cooking.jpa.dao.RecipeDao;
import com.epam.cooking.jpa.domain.Recipe;

@Repository
public class JpaRecipeDao extends GenericJpaDao implements RecipeDao {
	
	@Override
	public void addRecipe(Recipe recipe) {
		entityManager.persist(recipe);
		entityManager.flush();
	}

	@Override
	public Recipe getRecipe(Long id) {
		return entityManager.find(Recipe.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Recipe> getRecipes() {
		String queryString = "SELECT r FROM Recipe r";
		Query query = entityManager.createQuery(queryString);

		return query.getResultList();
	}
	
	@Override
	public void deleteRecipeBy(long id) {
		String queryString = "DELETE FROM Recipe r WHERE r.id = :id";
		Query query = entityManager.createQuery(queryString);
		query.setParameter("id", id);
		query.executeUpdate();
	}

}
