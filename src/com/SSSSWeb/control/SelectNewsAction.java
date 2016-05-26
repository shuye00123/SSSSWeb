package com.SSSSWeb.control;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.SSSSWeb.model.business.service.NewsService;
import com.opensymphony.xwork2.ActionSupport;

public class SelectNewsAction extends ActionSupport {
	private NewsService ns;
	private List list; 
	
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public void setNs(NewsService ns) {
		this.ns = ns;
	}

	@Override
	public String execute() throws Exception {
		HttpServletResponse hsr = ServletActionContext.getResponse();
		list=ns.SelectNews();
		hsr.setCharacterEncoding("UTF-8");
        hsr.getWriter().write("");
		return "success";
	}
}
