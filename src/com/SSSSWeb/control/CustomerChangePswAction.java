package com.SSSSWeb.control;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.CustomerService;
import com.SSSSWeb.model.domain.Customer;
import com.SSSSWeb.model.domain.Users;
import com.opensymphony.xwork2.ActionSupport;

public class CustomerChangePswAction extends ActionSupport implements SessionAware{
	private CustomerService cs;
	private String passwordold;
	private String passwordnew;
	private Map<String, Object> session;
	
	public CustomerService getCs() {
		return cs;
	}


	public void setCs(CustomerService cs) {
		this.cs = cs;
	}


	public String getPasswordold() {
		return passwordold;
	}


	public void setPasswordold(String passwordold) {
		this.passwordold = passwordold;
	}


	public String getPasswordnew() {
		return passwordnew;
	}


	public void setPasswordnew(String passwordnew) {
		this.passwordnew = passwordnew;
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
		 if(c.getCustomer_password().equals(passwordold)){
			 cs.CustomerChangePsw(c,passwordnew);
			 return "success";
		 }else{
			 return "error";
			 
		 }
			 
		
	}
}