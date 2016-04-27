/**
 * LY.com Inc.
 * Copyright (c) 2004-2016 All Rights Reserved.
 */
package com.SSSSWeb.model.business.service;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import com.SSSSWeb.model.business.dao.UsersDAO;
import com.SSSSWeb.model.domain.Users;

/**
 * 
 * @author sy25471
 * @version $Id: UsersService.java, v 0.1 2016年4月19日 上午11:15:32 sy25471 Exp $
 */
public class UsersService {
    private UsersDAO usersDAO;

    public UsersDAO getUsersDAO() {
        return usersDAO;
    }

    public void setUsersDAO(UsersDAO usersDAO) {
        this.usersDAO = usersDAO;
    }
    
    @Transactional
    public int insertUser(Users user) {
        int i;
        i=usersDAO.insertUser(user);
        return i;
    }
 
    @Transactional
    public void updateUser(Users user) {
        usersDAO.updateUser(user);
    }
    @Transactional
    public Users checkUser(Users user) {
        user=usersDAO.CheckUser(user);
        return user;
    }
    @Transactional
    public void ChangePsw(Users user) {
        usersDAO.ChangePsw(user);
        
    }
    @Transactional
    public void DeleteUser(Users user){
        usersDAO.DeleteUser(user);
    }
    @Transactional
    public int PageNum(int pageSize){
        int pageNum = usersDAO.PageNum(pageSize);
        return pageNum;
    }
    @Transactional
    public ArrayList<Users> SelectAllUser(int pageSize, int pageNow){
        ArrayList list = usersDAO.selectAllUser(pageSize, pageNow);
        ArrayList resultList = new ArrayList();
        for(int i=0;i<list.size();i++){
            Object[] obj = (Object[]) list.get(i);
            Users u = new Users();
            u.setUserid(Integer.valueOf(obj[0].toString()));
            u.setUsername(obj[1].toString());
            u.setPassword(obj[2].toString());
            u.setUsex(obj[3].toString());
            u.setPost(obj[4].toString());
            resultList.add(u);
        }
        return resultList;
    }
    @Transactional
    public ArrayList<Users> SelectUser(String name){
        ArrayList list = usersDAO.selectUser(name);
        ArrayList resultList = new ArrayList();
        for(int i=0;i<list.size();i++){
            Object[] obj = (Object[]) list.get(i);
            Users u = new Users();
            u.setUserid(Integer.valueOf(obj[0].toString()));
            u.setUsername(obj[1].toString());
            u.setPassword(obj[2].toString());
            u.setUsex(obj[3].toString());
            u.setPost(obj[4].toString());
            resultList.add(u);
        }
        return resultList;
    }
}
