package com.epam.cooking.json;

import com.epam.cooking.jpa.domain.Component;

public class ComponentMapper {
	private String ingredient;
	private Integer amount;

	private ComponentMapper(String ingredient, Integer amount) {
		this.ingredient = ingredient;
		this.amount = amount;
	}

	public ComponentMapper() {
		
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public static ComponentMapper jsonMapper(Component component) {
		return new ComponentMapper(component.getIngredientName(),
				component.getAmount());
	}
}
