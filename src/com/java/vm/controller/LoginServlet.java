package com.java.vm.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.vm.model.Recipe;
import com.java.vm.model.UserBean;
import com.java.vm.service.UserDAO;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO udao = new UserDAO();
       Random random = new Random();
       int max = 10;
       int min = 1;
//       int randomNumber = 1+(int)Math.random()*((max-min)+1);
       int randomId =2;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			OutputStream out = response.getOutputStream();
			List<Recipe> recipe = udao.returnRecipe();
//			List<RecipeImage>recipeImage= udao.returnRecipeImage(randomId);
			List<Blob>recipeImage= udao.returnRecipeImage(randomId);
			for (Blob image : recipeImage) {
				  response.setContentType("image/gif");
	    		  InputStream in = image.getBinaryStream();
	    		  int length = (int) image.length();
	    		  int bufferSize = 1024;
	    		  byte[] buffer = new byte[bufferSize];
	    		  while ((length = in.read(buffer)) != -1) {
	    		  out.write(buffer, 0, length);
	    		  }
	    		  in.close();
	    		  out.flush();
				
				
			}
			
			
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
//				request.setAttribute("recipeList", recipe);
//				request.setAttribute("recipeImageList",recipeImage);
//				response.sendRedirect("cssScript.jsp");
				request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
				
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
