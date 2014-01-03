package com.java.vm.model;

import java.util.Date;

public class Invitation {
	private int userid;
	private int friendid;
	private String recipename;
	private String invitationType;
	private Date invitationSentDate;
	private Date invitationForDate;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getFriendid() {
		return friendid;
	}
	public void setFriendid(int friendid) {
		this.friendid = friendid;
	}
	public String getRecipename() {
		return recipename;
	}
	public void setRecipename(String recipename) {
		this.recipename = recipename;
	}
	public String getInvitationType() {
		return invitationType;
	}
	public void setInvitationType(String invitationType) {
		this.invitationType = invitationType;
	}
	public Date getInvitationSentDate() {
		return invitationSentDate;
	}
	public void setInvitationSentDate(Date invitationSentDate) {
		this.invitationSentDate = invitationSentDate;
	}
	public Date getInvitationForDate() {
		return invitationForDate;
	}
	public void setInvitationForDate(Date invitationForDate) {
		this.invitationForDate = invitationForDate;
	}
	
	

}
