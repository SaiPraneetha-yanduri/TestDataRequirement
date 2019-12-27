package com.example.bean;

import java.io.Serializable;

public class RegisterBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username,teamname,lobname,password,confirmpassword;  
	
	public String getUsername() {  
	    return username;  
	}  
	public void setUsername(String username) {  
	    this.username = username;  
	}  
	public String getPassword() {  
	    return password;  
	}  
	public void setPassword(String password) {  
	    this.password = password;  
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getLobname() {
		return lobname;
	}
	public void setLobname(String lobname) {
		this.lobname = lobname;
	}
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}  

}
