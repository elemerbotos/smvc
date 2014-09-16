package com.epam.cooking.jpa.dao.implementation;


import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;

@Repository
public abstract class GenericJpaDao {

	@PersistenceContext
	protected EntityManager entityManager;

}
