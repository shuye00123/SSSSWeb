package com.SSSSWeb.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.UsersService;
import com.SSSSWeb.model.domain.Users;
import com.opensymphony.xwork2.ActionSupport;

public class ChangePswAction extends ActionSupport implements SessionAware{
    /**  */
    private static final long serialVersionUID = 4948899620692423928L;
    private UsersService service;
    private Map<String, Object> session;
    private Users user = new Users();
    private String newpassword;
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
    @Override
    public String execute() throws Exception{
        user=(Users)session.get("user");
        System.out.println(user.getUsername());
        System.out.println(newpassword);
        Users u = service.checkUser(user);
        if (u !=null) {
            service.ChangePsw(user, newpassword);
            HttpServletRequest request=ServletActionContext.getRequest();
            request.setAttribute("Message", "修改密码成功，下次登录生效");
            session.put("user",u);
            return "success";
        }else{
            HttpServletRequest request=ServletActionContext.getRequest();
            request.setAttribute("Message", "修改密码失败");
        }
        return "failure";
    }
    public String getNewpassword() {
        return newpassword;
    }
    public void setNewpassword(String newpassword) {
        this.newpassword = newpassword;
    }
}
