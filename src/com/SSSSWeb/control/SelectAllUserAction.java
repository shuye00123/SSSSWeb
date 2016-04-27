package com.SSSSWeb.control;

import java.util.List;

import com.SSSSWeb.model.business.service.UsersService;
import com.SSSSWeb.model.domain.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SelectAllUserAction extends ActionSupport implements ModelDriven<Users> {
    /**  */
    private static final long serialVersionUID = 6409965646263698989L;
    private List list;
    private int pageSize=10;
    private int pageNow=1;
    private int pageNum;
    public int getPageNow() {
        return pageNow;
    }
    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }
    private Users user = new Users();
    private UsersService service;
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
    @Override
    public String execute() throws Exception {
        list = service.SelectAllUser(pageSize, pageNow);
        pageNum = service.PageNum();
        return "success";
    }
    public Users getModel(){
        return user;
    }
    public int getPageNum() {
        return pageNum;
    }
    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

}
