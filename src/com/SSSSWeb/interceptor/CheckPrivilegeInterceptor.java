/**
 * LY.com Inc.
 * Copyright (c) 2004-2016 All Rights Reserved.
 */
package com.SSSSWeb.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 
 * @author sy25471
 * @version $Id: CheckPrivilegeInterceptor.java, v 0.1 2016年4月26日 上午11:17:43 sy25471 Exp $
 */
public class CheckPrivilegeInterceptor extends AbstractInterceptor {
    /**  */
    private static final long serialVersionUID = 191080623183896676L;
   
    public String intercept(ActionInvocation invocation) throws Exception{
        System.out.println("intercetor test!");
       
        return invocation.invoke();
    }
}
