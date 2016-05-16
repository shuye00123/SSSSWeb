package com.SSSSWeb.model.business.dao;

import org.hibernate.SessionFactory;

public class ImageDAO {
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
}
