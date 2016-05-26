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
	private int pagecount;
	private int page;


	public int getPagecount() {
		return pagecount;
	}


	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}


	public void setSp(SupplierService sp) {
		this.sp = sp;
	}


	public List getList() {
		return list;
	}


	public void setList(List list) {
		this.list = list;
	}


	


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	@Override
	public String execute() throws Exception {
		HttpServletResponse hsr = ServletActionContext.getResponse();
		int i=1;
		int count = sp.selectCount();
		if(count%i==0){
			pagecount = count/i;
		}else{
			pagecount = count/i + 1;
		}
		
		
		list = sp.SelectSupplier(page,i);
		hsr.setCharacterEncoding("UTF-8");
        hsr.getWriter().write("");
		return "success";
	}


}
