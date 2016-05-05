package com.SSSSWeb.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.SSSSWeb.model.business.service.PostsService;
import com.SSSSWeb.model.business.service.UsersService;
import com.SSSSWeb.model.domain.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SelectAllUserAction extends ActionSupport implements ModelDriven<Users> {
    /**
     * 本action定义value,pageSzie和pageNow三个变量，value为空，调用pageNum返回分页数量，调用selectAllUser分页查询
     *   */
    private static final long serialVersionUID = 6409965646263698989L;
    private List list;
    private int pageSize=2;
    private int pageNow=1;
    private int pageNum;
    private List postlist;
    private PostsService pservice;
    private Users user = new Users();
    private UsersService service;
    public List getPostlist() {
		return postlist;
	}
	public void setPostlist(List postlist) {
		this.postlist = postlist;
	}
	public int getPageNow() {
        return pageNow;
    }
    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }
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
        String value = null;
        try{
            list = service.SelectAllUser(pageSize, pageNow);
            pageNum = service.PageNum(pageSize, value);
            postlist = pservice.postList();
            return "success";
        }catch(Exception e){
            HttpServletRequest request=ServletActionContext.getRequest();
            request.setAttribute("Message", e.toString());
        }
        return "failure";
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
