package com.SSSSWeb.control;

import java.sql.ResultSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.SSSSWeb.model.business.service.UsersService;
import com.SSSSWeb.model.domain.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SelectUserAction extends ActionSupport {
    /**
     * 本action定义pageSzie和pageNow两个变量，调用pageNum返回分页数量，调用selectAllUser分页查询
     *   */
    private static final long serialVersionUID = 3154874431184397098L;
    private List list;
    private UsersService service;
    private String key;
    private int pageNum;
    private int pageSize=2;
    private int pageNow=1;
    
    public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
        return pageSize;
    }
    
    public int getPageNow() {
        return pageNow;
    }
    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
        System.out.println(key);
    }
    public List getList() {
        return list;
    }
    public void setList(List list) {
        this.list = list;
    }
    public UsersService getService() {
        return service;
    }
    public void setService(UsersService service) {
        this.service = service;
    }
    
    @Override
    public String execute() throws Exception {
        try{
        	System.out.println(pageNow);
        	list = service.SelectUser(key,pageSize,pageNow);
            setPageNum(service.PageNum(pageSize, key));
            return "success";
        }catch(Exception e){
            HttpServletRequest request=ServletActionContext.getRequest();
            request.setAttribute("Message", e.toString());
        }
        return "failure";
    }
    public int getPageNum() {
        return pageNum;
    }
    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }
}
