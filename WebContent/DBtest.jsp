<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.DBConnection"%> <!-- DB연결 클래스를 import한다. -->
<html>
 
<head>
</head>
<body>
    <center>
        <table border="3" bordercolor="skyblue">
        <tr bgcolor="skyblue"><td>id<td>password</tr>
        
        <%
        // 쿼리문
        String query = "SELECT * FROM user";
        
        // 커넥션 연결
        Connection conn = DBConnection.getConnection();
        
        // DB에 쿼리문을 보낸다.
        PreparedStatement pstmt = conn.prepareStatement(query);
        
        // 쿼리문의 결과값을 rs에 담는다.
        ResultSet rs = pstmt.executeQuery();
        
        // 결과값을 출력한다.
        while(rs.next()){
            out.println("<tr>");
            out.println("<td>"+rs.getString("id"));
            out.println("<td>"+rs.getString("password"));
            out.println("</tr>");
        }
        
        %>
        </table>
    </center>
</body>
</html>

