<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Muscle Up</title>
</head>
<body>
<jsp:include page="menuBar.jsp"></jsp:include>
 <div class="container">
    <div class="jumbotron">
    <div class="container">
    <h1>오늘의 고통과 노력이 내일의 나를 바꾼다.</h1>
    <p>B202144047 곽정민의 JSP 웹사이트 입니다.</p>
    </div>
    </div>
    </div>
    <div class="container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
    <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
    <li data-target="#mycarousel" data-slide-to="1"></li>
    <li data-target="#mycarousel" data-slide-to="2"></li>
    <li data-target="#mycarousel" data-slide-to="3"></li>
    <li data-target="#mycarousel" data-slide-to="4"></li>
    </ol>
    <div class="carousel-inner">
    <div class="item active">
    <img src="image/main1.png" class="card-img-top" alt="..." width="1200px">
    </div>
    <div class="item">
    <img src="image/main2.png" class="card-img-top" alt="..." width="1200px">
    </div>
    <div class="item">
    <img src="image/main3.png" class="card-img-top" alt="..." width="1200px">
    </div>
    <div class="item">
    <img src="image/main4.png" class="card-img-top" alt="..." width="1200px">
    </div>
    <div class="item">
    <img src="image/main5.png" class="card-img-top" alt="..." width="1200px">
    </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
    </div>
    </div>
 
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
