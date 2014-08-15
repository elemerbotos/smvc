package com.epam.cooking.jpa.dao.implementation;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.epam.cooking.jpa.dao.UserDao;
import com.epam.cooking.jpa.domain.User;

@Repository
public class JpaUserDao extends GenericJpaDao implements UserDao {

	@Override
	public User findUserByName(String name) {
		String queryString = "SELECT u FROM User u where username like :name";
		Query query = entityManager.createQuery(queryString);
		query.setParameter("name", name);

		return (User) query.getSingleResult();
	}

	@Override
	public void addUser(User user) {
		entityManager.persist(user);
		entityManager.flush();
	}

}
