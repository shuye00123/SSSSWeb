package com.SSSSWeb.model.business.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.SSSSWeb.model.domain.Customer;
import com.SSSSWeb.model.domain.Orders;
import com.SSSSWeb.model.domain.Orders_Count;
import com.SSSSWeb.model.domain.Orders_Info;
import com.SSSSWeb.model.domain.Orders_List;
import com.SSSSWeb.model.domain.Supplier;
import com.SSSSWeb.model.domain.Users;

public class OrdersDAO {
	private SessionFactory sf;
	
	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	public void InsertShopCart(Customer c,int id, int num) throws ParseException  {
		Session session = sf.openSession();
		String hql="from Orders  where  order_state='购物车' and customer_id = "+c.getCustomer_id();
		Query query=session.createQuery(hql);
		Orders o=(Orders)query.uniqueResult();
		if(o==null){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		o = new  Orders();
		o.setOrder_time(sdf.parse("0000-00-00 00:00:00"));
		o.setSend_time(sdf.parse("0000-00-00 00:00:00"));
		o.setSettle_time(sdf.parse("0000-00-00 00:00:00"));
		o.setOrder_state("购物车");
		o.setCustomer_id(c.getCustomer_id());
		session.save(o);
		}
		
		String sql = "from Orders_List where order_id= " +o.getOrder_id()+" and id= "+id ;
		Query q=session.createQuery(sql);
		Orders_List ol=(Orders_List)q.uniqueResult();
		if(ol==null){
			Orders_List l=new Orders_List();
			l.setId(id);
			l.setNum(num);
			l.setOrder_id(o.getOrder_id());
			session.save(l);
		}else{
			Transaction tx = session.beginTransaction(); 
			Orders_List oldo=(Orders_List)session.get(Orders_List.class, ol.getOrder_list_id());
			oldo.setNum(num+ol.getNum());
			tx.commit();
		}
		
		
		
		session.close();
	}

	public ArrayList<Orders_Count> SelectCount(Customer c) {
		Session session = sf.openSession();
		String hql= "select o.order_id,count(*) from Orders o,Orders_List t where o.order_id=t.order_id and o.customer_id =" + c.getCustomer_id() + " group by o.order_id "	;	
		Query query = session.createQuery(hql);
		ArrayList resultList = (ArrayList) query.list();
		session.close();
		return resultList;
	}
	
	public ArrayList<Orders_Info> SelectOrders(Customer c) {
		Session session = sf.openSession();
		String hql="select o.order_id,o.order_time,o.send_time,o.settle_time,o.order_state,o.customer_id,t.order_list_id,t.id,t.num,g.code,g.chn_name,g.eng_name,g.color,g.price,c.url " +
				" from Orders o,Orders_List t, GOODS_INF g, CAR_IMG_INF c " +
				" where o.order_id=t.order_id and g.id=t.id and c.goods_id=g.id and o.customer_id =" + c.getCustomer_id() +" and c.level = 1 and o.order_state!= '购物车'";
		Query query = session.createQuery(hql);
		ArrayList resultList = (ArrayList) query.list();
		session.close();
		return resultList;
	}

	public ArrayList<Orders_Info> SelectShopCart(Customer c) {
		Session session = sf.openSession();
		String hql="select o.order_id,o.order_time,o.send_time,o.settle_time,o.order_state,o.customer_id,t.order_list_id,t.id,t.num,g.code,g.chn_name,g.eng_name,g.color,g.price,c.url " +
				"from Orders o,Orders_List t, GOODS_INF g, CAR_IMG_INF c " +
				" where o.order_id=t.order_id and g.id=t.id and c.goods_id=g.id and o.customer_id = " + c.getCustomer_id() +" and c.level = 1 and o.order_state= '购物车'";
		Query query = session.createQuery(hql);
		ArrayList resultList = (ArrayList) query.list();
		session.close();
		return resultList;
	}

	public void InsertOrdersList(Orders o, int id,int num,int oi) throws ParseException  {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction(); 
		Orders_List su=(Orders_List) session.get(Orders_List.class, oi);
		session.delete(su);
		tx.commit();
		Orders_List l=new Orders_List();
		l.setId(id);
		l.setNum(num);
		l.setOrder_id(o.getOrder_id());
		session.save(l);
		session.close();
	}

	public Orders InsertOrders(Customer c) throws ParseException {
		Session session = sf.openSession();
		Orders o = new  Orders();
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		o.setOrder_time(date);
		o.setSend_time(sdf.parse("0000-00-00 00:00:00"));
		o.setSettle_time(sdf.parse("0000-00-00 00:00:00"));
		o.setOrder_state("待发货");
		o.setCustomer_id(c.getCustomer_id());
		session.save(o);
		return o;
	}
	

}
