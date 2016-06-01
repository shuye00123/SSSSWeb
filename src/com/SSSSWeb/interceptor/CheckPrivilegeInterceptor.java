/**
 * LY.com Inc.
 * Copyright (c) 2004-2016 All Rights Reserved.
 */
package com.SSSSWeb.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.SSSSWeb.control.SignInAction;
import com.SSSSWeb.model.domain.Users;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 
 * @author sy25471
 * @version $Id: CheckPrivilegeInterceptor.java, v 0.1 2016骞�4鏈�26鏃� 涓婂崍11:17:43 sy25471 Exp $
 */
public class CheckPrivilegeInterceptor extends AbstractInterceptor {
    /**  */
    private static final long serialVersionUID = 191080623183896676L;
   
    public String intercept(ActionInvocation invocation) throws Exception{
        System.out.println("intercetor!");
        
        Object action = invocation.getAction();
        if(action instanceof SignInAction){
        	return invocation.invoke();
        }
        ActionContext ac = invocation.getInvocationContext();
        Map session = ac.getSession();
        System.out.println(session.get("user")== null);
        System.out.println(((Users)session.get("user")).getPost().equals("管理员"));
        if(session.get("user") == null){
        	return "input";
        }else{
        	if(!((Users)session.get("user")).getPost().equals("管理员")){
                return "input";
        	}
        }
        return invocation.invoke();
    }
}
