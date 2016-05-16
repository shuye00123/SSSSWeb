package com.SSSSWeb.model.business.service;

import org.springframework.transaction.annotation.Transactional;

import com.SSSSWeb.model.business.dao.CustomerDAO;
import com.SSSSWeb.model.domain.Customer;
import com.SSSSWeb.model.domain.Users;

public class CustomerService {
	private CustomerDAO customerDAO;

	public CustomerDAO getCustomerDAO() {
		return customerDAO;
	}

	public void setCustomerDAO(CustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}
	@Transactional
	public void InsertCustomer(Customer customer) {
		customerDAO.InsertCustomer(customer);
	}

	
	@Transactional
	public Customer checkCustomer(Customer customer) {
		Customer c=customerDAO.checkCustomer(customer);
		return c;
		
	}
	@Transactional
	public void EditCustomer(Customer customer) {
		customerDAO.EditCustomer(customer);
	}

	@Transactional
	public void CustomerChangePsw(Customer c,String passwordnew) {
		customerDAO.CustomerChangePsw(c,passwordnew);
	}

	
	
}
