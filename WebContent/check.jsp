<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.userDAO" %>
<html>
<head>
    <title>�α��� ó�� JSP</title>
</head>
<body>
    <%
        // ���ڵ� ó��
        request.setCharacterEncoding("euc-kr"); 
        
        // �α��� ȭ�鿡 �Էµ� ���̵�� ��й�ȣ�� �����´�
        String id= request.getParameter("id");
        String pw = request.getParameter("password");
        
        // DB���� ���̵�, ��й�ȣ Ȯ��
        userDAO dao = userDAO.getInstance();
        int check = dao.loginCheck(id,pw);
        
        // URL �� �α��ΰ��� ���� �޽���
        String msg = "";
       
        
        if(check == 1)    // �α��� ����
        { 
            // ���ǿ� ���� ���̵� ����
            session.setAttribute("sessionID", id);
            msg = "./MAP.jsp";
        }
        else if(check == 0) // ��й�ȣ�� Ʋ�����
        {
            msg = "./login.jsp?msg=0";
        }
        else    // ���̵� Ʋ�����
        {
            msg = "./login.jsp?msg=-1";
        }
         
        // sendRedirect(String URL) : �ش� URL�� �̵�
        // URL�ڿ� get��� ó�� �����͸� ���ް���
        response.sendRedirect(msg);
    %>
</body>
</html>