package com.epam.cooking.jpa.dao.implementation;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

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

	@Override
	public List<User> getUsers() {
		String queryString = "SELECT u FROM User u";
		TypedQuery<User> query = entityManager.createQuery(queryString, User.class);
		return query.getResultList();
	}

}
