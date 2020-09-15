<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>main</title>
	<link rel="stylesheet" type="text/css" href="main.css">
	<!--<script src="main.js" type="text/javascript"></script> -->
</head>
<body>
<FORM action="join.jsp" method="post">
	<p><img src="./images/logo.jpg"></p>
		<div class="table">
		<div class="row">
		<div class="col">
		<h4>
			 <label for="user">id: </label><input type="text" id="user" name = "id">

		</h4>
		<h4>
			<label for="user">password: </label><input type="password" id="user" name="password">
		</h4>
		</div>
		 <button class="btn" type="submit">submit</button>
		</div>
		</div>
		<% 
            String msg=request.getParameter("idmsg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("이미 사용중인 아이디입니다.");
            }
        %>   
</body>
</html>