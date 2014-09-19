package com.epam.cooking.json;

public class SimpleIngredient {
	private Long id;
	private String name;
	private String description;
	private Integer price;
	private String author;

	public Long getId() {
		return id;
	}

	public void setId(final Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(final String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(final Integer price) {
		this.price = price;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(final String author) {
		this.author = author;
	}


}
