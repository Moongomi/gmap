<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.DBConnection"%> <!-- DB���� Ŭ������ import�Ѵ�. -->
<html>
 
<head>
</head>
<body>
    <center>
        <table border="3" bordercolor="skyblue">
        <tr bgcolor="skyblue"><td>id<td>password</tr>
        
        <%
        // ������
        String query = "SELECT * FROM user";
        
        // Ŀ�ؼ� ����
        Connection conn = DBConnection.getConnection();
        
        // DB�� �������� ������.
        PreparedStatement pstmt = conn.prepareStatement(query);
        
        // �������� ������� rs�� ��´�.
        ResultSet rs = pstmt.executeQuery();
        
        // ������� ����Ѵ�.
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

