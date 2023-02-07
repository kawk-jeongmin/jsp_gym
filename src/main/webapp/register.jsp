<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
<script type="text/javascript">

        function RegisterCheckAction() {
            //form 태그 가져오기
            let formInfo = document.RegisterInfo;
            
            //form태그의  name값으로 value 가져오기
            let inputTodayWeight = formInfo.todayWeight.value;
            let inputTodayFood = formInfo.todayFood.value;
            let inputTodayFeel = formInfo.todayFeel.value;
      
      
            if(inputTodayWeight == "") {
                alert("오늘의 체중을 입력하세요");
                formInfo.todayWeight.focus();
                return false;
            }
            if(inputTodayFeel == "") {
                alert("오늘의 기분을 입력하세요");
                formInfo.todayFeel.focus();
                return false;
            }
            if(inputTodayBreak == "") {
                alert("오늘의 아침 식사를 입력하세요");
                formInfo.todayFood.focus();
                return false;
            }
            if(inputTodayLunch == "") {
                alert("오늘의 점심 식사를 입력하세요");
                formInfo.todayFood.focus();
                return false;
            }
            if(inputTodayDinner == "") {
                alert("오늘의 저녁 식사를 입력하세요");
                formInfo.todayFood.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
%>
<jsp:include page="menuBar.jsp"></jsp:include>
<div class="container">
<form method = "post" action="registerAction.do" name="RegisterInfo" onsubmit="return RegisterCheckAction()">

			<div class="form-group row">
				<label class="col-sm-2">오늘의 체중</label>
				<div class="com-sm-3">
					<input type ="text" class="form-control" placeholder="숫자만 입력하세요" name ="todayWeight" maxlength='20'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">오늘의 아침 식사</label>
				<div class="com-sm-3">
					<input type ="text" class="form-control" placeholder="콤마(,) 없이 음식 이름만 입력하세요" name ="todayBreak" maxlength='20'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">오늘의 점심 식사</label>
				<div class="com-sm-3">
					<input type ="text" class="form-control" placeholder="콤마(,) 없이 음식 이름만 입력하세요" name ="todayLunch" maxlength='20'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">오늘의 저녁 식사</label>
				<div class="com-sm-3">
					<input type ="text" class="form-control" placeholder="콤마(,) 없이 음식 이름만 입력하세요" name ="todayDinner" maxlength='20'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">오늘의 느낀점</label><br>
				<div class="com-sm-3">
				<input type ="text" style="width:1170px;height:200px;font-size:15px;" class="form-control" placeholder="오늘 내 상태를 입력하세요" name ="todayFeel" maxlength='1000'>
				</div>
			</div>
			<div class="form-group row" align="right">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
				</div>
			</div>
			</form>
	</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>