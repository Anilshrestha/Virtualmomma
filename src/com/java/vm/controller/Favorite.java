package com.java.vm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.vm.model.NewsFeed;
import com.java.vm.service.UserDAO;

/**
 * Servlet implementation class Favorite
 */
@WebServlet("/Favorite")
public class Favorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Favorite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserDAO udao = new UserDAO();
		
		int recipeid = Integer.parseInt(request.getParameter("recipeid"));
		int friendid = Integer.parseInt(request.getParameter("friendid"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		
		
		udao.favoriteRecipe(recipeid,friendid,userid);
		
		List<NewsFeed>names = udao.getIdNewsFeed(userid);
		request.setAttribute("map", names);
		
		request.getRequestDispatcher("/jsp/userLogged.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
