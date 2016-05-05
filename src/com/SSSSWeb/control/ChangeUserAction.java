package com.SSSSWeb.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.SSSSWeb.model.business.service.UsersService;
import com.SSSSWeb.model.domain.Users;
import com.opensymphony.xwork2.ActionSupport;


public class ChangeUserAction extends ActionSupport implements SessionAware{
    /**
     * 本action接收传来的4个变量并判空，调用service的findUser方法寻找目标对象，update方法更新对象
     *   */
    private static final long serialVersionUID = 6247927281259946654L;
    private UsersService service;
    private Users user = new Users();
    private int userid;
    private String username;
    private String usex;
    private String post;
    private String phonenum;
    private Map<String, Object> session;
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
    public int getUserid() {
        return userid;
    }
    public void setUserid(int userid) {
        this.userid = userid;
    }
    public Users getUser() {
        return user;
    }
    public void setUser(Users user) {
        this.user = user;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getUsex() {
        return usex;
    }
    public void setUsex(String usex) {
        this.usex = usex;
    }
    public String getPost() {
        return post;
    }
    public void setPost(String post) {
        this.post = post;
    }
    
    public String execute() throws Exception{
        user=service.FindUserById(userid);
        if(post!=null){
            user.setPost(post);}
        if(!username.isEmpty()){
            user.setUsername(username);}
        if(usex!=null){
            user.setUsex(usex);}
        if(!phonenum.isEmpty()){
            user.setPhonenum(phonenum);}
        try{
            service.updateUser(user);
            return "success";
        }catch(Exception e){
            HttpServletRequest request=ServletActionContext.getRequest();
            request.setAttribute("Message", e.toString());
        }
        return "failure";
    }
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
}
