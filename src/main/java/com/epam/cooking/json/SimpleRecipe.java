package com.epam.cooking.json;

import java.util.List;

public class SimpleRecipe {
	private String name;
	private List<SimpleComponent> components;
	private long id;
	
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

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
