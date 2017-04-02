<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String movieCd = request.getParameter("MovieCd");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<body>
	<form>
	<label for=rate>평점</label>
	<input id=rate type=text name = RATE placeholder="평점">
	<input type="submit" value="확인" class='btn btn-primary'>
	</form>
</body>
</html>