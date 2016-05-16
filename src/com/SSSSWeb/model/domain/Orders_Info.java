package com.SSSSWeb.model.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="orders_info")
public class Orders_Info {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int order_id;
	private Date order_time; 
	private Date send_time;
	private Date  settle_time;
	private String order_state;
	private int  customer_id;
	private int order_list_id;
	private int id;
	private int num;
	private String code;
	private String chn_name; 
	private String eng_name; 
	private String color; 
    private int price; 
    private String img;
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public Date getSend_time() {
		return send_time;
	}
	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}
	public Date getSettle_time() {
		return settle_time;
	}
	public void setSettle_time(Date settle_time) {
		this.settle_time = settle_time;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public int getOrder_list_id() {
		return order_list_id;
	}
	public void setOrder_list_id(int order_list_id) {
		this.order_list_id = order_list_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getChn_name() {
		return chn_name;
	}
	public void setChn_name(String chn_name) {
		this.chn_name = chn_name;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
