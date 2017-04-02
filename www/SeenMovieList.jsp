﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dbHandling.*, recommend.MovieInfo" %>
    
<%
	String strPage = request.getParameter("page");
System.out.println(strPage);
	int PAGE = Integer.parseInt(strPage);
	DBHandler dbHandler = new DBHandler();
%>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

</head>
<body>
    <div class="container">
        <div>
            <h1>내가 본 영화 리스트</h1>
	            <div class="row">
	            <%
	        	for(int i = PAGE*6; i<(PAGE+1)*6 && session.getAttribute("seen_"+i)!=null;i++){
	                String movieCd = (String)session.getAttribute("seen_"+i);
	                MovieInfo info = dbHandler.getData(movieCd);
	        		out.println("<div class='col-sm-6 col-md-4'>");
	        		out.println("<div class='thumbnail'>");
	        		out.println("<img src='"+info.getURL()+"' alt='포스터 없음' style='max-width: auto; height: 400px;'>");
	        		out.println("<div class='caption'>");
	        		out.println("<h3 class='text'>"+info.getMovieName()+"</h3>");
	        		out.println("<h4 class='text'>-"+info.getMovieNameEn()+"</h4>");
	        		out.println("<p>장르: "+info.getGenre()+"</p>");
	        		out.println("<p>국가: "+info.getNation()+"</p>");
	        		out.println("<p>개봉일: "+info.getOpenYr()+"</p>");
	        		out.println("<p id = "+movieCd+"_rate><button class='btn btn-primary'>평점</button>" 
	        				+"<a href='#' class='btn btn-default' role='button'>후기남기기</a>"
	        				+"<a href='RecommendMovie.jsp?MovieCd="+movieCd+"&page="+PAGE+"' class='btn btn-default' role='button'>추천하기</a></p>");
	        		out.println("</div></div></div>");
	        	}
	            %>
	        	</div>
            <ul class="pager">
            	<%
            	if(1<=PAGE)
	        		out.println("<li class='previous'><a href='SeenMovieList.jsp?page="+(PAGE-1)+"'><span aria-hidden='true'>&larr;</span> Older</a></li>");
            	if(session.getAttribute("seen_"+(PAGE+1)*6)!=null)
            		out.println("<li class='next'><a href='SeenMovieList.jsp?page="+(PAGE+1)+"'>Newer <span aria-hidden='true'>&rarr;</span></a></li>");
            	%> 
            </ul>
        </div>
    </div>
</body>
</html>