﻿<%@page import="java.util.ArrayList"%>
<%@page import="dbHandling.DBHandler"%>
<%@page import="recommend.FriendRecommendInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id, PAGE;
	if((String)session.getAttribute("ID")==null){
		id = "";
		RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp?STATUS=UNKNOWN");
		dispatcher.forward(request, response);
	}
	else{
		id = (String)session.getAttribute("ID");
	}
		
	DBHandler dbHandler = new DBHandler();
	PAGE = request.getParameter("Friend");
	System.out.println(PAGE);
	ArrayList<FriendRecommendInfo> list = dbHandler.getFriendRecommend(PAGE);
   	System.out.println("!!!"+list.size());
	for(int i=0;i<list.size();i++){
    	System.out.println(i);
		session.setAttribute("friendRecommend_"+i, list.get(i).getMovieCd());
	}

	response.sendRedirect("FriendsList.jsp?page=0");
%>