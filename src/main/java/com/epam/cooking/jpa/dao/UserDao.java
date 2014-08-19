package com.epam.cooking.jpa.dao;

import java.util.List;

import com.epam.cooking.jpa.domain.User;

public interface UserDao {
	
	void addUser(User user);

	User findUserByName(String name);

	List<User> getUsers();
}
