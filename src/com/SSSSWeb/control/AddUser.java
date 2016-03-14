package com.SSSSWeb.control;

import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.UserService;
import com.SSSSWeb.model.domain.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AddUser extends ActionSupport implements ModelDriven<User>{
	private User user=new User();
	private UserService service;
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
	public String execute() throws Exception{
		int i;
		i=service.insertUser(user);
		if(i==0){
			return "success";
		}
		return "input";
	}
	public User getModel(){
		return user;
	}
}
