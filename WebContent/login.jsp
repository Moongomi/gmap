<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>login</title>
	<link rel="stylesheet" type="text/css" href="main.css">

	     
</head>
<body>
<form name="loginInfo" method="post" action="./check.jsp" >

	<p><img src="./images/logo.jpg"></p>
		<div class="table">
		<div class="row">
		<div class="col">
		<h4>
			 <label for="user">id: </label><input type="text" id="user" name="id">

		</h4>
		<h4>
			<label for="user">password: </label><input type="password" name="password" id="user">
		</h4>
		<div class="row"><a href="./main.jsp" >회원가입</a> <br /></div>
		</div>
		 <button class="btn" type="submit">LOGIN</button>
		 </div>
		 </div>
		 
        <% 
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("비밀번호를 확인해 주세요.");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("아이디를 확인해 주세요.");
            }
        %>    

</body>
</html>