package com.SSSSWeb.control;

import java.util.List;

import com.SSSSWeb.model.business.service.UserService;
import com.SSSSWeb.model.domain.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SelectUser extends ActionSupport implements ModelDriven<User>{
	private List list;
	private User user = new User();
	private UserService service;
	private String name;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String execute() throws Exception {
		list = service.SelectUser(name);
		return "success";
	}
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
}
