<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="user.DBConnection" %>
<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.File" %>
<%
	String sql = null; 
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {	
		conn = DBConnection.getConnection();
	
		stmt = conn.createStatement();
		if(request.getParameter("id") != null)
		{
			request.setCharacterEncoding("UTF-8");
			String id = new String(request.getParameter("id").getBytes("8859_1"),"UTF-8");
			String lat = new String(request.getParameter("lat").getBytes("8859_1"),"UTF-8");
			String lng = new String(request.getParameter("lng").getBytes("8859_1"),"UTF-8");
			String post = new String(request.getParameter("editordata").getBytes("8859_1"),"UTF-8");
			sql = String.format("INSERT INTO markers(lat,lng,id,post) values('"+lat+"','"+lng+"','"+id+"','"+post+"')");
			System.out.print(sql);
			stmt.executeUpdate(sql);
		}
		sql = "SELECT * FROM markers";
		rs = stmt.executeQuery(sql);
		
		JSONArray arr1 = new JSONArray();
		JSONObject obj2 = new JSONObject();
		JSONObject fobj = new JSONObject();
		while(rs.next())
		{
			String id = URLEncoder.encode(rs.getString("id"), "UTF-8");
			String lat = URLEncoder.encode(rs.getString("lat"), "UTF-8");
			String lng = URLEncoder.encode(rs.getString("lng"), "UTF-8");
			String post = rs.getString("post");
			JSONObject obj = new JSONObject();
			obj.put("lat",lat);
			obj.put("lng",lng);
			obj.put("id",id);
			obj.put("post",post);
			if(obj!=null)
				arr1.add(obj);
		}
				FileWriter file = new FileWriter("C://Users/Administrator/eclipse-workspace/A/WebContent/t.json");
				file.write(arr1.toJSONString());
				file.flush();
				file.close();
		 
	} catch (Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("./MAP.jsp");
%>