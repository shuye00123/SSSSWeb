package com.SSSSWeb.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.UsersService;
import com.SSSSWeb.model.domain.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DeleteUserAction extends ActionSupport implements SessionAware {
    /**  */
    private static final long serialVersionUID = 942250617781853325L;
    private UsersService service;
    private int userid;
    private Map<String, Object> session;
    private Users user = new Users();
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
    public String execute(){
        HttpServletRequest request=ServletActionContext.getRequest();
        user=service.FindUserById(userid);
        try{
            service.DeleteUser(user);
            request.setAttribute("Message", "删除成功");
            return "success";
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        request.setAttribute("Message", "删除失败");
        return "failure";
    }
    public Users getModel(){
        return user;
    }
    public int getUserid() {
        return userid;
    }
    public void setUserid(int userid) {
        this.userid = userid;
    }
}
