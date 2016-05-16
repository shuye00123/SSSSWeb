package com.SSSSWeb.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.CustomerService;
import com.SSSSWeb.model.domain.Customer;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements SessionAware, ModelDriven<Customer> {
	private CustomerService cs;
	private Map<String,Object> session;
	private Customer customer = new Customer();
	
	
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
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	@Override
	public String execute() throws Exception {
		Customer c = cs.checkCustomer(customer);
	     if (c !=null) {
	         session.put("customer",c);
	         return "success";
	     }
	     else{
	    	 return "error"; 
	     }  
	        
	    }
	    public Customer getModel() {
	        return customer;
	    }
}
