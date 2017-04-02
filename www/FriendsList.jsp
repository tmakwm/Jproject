﻿<%@page import="java.util.ArrayList"%>
<%@page import="dbHandling.DBHandler, recommend.MovieInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String)session.getAttribute("ID");

	String strPage = (String)request.getParameter("page");
	int PAGE = Integer.parseInt(strPage);
	
	DBHandler dbHandler = new DBHandler();
	ArrayList<String> list = dbHandler.getFriends(id);
	
    %>
    <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js">
    </script>
</head>
<body>

    <div class="container">
        <div class="navbar nav-stacked"  style="width:20%; height: 300px; float:left">
        <form action="CheckFriendID.jsp">
        새 친구 ID 추가  <input type="text" name=FRIENDID> <input class="btn btn-primary" type="submit" value="추가">
        </form>
            <ul class="nav">
            <%
            for(int i=0;i<list.size();i++){
            	out.println("<li><a href='getFriendsMovie.jsp?Friend="+list.get(i)+"'>"+list.get(i)+"</a></li>");
            }
            %>
            </ul>
        </div>
        <div style="width:80%">
            <h1>친구의 추천 영화</h1>
            <div class="row">
            <%
            for(int i = PAGE*6; i<(PAGE+1)*6 && session.getAttribute("friendRecommend_"+i)!=null;i++){
                String movieCd = (String)session.getAttribute("friendRecommend_"+i);
                MovieInfo info = dbHandler.getData(movieCd);
            	System.out.println(movieCd);
        		out.println("<div class='col-sm-6 col-md-4'>");
        		out.println("<div class='thumbnail'>");
        		out.println("<img src='"+info.getURL()+"' alt='포스터 없음' style='max-width: auto; height: 400px;'>");
        		out.println("<div class='caption'>");
        		out.println("<h3 class='text'>"+info.getMovieName()+"</h3>");
        		out.println("<h4 class='text'>-"+info.getMovieNameEn()+"</h4>");
        		out.println("<p>장르: "+info.getGenre()+"</p>");
        		out.println("<p>국가: "+info.getNation()+"</p>");
        		out.println("<p>개봉일: "+info.getOpenYr()+"</p>");
        		out.println("<p id = "+movieCd+"_rate><button class='btn btn-primary' onclick='Rating("+movieCd+")'>평점</button> <a href='#' class='btn btn-default' role='button'>후기남기기</a></p>");
        		out.println("</div></div></div>");
        	}
            %>
            </div>
            <ul class="pager">
            <%
            	if(1<=PAGE)
	        		out.println("<li class='previous'><a href='FriendsList.jsp?page="+(PAGE-1)+"'><span aria-hidden='true'>&larr;</span> Older</a></li>");
            	if(session.getAttribute("friendRecommend_"+(PAGE+1)*6)!=null)
            		out.println("<li class='next'><a href='FriendsList.jsp?page="+(PAGE+1)+"'>Newer <span aria-hidden='true'>&rarr;</span></a></li>");
            	%> 
            </ul>

        </div>
    </div>
</body>
</html>
