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
		String correo = request.getParameter("correo");
		String nombre = request.getParameter("nombre");
		String pass = request.getParameter("pass");
		String usuario = request.getParameter("usuario");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","root", "Julian0992");
		Statement st = conexion.createStatement();
		String sql = "INSERT INTO usuarios (cedula_usuario, email_usuario, nombre_usuario, password, usuario) VALUES("+cedula+",'"+correo+"', '"+nombre+"', '"+pass+"', '"+usuario+"')";
		st.executeUpdate(sql);
		JOptionPane.showMessageDialog(null, "Usuario agregado");
		response.sendRedirect("usuarios.jsp");
	%>
</body>
</html>