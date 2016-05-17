package com.SSSSWeb.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.CustomerService;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction  extends ActionSupport implements SessionAware{
	private CustomerService cs;
	private Map<String,Object> session;
	
	
	public CustomerService getCs() {
		return cs;
	}


	public void setCs(CustomerService cs) {
		this.cs = cs;
	}


	public Map<String, Object> getSession() {
		return session;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	@Override
	public String execute() throws Exception {
		 HttpServletRequest request = ServletActionContext.getRequest();
	     HttpSession session = request.getSession();
	     session.invalidate();
		return "success";
	}
	
	
	
}
