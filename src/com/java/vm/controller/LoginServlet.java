package com.java.vm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			
			
			
//			List<RecipeImage>recipeImage= udao.returnRecipeImage(randomId);
			//List<RecipeImage>recipeName= udao.returnRecipeName(randomId);
//			List<String>rName= udao.returnRName(randomId);
			
			String q1 = request.getParameter("submitLogin");
			if(q1 !=null){
				UserBean user = new UserBean();
				user.setEmail(request.getParameter("email"));
				user.setPassword(request.getParameter("password"));
				
				user = UserDAO.login(user);
//				request.setAttribute("recipeImageList",recipeImage);
				
				if(user.isValid()) {
					HttpSession session = request.getSession(true);
					session.setAttribute("currentSessionUser", user);
					request.getRequestDispatcher("/jsp/userLogged.jsp").forward(request, response);
				}
			}else{
	    			r.add(1);
   			       r.add(2);
			       r.add(3);
				for (Integer a : r) {
					Map<String,List<String>> recipe = udao.returnRecipe(a);
					request.setAttribute("recipeList", recipe);
					
					
				}
				request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
				
				
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
