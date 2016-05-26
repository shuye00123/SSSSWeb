package com.SSSSWeb.model.business.service;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.List;


import org.springframework.transaction.annotation.Transactional;

import com.SSSSWeb.model.business.dao.SupplierDAO;
import com.SSSSWeb.model.domain.Supplier;


public class SupplierService {
	private SupplierDAO supplierDAO;
	
	

	public SupplierDAO getSupplierDAO() {
		return supplierDAO;
	}


	public void setSupplierDAO(SupplierDAO supplierDAO) {
		this.supplierDAO = supplierDAO;
	}



	@Transactional
	public ArrayList<Supplier> SelectSupplier(int page, int a) {
		ArrayList su=supplierDAO.SelectSupplier(page,a);
		ArrayList reslist = new ArrayList();
		for(int i=0;i<su.size();i++){
			
			Object[] obj = (Object[]) su.get(i);
			Supplier to = new Supplier();
			to.setSupplier_id(Integer.valueOf(obj[0].toString()));
			to.setSupplier_name(obj[1].toString());
			to.setContact(obj[2].toString());
			to.setContact_tel(obj[3].toString());
			to.setContact_addr(obj[4].toString());
			to.setAccount_bank(obj[5].toString());
			to.setAccount_num(obj[6].toString());
			to.setRemark(obj[7].toString());
			reslist.add(to);
		}
		return reslist;
	}

	@Transactional
	public void EditSupplier(Supplier supplier) {
		supplierDAO.EditSupplier(supplier);
		
	}

	@Transactional
	public void DeleteSupplier(int supplier_id) {
		supplierDAO.DeleteSupplier(supplier_id);
		
	}

	@Transactional
	public void InsertSupplier(Supplier supplier) {
		supplierDAO.InsertSupplier(supplier);
		
	}


	public int selectCount() {
		int count = supplierDAO.selectCount();
		return count;
	}


	

}
