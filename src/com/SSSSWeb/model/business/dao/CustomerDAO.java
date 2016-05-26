package com.SSSSWeb.model.business.dao;

import java.util.ArrayList;

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

	public Boolean InsertCustomer(Customer customer) {
		Session session = sf.openSession();
		String hql = " from  Customer where customer_no = '"+customer.getCustomer_no()+"'" ;
		Query query=session.createQuery(hql);
	    Customer c=(Customer)query.uniqueResult();
		Boolean b;
		if(c==null){
			session.save(customer);
			b=true;
		}else{
			b=false;
		}
		session.close();
		return b;
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

	public ArrayList<Customer> SelectCustomer(int page, int i) {
		Session session = sf.openSession();
		String hql= "select c.customer_id,c.customer_no,c.customer_no,c.customer_name,c.sex,c.job,c.tel,c.addr,c.idcard,c.remark "
				+ " from Customer c";	
		Query query = session.createQuery(hql);
		page=page*i;
		query.setFirstResult(page);
		query.setMaxResults(i);
		ArrayList resultList = (ArrayList) query.list();
		session.close();
		return resultList;
	}

	public int selectCount() {
		Session session = sf.openSession();
		String hql = " select count(*) from Customer ";
		Query q=session.createQuery(hql);
		int count=Integer.parseInt(q.uniqueResult().toString());
		session.close();
		return count;
	}
}
