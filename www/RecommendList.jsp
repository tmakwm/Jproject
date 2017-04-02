﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, java.util.List, recommend.*, dbHandling.*" %>
<% 
	String strPage = (String)request.getParameter("page");
	int PAGE = Integer.parseInt(strPage);
	
	DBHandler dbHandler = new DBHandler();
	
%>
    <!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<style type="text/css">
	.text {
  		white-space: nowrap;
		width: 280px; padding: 15px;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	</style>
	<script type="text/javascript">

	function Rating(str) {
	      var base = document.getElementById(str+"_rate");
	      var newline = document.createElement( 'p' );
	      var input = document.createElement( 'input' );
	      var btn = document.createElement( 'button' );
	      btn.innerHtml = "<p>확인</p>";
	      base.appendChild( newline );
	      base.appendChild( input );
	      base.appendChild( btn );
	      
	      btn.className+='btn btn-primary';
	      btn.onclick = function () {
		      var inputValue = input.value;
	      	  alert(inputValue);
	      	  $('p').remove()
	      }/* onclick="getElementById('hidden-div').style.display = 'block'" */
	    //var myWindow = window.open("Rating.jsp?MovieCd="+str, "별점 주기", "width=200,height=200");
	}
	</script>
</head>
<body>
    <div class="container">
        <div>
            <h1>영화 리스트</h1>
            <div class="row">
            <%
        	for(int i = PAGE*6; i<(PAGE+1)*6 && session.getAttribute("recommend_"+i)!=null;i++){
                String movieCd = (String)session.getAttribute("recommend_"+i);
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
        		out.println("<p id = "+movieCd+"_rate><button class='btn btn-primary' onclick='Rating("+movieCd+")'>평점</button> <a href='#' class='btn btn-default' role='button'>후기남기기</a></p>");
        		out.println("</div></div></div>");
        	}
            %>
            </div>
            <ul class="pager">
            	<%
            	if(1<=PAGE)
	        		out.println("<li class='previous'><a href='RecommendList.jsp?page="+(PAGE-1)+"'><span aria-hidden='true'>&larr;</span> Older</a></li>");
            	if(session.getAttribute("recommend_"+(PAGE+1)*6)!=null)
            		out.println("<li class='next'><a href='RecommendList.jsp?page="+(PAGE+1)+"'>Newer <span aria-hidden='true'>&rarr;</span></a></li>");
            	%> 
            </ul>

        </div>
    </div>
</body>
</html>