package com.SSSSWeb.control;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.OrdersService;
import com.SSSSWeb.model.domain.Customer;
import com.opensymphony.xwork2.ActionSupport;

public class SelectOrdersAction  extends ActionSupport implements SessionAware{
	private OrdersService os;
	private Map<String, Object> session;
	private List list;
	private List list1;

	public OrdersService getOs() {
		return os;
	}

	public void setOs(OrdersService os) {
		this.os = os;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public List getList1() {
		return list1;
	}

	public void setList1(List list1) {
		this.list1 = list1;
	}

	@Override
	public String execute() throws Exception {
		Customer c=(Customer)session.get("customer");
		list = os.SelectCount(c);
		list1 = os.SelectOrders(c);
		return "success";
	}
}
