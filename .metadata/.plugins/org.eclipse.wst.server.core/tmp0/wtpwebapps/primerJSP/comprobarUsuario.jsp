<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.swing.JOptionPane" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>comprobar usuario</title>
</head>
<body>
	<%	
		
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("pass");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","root", "Julian0992");
		PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE usuario = ? AND password = ?");
		ps.setString(1, usuario);
		ps.setString(2, password);
		ResultSet result = ps.executeQuery();
		int i = 0;
		while(result.next()){
			i++;
		}
		if(i==1){
			out.println("Usuario OK");
			response.sendRedirect("principal.jsp");
		}
		else{
			JOptionPane.showMessageDialog(null, "Usuario o contrase�a errados, intente de nuevo");
			response.sendRedirect("index.html");
		}
	%>
		
</body>
</html>