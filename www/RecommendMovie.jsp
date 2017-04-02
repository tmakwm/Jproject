<%@page import="dbHandling.DBHandler"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

String id = (String)session.getAttribute("ID");
String movieCd = request.getParameter("MovieCd");
String strPage = request.getParameter("page");
DBHandler dbHandler = new DBHandler();
dbHandler.addRecom(id, movieCd);
RequestDispatcher dispatcher = request.getRequestDispatcher("SeenMovieList.jsp?page="+strPage);
dispatcher.include(request, response);
%>