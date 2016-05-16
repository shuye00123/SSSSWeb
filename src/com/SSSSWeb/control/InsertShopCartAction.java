package com.SSSSWeb.control;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.OrdersService;
import com.SSSSWeb.model.business.service.SupplierService;
import com.SSSSWeb.model.domain.Customer;
import com.SSSSWeb.model.domain.Supplier;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class InsertShopCartAction extends ActionSupport implements SessionAware{
	private OrdersService os;
	private int id;
	private int num;
	private Map<String, Object> session;
	

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



	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
	}



	public Map<String, Object> getSession() {
		return session;
	}



	public void setSession(Map<String, Object> session) {
		this.session = session;
	}



	@Override
	public String execute() throws Exception {
		Customer c=(Customer)session.get("customer");
		os.InsertShopCart(c,id,num);
		return "success";
	}
}
