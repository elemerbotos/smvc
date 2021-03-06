package com.epam.cooking.jpa.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Ingredient {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotEmpty(message = "Ingredient name cannot be empty! ")
	@Pattern(regexp = "[^<>?]+", message = "No bad characters, please!")
	private String name;
	@Pattern(regexp = "[^<>?]+", message = "No bad characters, please!")
	private String description;

	@Column(name = "UNIT_PRICE")
	private Integer price;

	private String author;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
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

	@Override
	public String toString() {
		return "Ingredient [id=" + id + ", name=" + name + ", description="
				+ ", price=" + price + ", author=" + author + "]";
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

}
