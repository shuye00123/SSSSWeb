package com.SSSSWeb.control;

import com.SSSSWeb.model.business.service.OrdersService;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteShopCartAction  extends ActionSupport{
	private OrdersService os;
	private int id;
	
	
	public OrdersService getOs() {
		return os;
	}


	public void setOs(OrdersService os) {
		this.os = os;
	}



	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	@Override
	public String execute() throws Exception {
		os.DeleteShopCart(id);
		return "success";
	}
}
