package com.hrbust.DAO;

import java.util.List;

import com.hrbust.models.Attent;
import com.hrbust.models.User;

public interface IUserDAO {
	public User selectByPrimaryKey(String userID);
	public int addUser(User user);
	public User login(User user);
	public void signIn(String userID);
	public void signout(String userID);
	public Attent queryAttent(String userID);
}
