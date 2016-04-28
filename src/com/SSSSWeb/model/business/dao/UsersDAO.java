/**
 * LY.com Inc.
 * Copyright (c) 2004-2016 All Rights Reserved.
 */
package com.SSSSWeb.model.business.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.SSSSWeb.model.domain.Users;

/**
 * 
 * @author sy25471
 * @version $Id: UsersDAO.java, v 0.1 2016年4月19日 上午11:09:03 sy25471 Exp $
 */
public class UsersDAO {
    private SessionFactory sf;

    public SessionFactory getSf() {
        return sf;
    }

    public void setSf(SessionFactory sf) {
        this.sf = sf;
    }
    
    public int insertUser(Users user) {
        Session session = sf.openSession();
        int i=0;
        String hql = "from Users where username='"+user.getUsername()+"'";
        Query query = session.createQuery(hql);
        //Use u=(Use)query.uniqueResult();
        ArrayList resultList = (ArrayList) query.list();
        if(resultList.size() > 0){
            i=1;
            session.close();
            return i;
        }
        session.save(user);
        session.close();
        return i;
    }
    public int PageNum(int pageSize, String value){
        int pageNum;
        String hql=null;
        ArrayList resultList;
        Session session = sf.openSession();
        if(value==null){
            hql = "select * from Users";
            Query query = session.createSQLQuery(hql);
            resultList = (ArrayList) query.list();
        }else{
            hql = "select * from Users"+" where username= '"+value+"'";
            Query query = session.createSQLQuery(hql);
            System.out.println(query.list());
            if(query.list().isEmpty()){
                hql = "select * from Users"+" where post= '"+value+"'";
                query = session.createSQLQuery(hql);
            }
            resultList = (ArrayList) query.list();
        }
        if(resultList.size()/pageSize==0)
            pageNum = 1;
        else
            pageNum = resultList.size()/pageSize;
        session.close();
        return pageNum;
    }
    public ArrayList selectAllUser(int pageSize, int pageNow){
        Session session = sf.openSession();
        String hql = "select * from Users limit "+(pageNow*pageSize-pageSize)+","+pageSize;
        Query query = session.createSQLQuery(hql);
        ArrayList resultList = (ArrayList) query.list();
        session.close();
        return resultList;
    }
    public ArrayList selectUser(String key, int pageSize, int pageNow){
        Session session = sf.openSession();
        String hql = "select * from Users "+"where username= '"+key+"' limit "+(pageNow*pageSize-pageSize)+","+pageSize;
        Query query = session.createSQLQuery(hql);
        if(query.list().isEmpty()){
            hql = "select * from Users "+"where post= '"+key+"' limit "+(pageNow*pageSize-pageSize)+","+pageSize;
            query = session.createSQLQuery(hql);
        }
        ArrayList resultList = (ArrayList) query.list();
        session.close();
        return resultList;
    }
    public void updateUser(Users u) {
        Session session = sf.openSession();
        Users oldUsers=(Users)session.get(Users.class, u.getUserid());
        oldUsers.setPost(u.getPost());
        session.close();
        session.save(oldUsers);
    }
    public Users CheckUser(Users user){
        Session session = sf.openSession();
        String hql="from Users where  username= '"+ user.getUsername()+"' and password='"+ user.getPassword()+"'";
        Query query=session.createQuery(hql);
        Users u=(Users)query.uniqueResult();
        session.close();
        return u;
    }
    public void ChangePsw(Users user) {
        Session session = sf.openSession();
        Users oldUsers=(Users)session.get(Users.class, user.getUserid());
        oldUsers.setPassword(user.getPassword());
        session.save(oldUsers);
        session.close();
    }
    public void DeleteUser(Users user){
        Session session = sf.openSession();
        Users u = (Users)session.get(Users.class, user.getUserid());
        session.delete(u);
        session.close();
    } 
}
