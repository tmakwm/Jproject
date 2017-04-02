<%@ page language="java" contentType="text/html; charset="euc-kr"
    pageEncoding="euc-kr"%>
    <!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="euc-kr" />
    <title></title>
</head>
<body>
    <form action = Regist.jsp>
        <div class="form-group">
            <label for="exampleInputEmail1">아이디</label>
            <input type="text" class="form-control" id="exampleInputEmail1" name = ID placeholder="아이디를 입력하세요">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">암호</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name = PASSWORD placeholder="암호">
        </div>
        <div class="form-group">
            <label for="exampleInputName">이름</label>
            <input type="text" class="form-control" id="exampleInputName" name = NAME placeholder="이름을 입력하세요">
        </div>
        <div class="form-group">
            <label for="exampleInputDate">생년월일</label>
            <input type="date" class="form-control" id="exampleInputDate" name = BIRTH placeholder="태어난 생년월일을 입력하세요">
        </div>
        <button type="submit" class="btn btn-default">제출</button>
    </form>
</body>
</html>