/**
 * LY.com Inc.
 * Copyright (c) 2004-2016 All Rights Reserved.
 */
package com.SSSSWeb.interceptor;

import java.util.Map;

import com.SSSSWeb.control.SignInAction;
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
        System.out.println("intercetor test!");
        
        Object action = invocation.getAction();
        if(action instanceof SignInAction){
        	return invocation.invoke();
        }
        ActionContext ac = invocation.getInvocationContext();
        Map session = ac.getSession();
        if(session.get("user") == null){
        	return "input";
        }
        return invocation.invoke();
    }
}
