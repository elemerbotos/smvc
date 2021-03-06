package com.epam.cooking.jpa.dao.implementation;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

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

	@Override
	public List<Category> getCategories() {
		String queryString = "SELECT c FROM Category c";
		TypedQuery<Category> query = entityManager.createQuery(queryString, Category.class);

		return query.getResultList();
	}

	@Override
	public Category getCategoryById(Long id) {
		String queryString = "SELECT c FROM Category c where c.id = :id";
		Query query = entityManager.createQuery(queryString);
		query.setParameter("id", id);

		return (Category) query.getSingleResult();
	}

	@Override
	public void save(Category category) {
		entityManager.persist(category);
	}

}
