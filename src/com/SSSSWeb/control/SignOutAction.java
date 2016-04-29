package com.SSSSWeb.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.UsersService;
import com.opensymphony.xwork2.ActionSupport;


public class SignOutAction extends ActionSupport implements SessionAware {
    /**  */
    private static final long serialVersionUID = 416661821021248465L;
    private UsersService service;
    public String execute() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        try{
            session.invalidate();
            return "success";
        }catch(Exception e){
            request.setAttribute("Message", e.toString());
        }
        return "input";
    }
    public void setSession(Map<String, Object> session) {
    }
    public UsersService getService() {
        return service;
    }
    public void setService(UsersService service) {
        this.service = service;
    }
}
