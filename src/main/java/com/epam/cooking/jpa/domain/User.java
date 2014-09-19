package com.epam.cooking.jpa.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "users")
public class User {

	@Id
	@Pattern(regexp = "[^<>?]+", message = "No bad characters, please!")
	private String username;

	@Pattern(regexp = "[\\w.?,]+", message = "Wrong password")
	private String password;
	private boolean enabled;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.PERSIST)
	private Set<Authorities> authorities = new HashSet<>();

	@OneToMany(mappedBy = "author", fetch = FetchType.EAGER)
	private Set<Recipe> recipes = new HashSet<Recipe>();

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Set<Recipe> getRecipes() {
		return recipes;
	}

	public void setRecipes(Set<Recipe> recipes) {
		this.recipes = recipes;
	}

	@Override
	public String toString() {
		return "User [username=" + username + "]";
	}

	public void setAuthority(Authorities authority) {
		this.authorities.add(authority);

	}

	public Set<Authorities> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Set<Authorities> authorities) {
		this.authorities = authorities;
	}

}
