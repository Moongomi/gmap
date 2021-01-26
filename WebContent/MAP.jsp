  <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>My Page!</title>
	<link href="MAP.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="C://temp/t.json"></script>
	<script src="MAP.js" type="text/javascript"></script>
</head>
	<body >
		<header>
		<%=session.getAttribute("sessionID") %>
		 <input id = "logout" type="button" value="logout" />	
		</header>
		<img src="images\logo.jpg" title="d.jpg" width="200px">
		<div id="map"></div>
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=키값"
  type="text/javascript"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="MAP.js" type="text/javascript"></script>
 
  <%
        if(session.getAttribute("sessionID") == null)
        { 
    
            response.sendRedirect("login.jsp");
        }
        else 
        {
    %>
    
    <br><br>
   
    
    <%} %>    

		<footer>
			<div class = "btns">
			<div><button id = "Write" class = "snip1535">Write</div>
			<div><button id = "Recommand" class = "snip1535">Recommend</div>
		</footer>
	</body>
</html>
