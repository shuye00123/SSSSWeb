package com.SSSSWeb.control;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.OrdersService;
import com.SSSSWeb.model.domain.Customer;
import com.opensymphony.xwork2.ActionSupport;

public class SelectShopCartAction extends ActionSupport implements SessionAware{
	private OrdersService os;
	private Map<String, Object> session;
	private List list; 
	
	

	public void setOs(OrdersService os) {
		this.os = os;
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

	@Override
	public String execute() throws Exception {
		HttpServletResponse hsr = ServletActionContext.getResponse();
		Customer c=(Customer)session.get("customer");
		list = os.SelectShopCart(c);
		hsr.setCharacterEncoding("UTF-8");
        hsr.getWriter().write("");
		return "success";
	}
}
