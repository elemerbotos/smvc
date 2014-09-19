package com.epam.cooking.jpa.dao;

import com.epam.cooking.jpa.domain.Component;

public interface ComponentDao {

	void save(Component component);

	void deleteComponentWhereRecipe(long id);
}
