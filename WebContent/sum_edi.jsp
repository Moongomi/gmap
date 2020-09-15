<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>summernote</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="./summernote-master/dist/summernote.css" rel="stylesheet">
<script src="./summernote-master/dist/summernote.js"></script>
<script src="./sum_edi.js"></script>
</head>
<body>
	<form method="post" action="./JsonMaker.jsp">
	<input type = "hidden" id="id" name="id" value="${sessionScope.sessionID}">
	위도 : <input type="text" id="lat" name="lat">
	경도 : <input type="text" id="lng" name="lng">
  		<textarea id="summernote" name="editordata"></textarea>

    <button class = "btn" type="submit">작성</button>
    </form>
	
</body>
</html>