package com.SSSSWeb.control;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.SSSSWeb.model.business.service.CustomerService;
import com.opensymphony.xwork2.ActionSupport;

public class SelectCustomerAction extends ActionSupport{
	private CustomerService cs;
	private List list;
	private int pagecount;
	private int page;

	


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getPagecount() {
		return pagecount;
	}


	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}


	public List getList() {
		return list;
	}


	public void setList(List list) {
		this.list = list;
	}


	public void setCs(CustomerService cs) {
		this.cs = cs;
	}


	@Override
	public String execute() throws Exception {
		HttpServletResponse hsr = ServletActionContext.getResponse();
		int i=1;
		int count = cs.selectCount();  
		if(count%i==0){
			pagecount = count/i;
		}else{
			pagecount = count/i + 1;
		}
		
		list = cs.SelectCustomer(page,i);
		hsr.setCharacterEncoding("UTF-8");
        hsr.getWriter().write("");
		return "success";
	}
}