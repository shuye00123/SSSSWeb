package com.SSSSWeb.model.business.dao;

import java.util.ArrayList;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.SSSSWeb.model.domain.Supplier;
import com.SSSSWeb.model.domain.Users;


public class SupplierDAO {
	private SessionFactory sf;

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	public SessionFactory getSf() {
		return sf;
	}

	public ArrayList<Supplier> SelectSupplier() {
		Session session = sf.openSession();
		String hql="select s.supplier_id,s.supplier_name,s.contact,s.contact_tel,s.contact_addr,s.account_bank,s.account_num,s.remark  " +
				"from Supplier s";
		Query query = session.createQuery(hql);
		ArrayList resultList = (ArrayList) query.list();
		session.close();
		return resultList;
	}

	public void EditSupplier(Supplier supplier) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction(); 
		Supplier oldSupplier=(Supplier)session.get(Supplier.class, supplier.getSupplier_id());
		oldSupplier.setSupplier_id(supplier.getSupplier_id());
		oldSupplier.setSupplier_name(supplier.getSupplier_name());
		oldSupplier.setContact(supplier.getContact());
		oldSupplier.setContact_tel(supplier.getContact_tel());
		oldSupplier.setContact_addr(supplier.getContact_addr());
		oldSupplier.setAccount_bank(supplier.getAccount_bank());
		oldSupplier.setAccount_num(supplier.getAccount_num());
		oldSupplier.setRemark(supplier.getRemark());
		session.save(oldSupplier);
		tx.commit();
		session.close();
	}

	public void DeleteSupplier(int supplier_id) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction(); 
		Supplier su=(Supplier) session.get(Supplier.class, supplier_id);
		session.delete(su);
		tx.commit();
		session.close();
	}

	public void InsertSupplier(Supplier supplier) {
		Session session = sf.openSession();
		session.save(supplier);
		session.close();
	}

}
