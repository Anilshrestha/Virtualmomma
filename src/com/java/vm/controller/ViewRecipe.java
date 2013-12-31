package com.java.vm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.vm.model.Ingredient;
import com.java.vm.model.Recipe;
import com.java.vm.service.UserDAO;

/**
 * Servlet implementation class ViewRecipe
 */
@WebServlet("/ViewRecipe")
public class ViewRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public int imageid = 0;
	UserDAO udao = new UserDAO();
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewRecipe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			imageid = Integer.parseInt(request.getParameter("imageid"));
				
			List<Ingredient> ingredients = udao.showIngredient(imageid);
			List<Recipe> recipeDes = udao.showRecipe(imageid);
			request.setAttribute("ingredientList", ingredients);
			request.setAttribute("recipe",recipeDes);
			request.getRequestDispatcher("/jsp/showRecipe.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
