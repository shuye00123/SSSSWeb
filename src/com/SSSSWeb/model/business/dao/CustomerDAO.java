package com.SSSSWeb.model.business.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.SSSSWeb.model.domain.Customer;
import com.SSSSWeb.model.domain.Supplier;
import com.SSSSWeb.model.domain.Users;

public class CustomerDAO {
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	public void InsertCustomer(Customer customer) {
		Session session = sf.openSession();
		session.save(customer);
		session.close();
	}

	public Customer checkCustomer(Customer customer) {
		Session session = sf.openSession();
        String hql="from Customer where  customer_no = '"+ customer.getCustomer_no()+"' and customer_password ='"+ customer.getCustomer_password()+"'";
        Query query=session.createQuery(hql);
        Customer c=(Customer)query.uniqueResult();
        session.close();
        return c;
	}

	public void EditCustomer(Customer customer) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction(); 
		Customer oldCustomer=(Customer)session.get(Customer.class, customer.getCustomer_id());
		oldCustomer.setCustomer_name(customer.getCustomer_name());
		oldCustomer.setSex(customer.getSex());
		oldCustomer.setJob(customer.getJob());
		oldCustomer.setTel(customer.getTel());
		oldCustomer.setAddr(customer.getAddr());
		oldCustomer.setIdcard(customer.getIdcard());
		oldCustomer.setRemark(customer.getRemark());
		session.save(oldCustomer);
		tx.commit();
		session.close();
		
	}

	public void CustomerChangePsw(Customer c, String passwordnew) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction(); 
		Customer oldCustomer=(Customer)session.get(Customer.class, c.getCustomer_id());
		oldCustomer.setCustomer_password(passwordnew);
		session.save(oldCustomer);
		tx.commit();
		session.close();
	}
}
