package com.SSSSWeb.model.business.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.SSSSWeb.model.domain.User;
import org.hibernate.Session;

public class UserDAO {
	private SessionFactory sf;
	
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	public int insertUser(User user) {
		Session session = sf.getCurrentSession();
		int i=0;
		String hql = "from Use where username='"+user.getUsername()+"'";
		Query query = session.createQuery(hql);
		//Use u=(Use)query.uniqueResult();
		ArrayList resultList = (ArrayList) query.list();
		if(resultList.size() > 0){
			i=1;
			return i;
		}
		session.save(user);
		return i;
	}
	
	public void updateUser(User u) {
		Session session = sf.getCurrentSession();
		User oldUser=(User)session.get(User.class, u.getUserid());
		oldUser.setDepartment(u.getDepartment());
		oldUser.setPost(u.getPost());
		session.save(oldUser);
	}
	public User CheckUser(User user){
		Session session = sf.getCurrentSession();
		String hql="from Use where  username= '"+ user.getUsername()+"' and password='"+ user.getPassword()+"'";
		Query query=session.createQuery(hql);
		User u=(User)query.uniqueResult();
		 
		return u;
	}


	public void ChangePsw(User user) {
		Session session = sf.getCurrentSession();
		User oldUser=(User)session.get(User.class, user.getUserid());
		oldUser.setPassword(user.getPassword());
		session.save(oldUser);
	}

}
