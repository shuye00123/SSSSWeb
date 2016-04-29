/**
 * LY.com Inc.
 * Copyright (c) 2004-2016 All Rights Reserved.
 */
package com.SSSSWeb.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.UsersService;
import com.SSSSWeb.model.domain.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author sy25471
 * @version $Id: SignInAction.java, v 0.1 2016年4月19日 上午11:34:31 sy25471 Exp $
 */
public class SignInAction extends ActionSupport implements SessionAware, ModelDriven<Users> {
    private static final long serialVersionUID = 1L;
    private UsersService service;
    private Map<String,Object> session;
    private Users user=new Users();
    public UsersService getService() {
        return service;
    }
    public void setService(UsersService service) {
        this.service = service;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    public Users getUser() {
        return user;
    }
    public void setUser(Users user) {
        this.user = user;
    }
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    public String execute(){
        try{
            Users u = service.checkUser(user);
            if (u !=null) {
                session.put("user", u);
                return "success";
            }
        }catch(Exception e){
                HttpServletRequest request=ServletActionContext.getRequest();
                request.setAttribute("Message", e.toString());
        }
        return "input"; 
    }
    public Users getModel() {
        // TODO Auto-generated method stub
        //user.setUsername("舒野");
        //user.setPassword("123");
        return user;
    }
}
