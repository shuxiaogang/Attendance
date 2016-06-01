package com.hrbust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hrbust.DAO.IUserDAO;
import com.hrbust.DAO.UserDAOImpl;
import com.hrbust.models.Attent;
import com.hrbust.models.User;

@Service
public class UserServiceImpl implements IUserService{
	@Autowired
	private IUserDAO dao;
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return dao.addUser(user);
	}
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return dao.login(user);
	}
	@Override
	public User selectByPrimaryKey(String userID) {
		// TODO Auto-generated method stub
		return dao.selectByPrimaryKey(userID);
	}
	@Override
	public void signIn(String userID) {
		// TODO Auto-generated method stub
		dao.signIn(userID);
	}
	@Override
	public void signout(String userID) {
		// TODO Auto-generated method stub
		dao.signout(userID);
	}
	@Override
	public Attent queryAttent(String userID) {
		// TODO Auto-generated method stub
		return dao.queryAttent(userID);
	}

	
}
