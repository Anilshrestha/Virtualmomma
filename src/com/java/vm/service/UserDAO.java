package com.java.vm.service;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.java.vm.model.Recipe;
import com.java.vm.model.UserBean;

public class UserDAO {
	static Connection currentCon = null;
	static ResultSet rs = null;
	
	
	public static UserBean login(UserBean bean){
		PreparedStatement ps=null;
		String username = bean.getEmail();
		String password = bean.getPassword();

		try {
			currentCon = ConnectionManager.getConnection();
			ps = currentCon.prepareStatement("select * from user where email=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			
			boolean more = rs.next();
			
			if(!more) {
				System.out.println("Sorry you are not a registerd user! Please sign up first");
				bean.setValid(false);
			}
			
			else if(more) {
				String firstName = rs.getString("fName");
				String lastName = rs.getString("lName");
				
				//System.out.println("Welcome" + firstName);
				bean.setfName(firstName);
				bean.setlName(lastName);
				bean.setValid(true);
						
						
			}
		} catch (Exception e) {
			System.out.println("Login failed");
			e.printStackTrace();
		}
		finally {
			 if (rs != null)	{
		            try {
		               rs.close();
		            } catch (Exception e) {}
		               rs = null;
		            }
			
		         if (ps != null) {
		            try {
		               ps.close();
		            } catch (Exception e) {}
		               ps = null;
		            }
			
		         if (currentCon != null) {
		            try {
		               currentCon.close();
		            } catch (Exception e) {
		            	currentCon = null;
		            }

		            
		         }
			
		}
		return bean;
	}

	public List<Recipe> returnRecipe(){
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		List<Recipe> recipe = new ArrayList<>();
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			st = conn.createStatement();
			resultSet = st.executeQuery("select * from recipe");
			
			while(resultSet.next()){
				Recipe recipes = new Recipe();
				recipes.setRecipeId(resultSet.getInt("recipeId"));
				recipes.setRecipeName(resultSet.getString("recipeName"));
				recipes.setRecipeStatus(resultSet.getString("recipeStatus"));
				recipes.setUserId(resultSet.getInt("userId"));
				recipes.setDescription(resultSet.getString("description"));
				recipe.add(recipes);
			}
			resultSet.close();
			st.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recipe;
	}

	public List<Blob> returnRecipeImage(int randomId){
		Blob image = null;
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		List<Blob> recipeImage = new ArrayList<>();
//		OutputStream out =null;
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			st = conn.createStatement();
			System.out.println("upto here");
			resultSet = st.executeQuery("select image from recipeimage where  imageId = '2'");
			if (rs.next()) {
	    		  image = rs.getBlob(1);
	    		  recipeImage.add(image);
	    		  }

		} catch (Exception e) {
			e.printStackTrace();
		}
		return recipeImage;
	}



}
