package com.SSSSWeb.model.business.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.SSSSWeb.model.business.dao.NewsDAO;
import com.SSSSWeb.model.domain.News;


public class NewsService {
	
	private NewsDAO newsDAO;
	
	public NewsDAO getNewsDAO() {
		return newsDAO;
	}

	public void setNewsDAO(NewsDAO newsDAO) {
		this.newsDAO = newsDAO;
	}

	@Transactional
	public ArrayList<News> SelectNews() {
		ArrayList list=newsDAO.SelectNews();
		ArrayList reslist = new ArrayList();
		for(int i=0;i<list.size();i++){
			Object[] obj = (Object[]) list.get(i);
			News to = new News();
			
			to.setNews_id(Integer.valueOf(obj[0].toString()));
			to.setNews_title(obj[1].toString());
			to.setImg_adr(obj[2].toString());
			to.setNews_detial(obj[3].toString());
			to.setLink(obj[4].toString());
			to.setPosition(obj[5].toString());
			reslist.add(to);
			
		}
		return reslist;	
		
	}

}
