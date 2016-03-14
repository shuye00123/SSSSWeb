package com.SSSSWeb.model.business.service;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import com.SSSSWeb.model.business.dao.UserDAO;
import com.SSSSWeb.model.domain.User;


public class UserService {
	private UserDAO userDAO;

	public void setUserdao(UserDAO userdao) {
		this.userDAO = userdao;
	}
	@Transactional
	public int insertUser(User user) {
		int i;
		i=userDAO.insertUser(user);
		return i;
	}
	@Transactional
	public void updateUser(User user) {
		userDAO.updateUser(user);
	}
	@Transactional
	public User checkUser(User user) {
		user=userDAO.CheckUser(user);
		return user;
	}
	@Transactional
	public void ChangePsw(User user) {
		userDAO.ChangePsw(user);
		
	}
	@Transactional
	public void DeleteUser(User user){
		userDAO.DeleteUser(user);
	}
	@Transactional
	public ArrayList<User> SelectAllUser(){
		ArrayList list = userDAO.selectAllUser();
		ArrayList resultList = new ArrayList();
		for(int i=0;i<list.size();i++){
			Object[] obj = (Object[]) list.get(i);
			User u = new User();
			u.setUserid(Integer.valueOf(obj[0].toString()));
			u.setUsername(obj[1].toString());
			u.setPassword(obj[2].toString());
			u.setUsex(obj[3].toString());
			u.setDepartment(obj[4].toString());
			u.setPost(obj[5].toString());
			resultList.add(u);
		}
		return resultList;
	}
	@Transactional
	public ArrayList<User> SelectUser(String name){
		ArrayList list = userDAO.selectUser(name);
		ArrayList resultList = new ArrayList();
		for(int i=0;i<list.size();i++){
			Object[] obj = (Object[]) list.get(i);
			User u = new User();
			u.setUserid(Integer.valueOf(obj[0].toString()));
			u.setUsername(obj[1].toString());
			u.setPassword(obj[2].toString());
			u.setUsex(obj[3].toString());
			u.setDepartment(obj[4].toString());
			u.setPost(obj[5].toString());
			resultList.add(u);
		}
		return resultList;
	}
}
