package com.hrbust.models;

public class Attent {
	private String attentid;
	private String userID;
	public String getAttentid() {
		return attentid;
	}
	public void setAttentid(String attentid) {
		this.attentid = attentid;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getSignInTime() {
		return signInTime;
	}
	public void setSignInTime(String signInTime) {
		this.signInTime = signInTime;
	}
	public String getSignOutTime() {
		return signOutTime;
	}
	public void setSignOutTime(String signOutTime) {
		this.signOutTime = signOutTime;
	}
	public String getWorkDay() {
		return workDay;
	}
	public void setWorkDay(String workDay) {
		this.workDay = workDay;
	}
	private String signInTime;
	private String signOutTime;
	private String workDay;
}
