package com.hrbust.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.stereotype.Repository;

import com.hrbust.DB.DruidDB;
import com.hrbust.models.Attent;
import com.hrbust.models.User;
@Repository
public class UserDAOImpl  implements IUserDAO{

	@Override
	public User selectByPrimaryKey(String userID) {
		// TODO Auto-generated method stub
		User u=null;
		try {
			String sql="select * from user where userid=?";
			Connection conn=DruidDB.getInstance().getConnection();
			java.sql.PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				u=new User();
				u.setUserID(rs.getString("userid"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		try {
			String sql="insert into user (userid,password,name,tel,address,age,picpath)"+
					"values(?,?,?,?,?,?,?)";
			Connection conn=DruidDB.getInstance().getConnection();
			java.sql.PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getTel());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getAge());
			pstmt.setString(7, user.getPicpath());
			return pstmt.executeUpdate();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		User u=null;
		try {
			String sql="select * from user where userid=? and password=?";
			Connection conn=DruidDB.getInstance().getConnection();
			java.sql.PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getPassword());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				u=new User();
				u.setName(rs.getString("name"));
				u.setUserID(rs.getString("userid"));
				u.setPassword(rs.getString("password"));
				u.setAge(rs.getString("age"));
				u.setAddress(rs.getString("address"));
				u.setTel(rs.getString("tel"));
				u.setPicpath(rs.getString("picpath"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public void signIn(String userID) {
		// TODO Auto-generated method stub
		try {
			String sql="insert into attent (userid,signintime,workday) values(?, DATE_FORMAT(now(),'%h:%m:%s')  ,  DATE_FORMAT(now(),'%Y-%m-%d')  )";
			Connection conn=DruidDB.getInstance().getConnection();
			java.sql.PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void signout(String userID) {
		// TODO Auto-generated method stub
		try {
			String sql="update attent set signouttime=DATE_FORMAT(now(),'%h:%m:%s') where userID=? and workDay=DATE_FORMAT(now(),'%Y-%m-%d') ";
			Connection conn=DruidDB.getInstance().getConnection();
			java.sql.PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Attent queryAttent(String userID) {
		// TODO Auto-generated method stub
		Attent a=null;
		try {
			String sql="select * from attent where userid=? and workDay=DATE_FORMAT(now(),'%Y-%m-%d') ";
			Connection conn=DruidDB.getInstance().getConnection();
			java.sql.PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				a=new Attent();
				a.setSignInTime(rs.getString("signintime"));
				a.setSignOutTime(rs.getString("signouttime"));
				a.setWorkDay(rs.getString("workDay"));
			}
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}


}
