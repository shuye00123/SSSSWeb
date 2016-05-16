package com.SSSSWeb.control;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.SSSSWeb.model.business.service.CustomerService;
import com.opensymphony.xwork2.ActionSupport;

public class SelectCustomerAction extends ActionSupport{
	private CustomerService cs;
	private List list;
	
	


	public List getList() {
		return list;
	}


	public void setList(List list) {
		this.list = list;
	}


	public CustomerService getCs() {
		return cs;
	}


	public void setCs(CustomerService cs) {
		this.cs = cs;
	}


	@Override
	public String execute() throws Exception {
		HttpServletResponse hsr = ServletActionContext.getResponse();
		hsr.setCharacterEncoding("UTF-8");
        hsr.getWriter().write("");
		return "success";
	}
}