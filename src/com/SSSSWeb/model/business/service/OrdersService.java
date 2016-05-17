package com.SSSSWeb.model.business.service;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.List;
import java.text.ParseException;
import org.springframework.transaction.annotation.Transactional;


import com.SSSSWeb.model.business.dao.OrdersDAO;
import com.SSSSWeb.model.domain.Customer;
import com.SSSSWeb.model.domain.Orders;
import com.SSSSWeb.model.domain.Orders_Count;
import com.SSSSWeb.model.domain.Orders_Info;



public class OrdersService {
	private OrdersDAO ordersDAO;

	public OrdersDAO getOrdersDAO() {
		return ordersDAO;
	}

	public void setOrdersDAO(OrdersDAO ordersDAO) {
		this.ordersDAO = ordersDAO;
	}

	@Transactional
	public void InsertShopCart(Customer c,int id, int num) throws ParseException {
		ordersDAO.InsertShopCart(c,id,num);
	}


	
	@Transactional
	public ArrayList<Orders_Count> SelectCount(Customer c) {
		ArrayList list=ordersDAO.SelectCount(c);
		ArrayList reslist = new ArrayList();
		for(int i=0;i<list.size();i++){
			Object[] obj = (Object[]) list.get(i);
			Orders_Count to = new Orders_Count();
			to.setOrder_id(Integer.valueOf(obj[0].toString()));
			to.setCount(Integer.valueOf(obj[1].toString()));
			to.setOrder_state(obj[2].toString());
			reslist.add(to);
			
		}
		return reslist;	
	}

	@Transactional
	public ArrayList<Orders_Info> SelectOrders(Customer c) throws ParseException {
		ArrayList or=ordersDAO.SelectOrders(c);
		ArrayList reslist = new ArrayList();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(int i=0;i<or.size();i++){
			Object[] obj = (Object[]) or.get(i);
			Orders_Info to = new Orders_Info();
			to.setOrder_id(Integer.valueOf(obj[0].toString()));
			to.setOrder_time(sdf.parse(obj[1].toString()));
			to.setSend_time(sdf.parse(obj[2].toString()));
			to.setSettle_time(sdf.parse(obj[3].toString()));
			to.setOrder_state(obj[4].toString());
			to.setCustomer_id(Integer.valueOf(obj[5].toString()));
			to.setOrder_list_id(Integer.valueOf(obj[6].toString()));
			to.setId(Integer.valueOf(obj[7].toString()));
			to.setNum(Integer.valueOf(obj[8].toString()));
			to.setCode(obj[9].toString());
			to.setChn_name(obj[10].toString());
			to.setEng_name(obj[11].toString());
			to.setColor(obj[12].toString());
			to.setPrice(Integer.valueOf(obj[13].toString()));
			to.setImg(obj[14].toString());
			to.setQuantity(Integer.valueOf(obj[15].toString()));
			reslist.add(to);
		}
		return reslist;
	}
	
	
	@Transactional
	public ArrayList<Orders_Info> SelectShopCart(Customer c) throws ParseException {
		ArrayList or=ordersDAO.SelectShopCart(c);
		ArrayList reslist = new ArrayList();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(int i=0;i<or.size();i++){
			
			Object[] obj = (Object[]) or.get(i);
			Orders_Info to = new Orders_Info();
			to.setOrder_id(Integer.valueOf(obj[0].toString()));
			to.setOrder_time(sdf.parse(obj[1].toString()));
			to.setSend_time(sdf.parse(obj[2].toString()));
			to.setSettle_time(sdf.parse(obj[3].toString()));
			to.setOrder_state(obj[4].toString());
			to.setCustomer_id(Integer.valueOf(obj[5].toString()));
			to.setOrder_list_id(Integer.valueOf(obj[6].toString()));
			to.setId(Integer.valueOf(obj[7].toString()));
			to.setNum(Integer.valueOf(obj[8].toString()));
			to.setCode(obj[9].toString());
			to.setChn_name(obj[10].toString());
			to.setEng_name(obj[11].toString());
			to.setColor(obj[12].toString());
			to.setPrice(Integer.valueOf(obj[13].toString()));
			to.setImg(obj[14].toString());
			to.setQuantity(Integer.valueOf(obj[15].toString()));
			reslist.add(to);
		}
		return reslist;
	}

	@Transactional
	public void InsertOrdersList(Orders  o,int id,int num,int oi) throws ParseException {
		ordersDAO.InsertOrdersList(o,id,num,oi);
	}

	@Transactional
	public  Orders InsertOrders(Customer c) throws ParseException {
		Orders o = ordersDAO.InsertOrders(c);
		return o;
	}

	@Transactional
	public void RefuseOrders(int order_id) {
		ordersDAO.RefuseOrders(order_id);
	}

	@Transactional
	public void SuccessOrders(int order_id) {
		ordersDAO.SuccessOrders(order_id);
	}

	@Transactional
	public void DeleteShopCart(int order_id) {
		ordersDAO.DeleteShopCart(order_id);
	}

	

}
