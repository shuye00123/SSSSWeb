package com.SSSSWeb.model.business.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class PostsDAO {
	private SessionFactory sf;

	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	public ArrayList postList(){
		Session session = sf.openSession();
        String hql = "select * from Posts";
        Query query = session.createSQLQuery(hql);
        ArrayList resultList = (ArrayList) query.list();
        session.close();
        return resultList;
	}
}
