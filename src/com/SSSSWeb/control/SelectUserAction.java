package com.SSSSWeb.control;

import java.util.List;

import com.SSSSWeb.model.business.service.UsersService;
import com.SSSSWeb.model.domain.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SelectUserAction extends ActionSupport implements ModelDriven<Users> {
    /**  */
    private static final long serialVersionUID = 3154874431184397098L;
    private List list;
    private Users user;
    private UsersService service;
    private String name;
    public List getList() {
        return list;
    }
    public void setList(List list) {
        this.list = list;
    }
    public Users getUser() {
        return user;
    }
    public void setUser(Users user) {
        this.user = user;
    }
    public UsersService getService() {
        return service;
    }
    public void setService(UsersService service) {
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
    public Users getModel(){
        return user;
    }
}
