package com.epam.cooking.jpa.dao;

import java.util.List;

import com.epam.cooking.jpa.domain.Category;

public interface CategoryDao {
	Category getCategoryByName(String name);
	
	List<Category> getCategories();

	Category getCategoryById(Long id);
}
