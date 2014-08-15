package com.epam.cooking.jpa.dao.implementation;

import org.springframework.stereotype.Repository;

import com.epam.cooking.jpa.dao.ComponentDao;
import com.epam.cooking.jpa.domain.Component;

@Repository
public class JpaComponentDao extends GenericJpaDao implements ComponentDao {

	@Override
	public void save(Component component) {
		entityManager.persist(component);
		entityManager.flush();
	}

}
