<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>

<%@ page import="user.userDAO"%>

<body>
<%
 request.setCharacterEncoding("utf-8");  //Set encoding
 String id= request.getParameter("id");
 userDAO dao = userDAO.getInstance();
 boolean idcheck = dao.duplicateIdCheck(id);
 String idmsg = "";
 
 if(idcheck){
 	idmsg="./main.jsp?idmsg=0";
 	response.sendRedirect(idmsg);
 }
 else{
 
%>

 <jsp:useBean id="userBean" class="user.User" />
 <jsp:setProperty property="*" name="userBean"/>    
 
 
 
 <%
 
     // 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
     // insertMember()는 회원 정보를 user 테이블에 저장한다.
     dao.insertMember(userBean);
     response.sendRedirect("login.jsp"); 
 }
 %>

</body>