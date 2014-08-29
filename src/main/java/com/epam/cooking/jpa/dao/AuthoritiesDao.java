package com.epam.cooking.jpa.dao;

import java.util.List;

import com.epam.cooking.jpa.domain.Authorities;

public interface AuthoritiesDao {
	List<Authorities> getAuthorities();
}
