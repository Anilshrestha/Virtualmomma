package com.java.vm.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.java.vm.model.RecipeImage;
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

	public Map<String,List<String>> returnRecipe(Integer a){
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		Map<String,List<String>> recipe = new HashMap<>();
		List<String> info = new ArrayList<>();
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";

		try {
			System.out.println("a="+a);
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			st = conn.createStatement();
//			resultSet = st.executeQuery("select * from recipe");
			resultSet = st.executeQuery("select U.fname,R.recipename,I.imagename from user U inner join recipe R on U.userid = R.userid inner join image I on R.userid = I.imageid where U.userid="+a);
			
			while(resultSet.next()){
//				Recipe recipes = new Recipe();
//				recipes.setRecipeId(resultSet.getInt("recipeid"));
//				recipes.setRecipeName(resultSet.getString("recipename"));
//				recipes.setRecipeStatus(resultSet.getString("recipestatuse"));
//				recipes.setUserId(resultSet.getInt("userid"));
//				recipes.setDescription(resultSet.getString("description"));
//				user.setfName(resultSet.getString("fname"));
//				recipe.add(recipes);
				
				
				String iName = resultSet.getString("imagename");
				String rName = resultSet.getString("recipename");
				String uName = resultSet.getString("fname");
				
				info.add(uName);
				info.add(rName);
				
				
				recipe.put(iName,info);
			}
			resultSet.close();
			st.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recipe;
	}

	public List<RecipeImage> returnRecipeName(int randomId){
		
		
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		List<RecipeImage> recipeImageName = new ArrayList<>();
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			st = conn.createStatement();
			System.out.println("upto here");
			resultSet = st.executeQuery("select imagename from image where  imageid = '1'");
			if (resultSet.next()) {
				RecipeImage imageRecipe = new RecipeImage();
				System.out.println("inside recipeName method");
//				imageRecipe.setImageid(resultSet.getInt("imageid"));
				imageRecipe.setImagename(resultSet.getString("imagename"));
	    		  recipeImageName.add(imageRecipe);
				
	    		  }

		} catch (Exception e) {
			e.printStackTrace();
		}
		return recipeImageName;
	}
	




}
