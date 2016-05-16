package com.SSSSWeb.control;


import com.SSSSWeb.model.business.service.SupplierService;

import com.SSSSWeb.model.domain.Supplier;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
public class EditSupplierAction extends ActionSupport implements ModelDriven<Supplier>{
	private SupplierService sp;
	private Supplier supplier = new Supplier();
	
	public SupplierService getSp() {
		return sp;
	}

	public void setSp(SupplierService sp) {
		this.sp = sp;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	@Override
	public String execute() throws Exception {
		sp.EditSupplier(supplier);
		return "success";
	}
	
	public Supplier getModel() {
		return supplier;
	}
}
