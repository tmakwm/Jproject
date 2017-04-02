﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
String id;
if((String)session.getAttribute("ID")==null)
	id = "";
else
	id = (String)session.getAttribute("ID");
%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UT
    F-8"> 
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js">
    </script>
</head>
<body>
    <!-- 상단 네비게이션 바 -->
    <div class="navbar navbar-inverse navbar-fixed-top ">
        <div class="container">
            <div class="navbar-header">
                <!-- 브라우저가 좁아졋을때 나오는 버튼(클릭시 메뉴출력) -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="MovieMain.jsp">영화 추천 사이트</a>
            </div>
            <div class="collapse navbar-collapse nav-stacked">
                <ul class="nav navbar-nav">
                	<%
	            		if(id.equals(""))
	                    	out.println("<li><a href='Login.jsp?STATUS=' target=framecontainer>로그인</a></li>");
	            		else{
	                    	out.println("<li><a href='InformationView.jsp' target=framecontainer>"+id+"</a></li>");
	                    	out.println("<li><a href='Logout.jsp' target=framecontainer>로그아웃</a></li>");
	            		}
                    %>
                    <li><a href="Recommending.jsp" target=framecontainer>추천 목록</a></li>
                    <li><a href="getSeenMovies.jsp" target=framecontainer>내 영화목록</a></li>
                    <li><a href="getFriendsMovie.jsp?Friend=" target=framecontainer>내 친구목록</a></li>
                    <li><a href="mailto:tmddjq4839@naver.com">문의하기</a></li>
                </ul>
            </div>
        </div>
    </div>

        <iframe name="framecontainer" width="100%" height="810px" style="padding-top:50px;" src="HomeContentView.jsp">

        </iframe>
</body>
</html>
