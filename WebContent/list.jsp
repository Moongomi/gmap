<%@page import="user.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>THIS IS FOR YOU</title>
<link href="list.css" type="text/css" rel="stylesheet">
</head>
<body>
<h2>코스 목록</h2>
<table id = "table" border="1" width="600">
     <tr>
         <th>title</th>
         <th>이미지</th>
         <th>위도</th>
         <th>경도</th>
      </tr>
<%     
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try{
			con = DBConnection.getConnection();
			String sql="select * from course";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String title = rs.getString("title");
				String image = rs.getString("firstimage");
				String lat = rs.getString("mapx");
				String lng = rs.getString("mapy");
%>
        <tr>
		<td><%=title %></td>
		<td><img src ="<%=image %>" width = "200px" height="200px"></td>
		<td><%=lat %></td>
		<td><%=lng %></td>
	</tr>
	<%
			}
		}catch(SQLException se){
			System.out.println(se.getMessage());
		}finally{
			try{
				if(rs!=null)  rs.close();
				if(pstmt!=null)  pstmt.close();
				if(con!=null)  con.close();
			}catch(SQLException se){
				System.out.println(se.getMessage());

			}

		}

	%>
	
    </table>
</body>
</html>