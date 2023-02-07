<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="today.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
</head>
<body>
<%
    String userID = null; 
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
%>
<jsp:include page="menuBar.jsp"></jsp:include>
<h3><p align="center"><%=userID %>님 안녕하세요</p></h3>
<div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                    	<th style="background-color:#eeeeee; text-align:center;">고유 번호</th>
                        <th style="background-color:#eeeeee; text-align:center;">작성일</th>
                        <th style="background-color:#eeeeee; text-align:center;">오늘의 체중</th>
                        <th style="background-color:#eeeeee; text-align:center;">오늘의 음식</th>
                        <th style="background-color:#eeeeee; text-align:center;">오늘의 기분</th>
                    </tr>
                </thead>
                <tbody>
<%
TodayDAO todayDAO = new TodayDAO();
List<Today> userInfo = null;
userInfo = todayDAO.getList(userID);
for(int i=0; i<userInfo.size(); i++){
%>
<tr>
<td><%=userInfo.get(i).getTodayID() %></td>
<td><%=userInfo.get(i).getTodayDate() %></td>
<td><%=userInfo.get(i).getTodayWeight() %></td>
<td>
아침 식사 : <%=userInfo.get(i).getTodayBreak() %><br>
점심 식사 : <%=userInfo.get(i).getTodayLunch() %><br>
저녁 식사 : <%=userInfo.get(i).getTodayDinner() %><br>
</td>
<td><%=userInfo.get(i).getTodayFeel() %></td>
</tr>
<%} %>
                </tbody>
            </table>
        </div>
    </div>
      
<button type="button" class="btn btn-primary" style="position: absolute; right : 130px;" onclick="location.href='register.jsp'">오늘의 내 정보 등록하기</button>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>