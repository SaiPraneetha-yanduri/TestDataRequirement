package com.example.bean;

import java.io.Serializable;

public class DataBeanPojo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String ExtID;
	private String IntID;
	private String cardTypeID;
	private String MinID;
	private String MaxID;
	private String APIReq;
	public String getExtID() {
		return ExtID;
	}
	public void setExtID(String extID) {
		ExtID = extID;
	}
	public String getIntID() {
		return IntID;
	}
	public void setIntID(String intID) {
		IntID = intID;
	}
	public String getCardTypeID() {
		return cardTypeID;
	}
	public void setCardTypeID(String cardTypeID) {
		this.cardTypeID = cardTypeID;
	}
	public String getMinID() {
		return MinID;
	}
	public void setMinID(String minID) {
		MinID = minID;
	}
	public String getMaxID() {
		return MaxID;
	}
	public void setMaxID(String maxID) {
		MaxID = maxID;
	}
	public String getAPIReq() {
		return APIReq;
	}
	public void setAPIReq(String aPIReq) {
		APIReq = aPIReq;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
