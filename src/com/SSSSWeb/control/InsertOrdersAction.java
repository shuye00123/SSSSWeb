package com.SSSSWeb.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.OrdersService;
import com.SSSSWeb.model.domain.Customer;
import com.SSSSWeb.model.domain.Orders;
import com.opensymphony.xwork2.ActionSupport;

public class InsertOrdersAction extends ActionSupport implements SessionAware{
	private OrdersService os;
	private Map<String, Object> session;
	private String Alldata;
	

	public void setOs(OrdersService os) {
		this.os = os;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getAlldata() {
		return Alldata;
	}

	public void setAlldata(String alldata) {
		Alldata = alldata;
	}

	
	@Override
	public String execute() throws Exception {
		HttpServletResponse hsr = ServletActionContext.getResponse();
		String a=Alldata;
		Customer c=(Customer)session.get("customer");
		Orders o = os.InsertOrders(c);
		JSONArray json = JSONArray.fromObject(Alldata);
		if(json.size()>0){
			  for(int i=0;i<json.size();i++) {
			    os.InsertOrdersList(o,Integer.parseInt(json.getJSONObject(i).getString("id")),Integer.parseInt(json.getJSONObject(i).getString("num")),Integer.parseInt(json.getJSONObject(i).getString("order_list_id")));
			  }
			}
		
		hsr.setCharacterEncoding("UTF-8");
        hsr.getWriter().write("");
		
		return "success";
	}
	
	
}
