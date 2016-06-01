package com.hrbust.service;

import java.util.List;

import com.hrbust.models.Attent;
import com.hrbust.models.User;

public interface IUserService {
	public int addUser(User user);
	public User login(User user);
	public User selectByPrimaryKey(String userID);
	public void signIn(String userID);
	public void signout(String userID);
	public Attent queryAttent(String userID);
}
