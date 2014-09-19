package com.epam.cooking.jpa.dao.implementation;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public abstract class GenericJpaDao {

	@PersistenceContext
	protected EntityManager entityManager;

}
