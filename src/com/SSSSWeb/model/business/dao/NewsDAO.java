package com.SSSSWeb.model.business.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.SSSSWeb.model.domain.News;

public class NewsDAO {

	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	public ArrayList<News> SelectNews() {
		Session session = sf.openSession();
		String hql= "select n.news_id,n.news_title,n.img_adr,n.news_detial,n.link,n.position "
				+ " from News n ";	
		Query query = session.createQuery(hql);
		ArrayList resultList = (ArrayList) query.list();
		session.close();
		return resultList;
	}

}
