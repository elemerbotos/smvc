package com.epam.cooking.jpa.dao.implementation;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.epam.cooking.jpa.dao.CategoryDao;
import com.epam.cooking.jpa.domain.Category;

@Repository
public class JpaCategoryDao extends GenericJpaDao implements CategoryDao {

	@Override
	public Category getCategoryByName(String name) {
		String queryString = "SELECT c FROM Category c where c.name like :name";
		Query query = entityManager.createQuery(queryString);
		query.setParameter("name", name);

		return (Category) query.getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getCategories() {
		String queryString = "SELECT c FROM Category c";
		Query query = entityManager.createQuery(queryString);

		return query.getResultList();
	}

}
