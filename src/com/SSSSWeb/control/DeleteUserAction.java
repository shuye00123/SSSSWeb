package com.SSSSWeb.control;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.UserService;
import com.SSSSWeb.model.domain.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DeleteUserAction extends ActionSupport implements SessionAware,ModelDriven<User>{
	private User user = new User();
	private UserService service;
	private Map<String,Object> session;
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
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public String execute() throws Exception{
		service.DeleteUser(user);
		return "success";
	}
	public User getModel(){
		return user;
	}
}
