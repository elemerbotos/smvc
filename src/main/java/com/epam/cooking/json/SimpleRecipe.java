package com.epam.cooking.json;

import java.util.List;

public class SimpleRecipe {
	private String name;
	private List<SimpleComponent> components;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<SimpleComponent> getComponents() {
		return components;
	}

	public void setComponents(List<SimpleComponent> components) {
		this.components = components;
	}

}
