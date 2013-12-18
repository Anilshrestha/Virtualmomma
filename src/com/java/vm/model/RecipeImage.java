package com.java.vm.model;

import java.sql.Blob;






public class RecipeImage {
	public int imageId;
	public String imageName;
	public Blob image;
	/**
	 * @return the image
	 */
	public Blob getImage() {
		return image;
	}
	/**
	 * @param image the image to set
	 */
	public void setImage(Blob image) {
		this.image = image;
	}
	/**
	 * @return the imageId
	 */
	public int getImageId() {
		return imageId;
	}
	/**
	 * @param imageId the imageId to set
	 */
	public void setImageId(int imageId) {
		this.imageId = imageId;
	}
	/**
	 * @return the imageName
	 */
	public String getImageName() {
		return imageName;
	}
	/**
	 * @param imageName the imageName to set
	 */
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	

}
