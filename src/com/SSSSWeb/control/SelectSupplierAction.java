package com.SSSSWeb.control;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;

import com.SSSSWeb.model.business.service.SupplierService;
import com.opensymphony.xwork2.ActionSupport;
public class SelectSupplierAction extends ActionSupport{
	private SupplierService sp;
	private List list;

	


	public void setSp(SupplierService sp) {
		this.sp = sp;
	}


	public List getList() {
		return list;
	}


	public void setList(List list) {
		this.list = list;
	}


	@Override
	public String execute() throws Exception {
		HttpServletResponse hsr = ServletActionContext.getResponse();
		list = sp.SelectSupplier();
		hsr.setCharacterEncoding("UTF-8");
        hsr.getWriter().write("");
		return "success";
	}


}
