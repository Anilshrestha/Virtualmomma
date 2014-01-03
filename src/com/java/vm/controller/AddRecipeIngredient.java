package com.java.vm.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.vm.service.UserDAO;

/**
 * Servlet implementation class AddIngredient
 */
@WebServlet("/AddRecipeIngredient")
public class AddRecipeIngredient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRecipeIngredient() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO udao = new UserDAO();
		String recipename=request.getParameter("recipeName");
		String add = request.getParameter("Add");
		String share = request.getParameter("Share");
		int userid = Integer.parseInt(request.getParameter("id"));
		
		int recipeid =udao.findRecipeId(recipename,userid);
		
		String description = request.getParameter("description");
		String status = request.getParameter("status");
		String unit = request.getParameter("category");
		
		String addingredient = request.getParameter("AddIngredient");
		
		if(add !=null){
			
			udao.test(recipename,userid,description,status);
			request.setAttribute("successmsg","Added Successfully" );
			request.setAttribute("recipeName",recipename );
			request.getRequestDispatcher("/jsp/Recipe.jsp").forward(request, response);
			
		}
		
		else if(addingredient !=null ){
		String ingredientName=request.getParameter("ingredientName");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
			udao.insingredient(ingredientName,quantity,recipeid,unit);
			request.setAttribute("successmsg","Added Successfully" );
			request.getRequestDispatcher("/jsp/recipe.jsp").forward(request, response);
		}
		else if(share != null){
			udao.recipeshare(recipeid,userid);
			request.setAttribute("successsharedmsg","Shared Successfully" );
			request.getRequestDispatcher("/jsp/test.jsp").forward(request, response);
		}
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO udao = new UserDAO();
		String recName=request.getParameter("recipeName");
		System.out.println("recipe name="+recName);
		String ingdtName = request.getParameter("ingredientName");
		String unt = request.getParameter("category");
		String desc=request.getParameter("description");
		String stat = request.getParameter("status");
		String uid = (request.getParameter("userid"));
		
		String addToList = request.getParameter("AddIngredients");
		String add = request.getParameter("Add");
		if(addToList != null){
			try {
				
				udao.insertIngredients(ingdtName,unt);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		else if(add != null){
			
			udao.insertRecipe(recName,stat,Integer.parseInt(uid),desc);
			
		}	}

}
