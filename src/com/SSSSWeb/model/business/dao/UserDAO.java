package com.SSSSWeb.model.business.dao;

import org.hibernate.SessionFactory;

public class UserDAO {
	private SessionFactory sf;
	
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
}
