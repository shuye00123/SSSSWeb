package com.SSSSWeb.control;

import java.util.List;

import com.SSSSWeb.model.business.service.UserService;
import com.SSSSWeb.model.domain.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SelectAllUserAction extends ActionSupport implements ModelDriven<User>{
	private List list;
	private User user = new User();
	private UserService service;
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserService getService() {
		return service;
	}
	public void setService(UserService service) {
		this.service = service;
	}
	@Override
	public String execute() throws Exception {
		list = service.SelectAllUser();
		return "success";
	}
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
}
