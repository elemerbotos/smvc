package com.epam.cooking.jpa.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="recipe")
public class Recipe {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String name;
	private String description;
	
	@ManyToOne
    @JoinColumn(name="author_id")
	private User author;
	
	@OneToMany(cascade=CascadeType.PERSIST, mappedBy="recipe", fetch=FetchType.EAGER)
	private List<Component> components = new ArrayList<Component>();
	
	@ManyToOne
	@JoinColumn(name="CATEGORY_ID")
	private Category category;
	
	private Date creation;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}
	
	public List<Component> getComponents() {
		return components;
	}
	
	public void addIngredient(Ingredient ingredient, Integer amount) {
		Component component = new Component();
		component.setAmount(amount);
		component.setIngredient(ingredient);
		component.setRecipe(this);
		this.components.add(component);
	}

	public Date getCreation() {
		return creation;
	}

	public void setCreation(Date creation) {
		this.creation = creation;
	}

	public void setComponents(List<Component> components) {
		this.components = components;
	}

	public void setCategory(Category category) {
		this.category = category; 
		
	}
	
	public Category getCategory() {
		return category;
	}
	
	@Override
	public String toString() {
		return "Recipe [id=" + id + ", name=" + name + ", description="
				+ description + ", author=" + author.getUsername() +  ", category=" + category + ", components=" + components + "]";
	}
}
