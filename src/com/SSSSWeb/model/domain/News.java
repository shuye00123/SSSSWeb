package com.SSSSWeb.model.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="news")
public class News {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int news_id; 
	private String news_title;
	private String img_adr;
	private String news_detial;
	private String link;
	private String position;
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getImg_adr() {
		return img_adr;
	}
	public void setImg_adr(String img_adr) {
		this.img_adr = img_adr;
	}
	public String getNews_detial() {
		return news_detial;
	}
	public void setNews_detial(String news_detial) {
		this.news_detial = news_detial;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
}
