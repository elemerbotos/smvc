package com.epam.cooking.jpa.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.activemq.filter.function.makeListFunction;

@Entity
@Table(name = "INGREDIENT_RECIPE")
public class Component {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@JoinColumn(name="INGREDIENT_ID")
	@ManyToOne
	private Ingredient ingredient;
	
	@JoinColumn(name="RECIPE_ID")
	@ManyToOne
	private Recipe recipe;
	
	private int amount;

	public Ingredient getIngredient() {
		return ingredient;
	}

	public void setIngredient(Ingredient ingredients) {
		this.ingredient = ingredients;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Component [ingredient=" + ingredient.getName() + ", recipe=" + recipe.getName()
				+ ", amount=" + amount + "]";
	}

	public String getIngredientName() {
		return this.ingredient.getName();
	}

}
