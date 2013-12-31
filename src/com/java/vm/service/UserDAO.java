package com.java.vm.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.java.vm.model.Ingredient;
import com.java.vm.model.NewsFeed;
import com.java.vm.model.Recipe;
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
				int id = rs.getInt("userid");
				
				bean.setfName(firstName);
				bean.setlName(lastName);
				bean.setUserid(id);
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

	public List<RecipeImage> returnRecipeImage(int[] arr){
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		List<RecipeImage> recipeImage = new ArrayList<>();
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			st = conn.createStatement();
			for (int i = 0; i < arr.length; i++) {
				resultSet = st.executeQuery("select imageid,imagename,recipeid from image where recipeid="+arr[i]);
				while(resultSet.next()){

					RecipeImage rimage = new RecipeImage();
					rimage.setImageid(resultSet.getInt("imageid"));
					rimage.setImagename(resultSet.getString("imagename"));
					
					recipeImage.add(rimage);
				}
				
				
			}
			resultSet.close();
			st.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recipeImage;
	}

	public List<Recipe> returnRecipeName(int[] arr){
		
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		List<Recipe> recipeName = new ArrayList<>();
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			st = conn.createStatement();
			for (int i = 0; i < arr.length; i++) {
				resultSet = st.executeQuery("select recipeid,recipename,userid from recipe where recipeid="+arr[i]);
			if (resultSet.next()) {
				Recipe recipe = new Recipe();
				recipe.setRecipeId(resultSet.getInt("recipeid"));
				recipe.setRecipeName(resultSet.getString("recipename"));
				
				recipeName.add(recipe);
	    		  }
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return recipeName;
	}

	public List<UserBean> returnUserName(int[] arr) {
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		List<UserBean> user = new ArrayList<>();
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			st = conn.createStatement();
			for (int i = 0; i < arr.length; i++) {
				resultSet = st.executeQuery("select U.fname,U.userid from user U inner join recipe R on U.userid=R.userid where R.recipeid="+arr[i]);
				while(resultSet.next()){
					UserBean users = new UserBean();
					users.setfName(resultSet.getString("fname"));
					users.setUserid(resultSet.getInt("userid"));
					user.add(users);
					
				}
				
				
			}
			resultSet.close();
			st.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;

	}

	public List<Recipe> showRecipe(int imageid) {
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		List<Recipe> recipes = new ArrayList<>();
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			st = conn.createStatement();
			
				resultSet = st.executeQuery("select R.description from recipe R inner join image I on R.recipeid=I.imageid where R.recipeid="+imageid);
				while(resultSet.next()){
					System.out.println("upto here");
					Recipe r = new Recipe();
					r.setDescription(resultSet.getString("description"));
					recipes.add(r);
					
				}
				
				
			
			resultSet.close();
			st.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recipes;


		
	}

	public List<Ingredient> showIngredient(int imageid) {
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		List<Ingredient> ingredients = new ArrayList<>();
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			st = conn.createStatement();
			
				resultSet = st.executeQuery("select * from ingredients where recipeid="+imageid);
				while(resultSet.next()){

					Ingredient ingredient = new Ingredient();
					ingredient.setIngredientid(resultSet.getInt("ingredientid"));
					ingredient.setIngredientname(resultSet.getString("ingredientname"));
					ingredient.setQuantity(resultSet.getInt("quantity"));
					ingredient.setUnit(resultSet.getString("unit"));
					ingredients.add(ingredient);
					
					
				}
				
				
			
			resultSet.close();
			st.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ingredients;


		
	}

	public void insertIngredients(String ingredientName,String unit) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";
		String query = "INSERT INTO ingredients(ingredientname,quantity,unit) VALUES(?,?,?)";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ingredientName);
			pstmt.setString(2, unit);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			conn.close();
		}
	}

	public void insertRecipe(String recipeName,String status,int userid,String description) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";
		String query = "INSERT INTO recipe(recipeName,recipestatus,userid,description) VALUES(?,?,?,?)";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, recipeName);
			pstmt.setString(2, status);
			pstmt.setInt(3, userid);
			pstmt.setString(4, description);
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
	}

	public void insertNewUser(String fname, String lname, String email,String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";
		String query = "INSERT INTO user(fname,lname,email,password) VALUES(?,?,?,?)";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fname);
			pstmt.setString(2, lname);
			pstmt.setString(3, email);
			pstmt.setString(4, password);
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public void test(String recipename, int id,String description,String status) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";
		String query = "INSERT INTO recipe(userid,recipename,description,recipestatus) VALUES(?,?,?,?)";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.setString(2, recipename);
			pstmt.setString(3, description);
			pstmt.setString(4, status);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public void insingredient(String ingredientName, int quantity,int recipeid,String unit) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";
		String query = "INSERT INTO ingredients(ingredientName,quantity,recipeid,unit) VALUES(?,?,?,?)";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ingredientName);
			pstmt.setInt(2,quantity);			
			pstmt.setInt(3,recipeid);
			pstmt.setString(4,unit);
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
	}

	public int findRecipeId(String recipename,int id) {
		Connection conn = null;
		ResultSet resultSet = null;
		Statement st =null;
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";
		int recipeid =0;
		String query = "select recipeid from recipe where userid='" + id +"' and recipename='" + recipename + "'";
		

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			st = conn.createStatement();
			resultSet = st.executeQuery(query);
			while(resultSet.next()){
				
				recipeid = resultSet.getInt("recipeid");
				System.out.println("inside resultset recipeid="+recipeid);
			}
			 resultSet.close();
			 st.close();
			 conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recipeid;

		
	}

	public void recipeshare(int recipeid, int userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";
		String query = "INSERT INTO sharedrecipe(recipeid,userid) VALUES(?,?)";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, recipeid);
			pstmt.setInt(2,userid);			
			pstmt.executeUpdate();

			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
	}


	public List<NewsFeed> getIdNewsFeed(int newsFeedId) {
		List<NewsFeed> newsFeed = new ArrayList<>();
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";
		
		String query = "select R.recipeid,R.recipename,F.fname,U.userid,I.imagename,I.imageid,U.friendid from userfriends U inner join sharedrecipe S on U.friendid = S.userid inner join recipe R on S.userid=R.userid and S.recipeid=R.recipeid inner join user F on F.userid = R.userid inner join image I on I.imageid=R.recipeid where U.userid="+newsFeedId;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			st = conn.createStatement();
			resultSet = st.executeQuery(query);
			while(resultSet.next()){
				NewsFeed nfeed = new NewsFeed();
				nfeed.setRecipename(resultSet.getString("recipename"));
				nfeed.setUsername(resultSet.getString("fname"));
				nfeed.setImagename(resultSet.getString("imagename"));
				nfeed.setFriendid(resultSet.getInt("recipeid"));
				nfeed.setImageid(resultSet.getInt("imageid"));
				nfeed.setFriendid(resultSet.getInt("friendid"));
				nfeed.setRecipeid(resultSet.getInt("recipeid"));
				nfeed.setUserid(resultSet.getInt("userid"));
				
				newsFeed.add(nfeed);
			}
			 resultSet.close();
			 st.close();
			 conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return newsFeed;
		

	}

	public void favoriteRecipe(int recipeid, int friendid, int userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";
		String query = "INSERT INTO favoriterecipe(recipeid,friendid,userid) VALUES(?,?,?)";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, recipeid);
			pstmt.setInt(2,friendid);	
			pstmt.setInt(3, userid);
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public List<Recipe> showFavoriteRecipe(int userid) {
		List<Recipe> recipe = new ArrayList<>();
		Connection conn = null;
		Statement st = null;
		ResultSet resultSet = null;
		
		final String DB_URL = "jdbc:mysql://localhost:3306/javaproject";
		
		final String USER = "root";
		final String PASS = "mysql";
		
		String query = "select R.recipename,E.recipeid from favoriterecipe E inner join recipe R on R.recipeid = E.recipeid where E.userid ="+userid; 
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
			st = conn.createStatement();
			resultSet = st.executeQuery(query);
			while(resultSet.next()){
				Recipe recipes = new Recipe();
				recipes.setRecipeName(resultSet.getString("recipename"));
				recipes.setRecipeId(resultSet.getInt("recipeid"));
				
				recipe.add(recipes);
			}
			 resultSet.close();
			 st.close();
			 conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return recipe;
		
	}

}
