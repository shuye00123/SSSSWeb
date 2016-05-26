package com.SSSSWeb.control;

import com.SSSSWeb.model.business.service.CustomerService;
import com.SSSSWeb.model.domain.Customer;
import com.SSSSWeb.model.domain.Supplier;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class InsertCustomerAction extends ActionSupport implements ModelDriven<Customer>{
	private CustomerService cs;
	private Customer customer = new Customer();
	
	public CustomerService getCs() {
		return cs;
	}

	public void setCs(CustomerService cs) {
		this.cs = cs;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Override
	public String execute() throws Exception {
		if(customer.getCustomer_no()!=null){
			Boolean b = cs.InsertCustomer(customer);
			if(!b){
				addActionMessage("注册失败用户名已存在！！");
				return "error";
			}
		}
		
		return "success";
	}
	
	public Customer getModel() {
		return customer;
	}
	
}
