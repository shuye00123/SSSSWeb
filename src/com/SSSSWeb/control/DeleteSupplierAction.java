package com.SSSSWeb.control;


import com.SSSSWeb.model.business.service.SupplierService;
import com.opensymphony.xwork2.ActionSupport;
public class DeleteSupplierAction extends ActionSupport{
	private SupplierService sp;
	private int supplier_id;
	
	
	
	public SupplierService getSp() {
		return sp;
	}



	public void setSp(SupplierService sp) {
		this.sp = sp;
	}



	public int getSupplier_id() {
		return supplier_id;
	}



	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}



	@Override
	public String execute() throws Exception {
		sp.DeleteSupplier(supplier_id);
		return "success";
	}
}
