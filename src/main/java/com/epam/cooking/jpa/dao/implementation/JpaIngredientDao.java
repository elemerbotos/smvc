package com.epam.cooking.jpa.dao.implementation;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.epam.cooking.jpa.dao.IngredientDao;
import com.epam.cooking.jpa.domain.Ingredient;

@Repository
public class JpaIngredientDao extends GenericJpaDao implements IngredientDao {
	
	@SuppressWarnings("unchecked")
	public List<Ingredient> getIngredients() {
		String queryString = "SELECT i FROM Ingredient i";
		Query query = entityManager.createQuery(queryString);

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
