﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, java.util.List, recommend.*, dbHandling.*" %>
<% 

	String id;
	if((String)session.getAttribute("ID")==null){
		id = "";
		RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp?STATUS=UNKNOWN");
		dispatcher.forward(request, response);
	}
	else{
		id = (String)session.getAttribute("ID");
	}
	DBHandler dbHandler = new DBHandler();
	//dbHandler.setData();
	Recommender recommender = new Recommender(); 
	ArrayList<MovieInfo> movieInfos = dbHandler.getDataList();
	List<RecommendInfo> list = new ArrayList<>();
	recommender.initMovieSet(movieInfos);

	//강제로 data 넣을 때 사용
	/* for(int i=0;i<100;i++){
		if(movieInfos.get(i).getMovieData().getRepGenreNm().equals("액션")){
			//recommender.setRate(id, movieInfos.get(i).getMovieData().getMovieCd(), 4.5);
			dbHandler.addEval(id, movieInfos.get(i).getMovieData().getMovieCd(), "4.5", "");
		}
		else if(movieInfos.get(i).getMovieData().getRepGenreNm().equals("어드벤처")){
			//recommender.setRate(id, movieInfos.get(i).getMovieData().getMovieCd(), 4.9);
			dbHandler.addEval(id, movieInfos.get(i).getMovieData().getMovieCd(), "4.9", "");
		}
		else if(movieInfos.get(i).getMovieData().getRepGenreNm().equals("판타지")){
			dbHandler.addEval(id, movieInfos.get(i).getMovieData().getMovieCd(), "0.5", "");
		}
		else if(movieInfos.get(i).getMovieData().getRepGenreNm().equals("기티")){
			//recommender.setRate(id, movieInfos.get(i).getMovieData().getMovieCd(), 1.5);
			dbHandler.addEval(id, movieInfos.get(i).getMovieData().getMovieCd(), "1.5", "");
		}
		else{
			//recommender.setRate(id, movieInfos.get(i).getMovieData().getMovieCd(), 3);
			dbHandler.addEval(id, movieInfos.get(i).getMovieData().getMovieCd(), "3", "");
		}
	} */
	list = recommender.getRecommend(id);	

	for(int i=0;i<list.size();i++)
		session.setAttribute("recommend_"+i, list.get(i).getCd());

	response.sendRedirect("RecommendList.jsp?page=0");
%>