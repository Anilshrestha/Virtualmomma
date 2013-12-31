package com.java.vm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.vm.model.Recipe;
import com.java.vm.service.UserDAO;

/**
 * Servlet implementation class UserLogged
 */
@WebServlet("/UserLogged")
public class UserLogged extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO udao = new UserDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogged() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String add_recipe = request.getParameter("AddRecipe");
		String invite = request.getParameter("Invite");
		String favorite = request.getParameter("favorite");
		
		String logout = request.getParameter("logout");
		
		
		if(logout !=null){
			
		}
		
		if( add_recipe !=null){
			request.getRequestDispatcher("/jsp/recipe.jsp").forward(request, response);
		} 
		else if(invite != null){
			request.getRequestDispatcher("/jsp/invite.jsp").forward(request, response);
		}
		else if(favorite != null){
			int userid = Integer.parseInt(request.getParameter("newsfeed"));
			List<Recipe> recipes = udao.showFavoriteRecipe(userid);
			request.setAttribute("recipes", recipes);
			request.getRequestDispatcher("/jsp/favorite.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
