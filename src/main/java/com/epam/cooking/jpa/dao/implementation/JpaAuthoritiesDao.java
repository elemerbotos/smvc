package com.epam.cooking.jpa.dao.implementation;

import java.util.List;

import javax.transaction.NotSupportedException;

import com.epam.cooking.jpa.dao.AuthoritiesDao;
import com.epam.cooking.jpa.domain.Authorities;

public class JpaAuthoritiesDao extends GenericJpaDao implements AuthoritiesDao {

	@Override
	public List<Authorities> getAuthorities() {
		return null;
	}

}
