package com.SSSSWeb.control;

import java.util.Map;

import com.SSSSWeb.model.business.service.UsersService;
import com.SSSSWeb.model.domain.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ChangeUserAction extends ActionSupport implements ModelDriven<Users> {
    /**  */
    private static final long serialVersionUID = 6247927281259946654L;
    private UsersService service;
    private Map<String, Object> session;
    private Users user = new  Users();
    public UsersService getService() {
        return service;
    }
    public void setService(UsersService service) {
        this.service = service;
    }
    public Map<String, Object> getSession() {
        return session;
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
    public String execute() throws Exception{
        service.updateUser(user);
        return "success";
    }
    public Users getModel(){
        return user;
    }
}
