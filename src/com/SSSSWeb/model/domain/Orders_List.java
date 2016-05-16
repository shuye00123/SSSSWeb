package com.SSSSWeb.model.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="orders_list")
public class Orders_List {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int order_list_id;
	private int id;
	private int num;
	private int order_id;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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
	
}
