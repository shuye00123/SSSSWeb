package com.SSSSWeb.control;

import com.SSSSWeb.model.business.service.OrdersService;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteShopCartAction  extends ActionSupport{
	private OrdersService os;
	private int order_id;
	
	
	public OrdersService getOs() {
		return os;
	}


	public void setOs(OrdersService os) {
		this.os = os;
	}


	public int getOrder_id() {
		return order_id;
	}


	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}


	@Override
	public String execute() throws Exception {
		os.DeleteShopCart(order_id);
		return "success";
	}
}
