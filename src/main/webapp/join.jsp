<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
         //화면전환
        function changeSignUpView(){
            // 로그인 버튼 클릭시 로그인 화면으로 이동
            {
                location.href="login.jsp";
            }
        }
        
        //회원가입 폼에 입력값들이 입력됐는지 올바른 값이 입력됐는지 검사         
        function signUpCheckAction() {
            //form 태그 가져오기
            let formName = document.JoinInfo;
            
            //form태그의  name값으로 value 가져오기
            let inputID = formName.userID.value;
            let inputPassword = formName.userPassword.value;
            let inputName = formName.userName.value;
            let inputAge = formName.userAge.value;
            let inputWeight = formName.userWeight.value;
            let inputGoal = formName.userGoalWeight.value;
            let PasswordCheck = formName.userPasswordCheck.value;
      
      
            if(inputID == "") {
                alert("아이디를 입력하세요");
                formName.userID.focus();
                return false;
            }
            if(inputPassword == "") { 
                alert("비밀번호를 입력하세요");
                formName.userPassword.focus();
                return false;
            }
           if(inputPassword != PasswordCheck) { 
                alert("비밀번호가 동일하지 않습니다");
                formName.userPasswordCheck.focus();
                return false;
            }
            if(inputName == "") {
                alert("이름을 입력하세요");
                formName.userName.focus();
                return false;
            }
            if(inputAge == "") {
                alert("나이를 입력하세요");
                formName.userAge.focus();
                return false;
            }
            if(inputWeight == "") { 
                alert("현재 체중을 입력하세요");
                formName.userWeight.focus();
                return false;
            }
            if(inputGoal == "") { 
                alert("목표 체중을 입력하세요");
                formName.userGoalWeight.focus();
                return false;
            }
        }
    </script> 
</head>
<body>
<jsp:include page="menuBar.jsp"></jsp:include>
 <div class="container">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class ="jumbotron" style="padding-top:20px;">
                <form method = "post" action="joinAction.do" name="JoinInfo" onsubmit="return signUpCheckAction()">
                    <h3 style="text-align:center;">회원가입 화면</h3>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="아이디" name ="userID" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="password" class="form-control" placeholder="비밀번호" name ="userPassword" maxlength='20'>
                    </div>
                    <div class="form-group">
                        <input type ="password" class="form-control" placeholder="비밀번호 확인" name="userPasswordCheck" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="이름" name ="userName" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="나이" name ="userAge" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="현재 몸무게" name ="userWeight" maxlength='20'>
                    </div>         
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="목표 몸무게" name ="userGoalWeight" maxlength='20'>
                    </div>           
                    <input type="submit" class="btn btn-primary form-control" value="회원가입">
                </form>
                <br>
                <div class="bg-white py-4 px-5 text-center border mt-4">
                 <p class="m-0">
                   <h5>계정이 있으신가요?
                   <a id="loginButton" onclick="changeSignUpView()">로그인하러 가기</a></h5>
                 </p>
                </div>
            </div> 
        </div> 
        <div class="col-lg-4"></div>
    </div>
</body>
</html>