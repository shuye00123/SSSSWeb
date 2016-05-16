package com.SSSSWeb.control;

import java.util.List;

import com.SSSSWeb.model.business.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

public class SelectGoodsAction extends ActionSupport {
	private GoodsService gs;
	private String chn_name;
	private List list;
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public String getChn_name() {
		return chn_name;
	}

	public void setChn_name(String chn_name) {
		this.chn_name = chn_name;
	}

	public GoodsService getGs() {
		return gs;
	}

	public void setGs(GoodsService gs) {
		this.gs = gs;
	}

	@Override
	public String execute() throws Exception {
		list=gs.SelectGoods(chn_name);
		return "success";
	}
}
