<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createS</title>
</head>
<body>

	<% 
		int rollno = Integer.parseInt(request.getParameter("rollno"));
		String name = request.getParameter("name");
		
		String sql = "insert into student values(?,?)";
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","test");
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, rollno);
			ps.setString(2, name);
			int i = ps.executeUpdate();
			
			if(i>0) {
				//out.print("record inserted successfully");
				response.sendRedirect("MainMenu.jsp");
			}
			else{
				out.print("problem occurred while inserting a record");
			}
			
		}catch (Exception e) {
			out.println("error "+e.getMessage());
		}
		
	%>

	
</body>
</html>