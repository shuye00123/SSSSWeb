package com.SSSSWeb.model.business.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.SSSSWeb.model.business.dao.CustomerDAO;
import com.SSSSWeb.model.domain.Customer;
import com.SSSSWeb.model.domain.Orders_Count;
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

	@Transactional
	public List<Customer> SelectCustomer() {
		ArrayList list=customerDAO.SelectCustomer();
		ArrayList reslist = new ArrayList();
 		for(int i=0;i<list.size();i++){
 			Object[] obj = (Object[]) list.get(i);
 			Customer to = new Customer();
			to.setCustomer_id(Integer.valueOf(obj[0].toString()));
 			to.setCustomer_no(obj[1].toString());
 			to.setCustomer_password(obj[2].toString());
 			to.setCustomer_name(obj[3].toString());
 			to.setSex(obj[4].toString());
  			to.setJob(obj[5].toString());
 			to.setTel(obj[6].toString());
 			to.setAddr(obj[7].toString());
 			to.setIdcard(obj[8].toString());
  			to.setRemark(obj[9].toString());
 			reslist.add(to);
			
		}
		return reslist;	
	}

	
	
}
