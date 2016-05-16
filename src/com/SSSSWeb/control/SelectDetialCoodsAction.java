package com.SSSSWeb.control;

import java.util.List;

import com.SSSSWeb.model.business.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

public class SelectDetialCoodsAction extends ActionSupport{
	private GoodsService gs;
	private int id;
	private List list;
	

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public GoodsService getGs() {
		return gs;
	}

	public void setGs(GoodsService gs) {
		this.gs = gs;
	}

	@Override
	public String execute() throws Exception {
		list = gs.SelectDetialGoods(id);
		return "success";
	}
}