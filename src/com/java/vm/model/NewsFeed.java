package com.java.vm.model;

import java.util.Date;

public class NewsFeed {
	private String username;
	private String recipename;
	private String imagename;
	private String invitationType;
	private String recipeNameChoosen;
	private Date invitationSentDate;
	private String invitationForDate;
	
	private int imageid;
	private int recipeid;
	private int friendid;
	private int userid;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getImageid() {
		return imageid;
	}
	public void setImageid(int imageid) {
		this.imageid = imageid;
	}
	public int getRecipeid() {
		return recipeid;
	}
	public void setRecipeid(int recipeid) {
		this.recipeid = recipeid;
	}
	public int getFriendid() {
		return friendid;
	}
	public void setFriendid(int friendid) {
		this.friendid = friendid;
	}
	
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	
	public String getInvitationForDate() {
		return invitationForDate;
	}
	
	public void setInvitationForDate(String invitationForDate) {
		System.out.println("date="+invitationForDate);
		this.invitationForDate = invitationForDate;
	}
	public String getRecipeNameChoosen() {
		return recipeNameChoosen;
	}
	public void setRecipeNameChoosen(String recipeNameChoosen) {
		this.recipeNameChoosen = recipeNameChoosen;
	}
}
