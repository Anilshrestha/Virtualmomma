package com.java.vm.model;

public class Recipe {
	private int recipeId;
	/**
	 * @return the recipeId
	 */
	public int getRecipeId() {
		return recipeId;
	}
	/**
	 * @param recipeId the recipeId to set
	 */
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
	/**
	 * @return the recipeName
	 */
	public String getRecipeName() {
		return recipeName;
	}
	/**
	 * @param recipeName the recipeName to set
	 */
	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}
	/**
	 * @return the recipeStatus
	 */
	public String getRecipeStatus() {
		return recipeStatus;
	}
	/**
	 * @param recipeStatus the recipeStatus to set
	 */
	public void setRecipeStatus(String recipeStatus) {
		this.recipeStatus = recipeStatus;
	}
	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	private String recipeName;
	private String recipeStatus;
	private int userId;
	private String description;

}
