package com.SSSSWeb.control;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.domain.User;
import com.SSSSWeb.model.business.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SignInAction extends ActionSupport implements SessionAware, ModelDriven<User>{
	private static final long serialVersionUID = 1L;
	private UserService service;
	private Map<String,Object> session;
	private User user=new User();
	public UserService getService() {
		return service;
	}

	public void setService(UserService service) {
		this.service = service;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	@Override  
	public void validate() {  
	  super.validate();  
	    //clearFieldErrors(); 
	    clearActionErrors();
	}  


	
	public String execute() throws Exception {
	    //user.setUsername();
		User u = service.checkUser(user);
		if (u !=null) {
			session.put("user", u);
			return "success"+u.getPost();
		}
		return "input"; 
	}
	private Map<String, Object> getSession() {
		return ActionContext.getContext().getSession();
	}

	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
}
