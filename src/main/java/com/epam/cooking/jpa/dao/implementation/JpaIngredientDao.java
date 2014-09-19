package com.epam.cooking.jpa.dao.implementation;

import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.epam.cooking.jpa.dao.IngredientDao;
import com.epam.cooking.jpa.domain.Ingredient;

@Repository
public class JpaIngredientDao extends GenericJpaDao implements IngredientDao {
	
	public List<Ingredient> getIngredients() {
		String queryString = "SELECT i FROM Ingredient i";
		TypedQuery<Ingredient> query = entityManager.createQuery(queryString, Ingredient.class);

		return query.getResultList();
	}

	@Override
	public void addIngredient(Ingredient ingredient) {
		entityManager.persist(ingredient);
	}

	@Override
	public Ingredient getIngredient(Long id) {
		return entityManager.find(Ingredient.class, id);
	}
}
