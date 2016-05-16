package com.SSSSWeb.model.business.service;

import com.SSSSWeb.model.business.dao.StockDAO;

public class StockService {
	private StockDAO stockDAO;

	public StockDAO getStockDAO() {
		return stockDAO;
	}

	public void setStockDAO(StockDAO stockDAO) {
		this.stockDAO = stockDAO;
	}
}
