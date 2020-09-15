<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.*" %>

<%@ page import="markers.markersDAO"%>
<body>
<%
 request.setCharacterEncoding("utf-8");  //Set encoding
%>

 <jsp:useBean id="markersBean" class="markers.Markers" />
 <jsp:useBean id="userBean" class="user.User" />
 <jsp:setProperty property="id" name="markersBean" param="id"/>
 <jsp:setProperty property="lat" name="markersBean" param="lat"/>
 <jsp:setProperty property="lng" name="markersBean" param="lng"/>   
<!-- <jsp:setProperty property="post" name="markersBean" param="editordata"/>  -->      
 
 <%
   //  markersDAO dao = markersDAO.getInstance();
 
    // dao.insertMarkers(markersBean);
     //response.sendRedirect("login.jsp"); 
 %>
<h1><%=markersBean.getId()%></h1>
<h1><%=markersBean.getLat()%></h1>
<h1><%=markersBean.getLng()%></h1>
</body>

