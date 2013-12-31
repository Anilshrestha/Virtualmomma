package com.java.vm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.vm.model.NewsFeed;
import com.java.vm.model.Recipe;
import com.java.vm.model.RecipeImage;
import com.java.vm.model.UserBean;
import com.java.vm.service.UserDAO;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO udao = new UserDAO();
       Random random = new Random();
       int max = 10;
       int min = 1;
//       int randomNumber = 1+(int)Math.random()*((max-min)+1);
       
       List<Integer> r = new ArrayList<Integer>();
       
       
       
       
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String login = request.getParameter("submitLogin");
			String signup = request.getParameter("signup");
			
			if(login !=null){
				UserBean user = new UserBean();
				user.setEmail(request.getParameter("email"));
				user.setPassword(request.getParameter("password"));
				
				user = UserDAO.login(user);
				
				if(user.isValid()) {
					HttpSession session = request.getSession();
					session.setAttribute("currentSessionUser", user);
					
					int newsFeedId = user.getUserid();
					System.out.println("newsfeedid="+newsFeedId);
					
					List<NewsFeed>names = udao.getIdNewsFeed(newsFeedId);
					
						  request.setAttribute("map", names);
						
						  request.getRequestDispatcher("/jsp/userLogged.jsp").forward(request, response);
						  
				}
				
			}else if(signup != null){
				String fname=request.getParameter("FName");
				String lname=request.getParameter("LName");
				String email=request.getParameter("useremail");
				String password=request.getParameter("userpassword");
				
				try {
					udao.insertNewUser(fname,lname,email,password);
					response.sendRedirect("/VirtualMomma/index");
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			else{
	    			
			       int[] arr ={1,2,3,4,5,6,7,8,9,10,11,12,20,19,18};
				
			       List<RecipeImage> recipe = udao.returnRecipeImage(arr);
			       List<UserBean> user = udao.returnUserName(arr);
			       List<Recipe>recipeName= udao.returnRecipeName(arr);
			       
			       request.setAttribute("imageList", recipe);
			       request.setAttribute("userList", user);
			       request.setAttribute("recipeList", recipeName);
			       
			       request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
