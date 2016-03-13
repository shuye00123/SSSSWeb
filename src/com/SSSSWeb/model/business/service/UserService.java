package com.SSSSWeb.model.business.service;

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
}
