package com.SSSSWeb.model.business.dao;

import org.hibernate.SessionFactory;

public class StockDAO {
	private SessionFactory sf;

	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
}
