package com.java.vm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.vm.model.Recipe;
import com.java.vm.model.UserBean;
import com.java.vm.service.UserDAO;

/**
 * Servlet implementation class Invite
 */
@WebServlet("/Invite")
public class Invite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Invite() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO udao = new UserDAO();
		Date today = new Date();
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");
		String todayDate = dformat.format(today);
		System.out.println(todayDate);
		
		int userid = Integer.parseInt(request.getParameter("id"));

		String[] friendid = request.getParameterValues("friendid");
		String invitationTypeChoosen = request.getParameter("invitationType");
		String recipeNameChoosen = request.getParameter("recipeName");
		String invitationDate = request.getParameter("invitationDate");
		System.out.println("invitationDate:"+invitationDate);
		String[] checkbox = request.getParameterValues("checkbox");
		String invite= request.getParameter("invite");
		
		if(invite!=null){
			
			for(int i=0;i<checkbox.length;i++){
					
				if(checkbox[i].equals("on")){
					udao.storeInvitation(userid,friendid[i],invitationTypeChoosen,recipeNameChoosen,todayDate,invitationDate);
				}
			}
			
			List<Recipe> recipes = udao.showUserAddedRecipe(userid);
			List<UserBean> userFriends = udao.retrieveUserFriends(userid);
			request.setAttribute("availableRecipe", recipes);
			request.setAttribute("userFriends", userFriends);
			request.getRequestDispatcher("/jsp/invite.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
