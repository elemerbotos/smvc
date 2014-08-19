package com.epam.cooking.json;

import java.util.ArrayList;
import java.util.List;

import com.epam.cooking.jpa.domain.Component;
import com.epam.cooking.jpa.domain.Recipe;

public class RecipeMapper {
	private String name;
	private List<ComponentMapper> components;

	private RecipeMapper(String name, List<ComponentMapper> components) {
		this.components = components;
		this.name = name;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<ComponentMapper> getComponents() {
		return components;
	}

	public void setComponents(List<ComponentMapper> components) {
		this.components = components;
	}
	
	public static RecipeMapper jsonMapper(Recipe recipe) {
		List<ComponentMapper> components = new ArrayList<>();
		
		for(Component component : recipe.getComponents()) {
			components.add(ComponentMapper.jsonMapper(component));
		}
		
		return new RecipeMapper(recipe.getName(), components);
	}

}
