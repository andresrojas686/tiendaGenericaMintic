<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.swing.JOptionPane" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
	int cedula = Integer.parseInt(request.getParameter("cedula"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","root", "Julian0992");
	PreparedStatement ps = conexion.prepareStatement("DELETE FROM usuarios WHERE cedula_usuario = "+cedula);
	ps.executeUpdate();
	JOptionPane.showMessageDialog(null, "Datos del Usuario Borrados");
	response.sendRedirect("usuarios.jsp");
	%>
</body>
</html>