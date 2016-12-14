package com.buaa.springmvc.dao;

public class User {

	private String userName;
	private String psswd;

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPsswd() {
		return psswd;
	}
	public void setPsswd(String psswd) {
		this.psswd = psswd;
	}
	public String toString(){
		return "User {"+userName+", "+psswd+"}";
	}


}
