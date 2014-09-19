package com.epam.cooking.jpa.dao.implementation;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.epam.cooking.jpa.dao.ComponentDao;
import com.epam.cooking.jpa.domain.Component;

@Repository
public class JpaComponentDao extends GenericJpaDao implements ComponentDao {

	@Override
	public void save(Component component) {
		entityManager.persist(component);
		entityManager.flush();
	}

	@Override
	public void deleteComponentWhereRecipe(long id) {
		String queryString = "DELETE FROM Component c WHERE c.recipe.id = :id";
		Query query = entityManager.createQuery(queryString);
		query.setParameter("id", id);
		query.executeUpdate();
	}

}
