package com.epam.cooking.jpa.dao;

import com.epam.cooking.jpa.domain.User;

public interface UserDao {
	
	void addUser(User user);

	User findUserByName(String name);
}
