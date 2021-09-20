<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style/styles.css">
<link rel="stylesheet" href="style/main.css">
<title>Insert title here</title>
</head>
<body>
	<h1 class="titulo-tienda">Editar usuario</h1>
	
	<%
		int cedula = Integer.parseInt(request.getParameter("cedula"));
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","root", "Julian0992");
		PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE cedula_usuario = "+cedula);
		ResultSet result = ps.executeQuery();
		while(result.next()){
		%>
	<section class="main">
		<div class="container">
			<section class="row">
				<div class="col">
					<div class="border-top border-bottom py-3">
						<p class="ingresa">Ingresa los datos a modificar</p>
					</div>
					<br>
					<div>
						<form action="" method = "post">
							<label for="cedula2">
								<span>Cedula:</span>
								<input type = "text" name = "cedula2" id ="cedula2" value="<%= result.getInt("cedula_usuario") %>">
							</label>
							<label for="correo">
								<span>Correo:</spanl>
								<input type = "text" name = "correo" id="correo" value="<%= result.getString("email_usuario") %>">
							</label>
							<label for="nombre">
								<span>Nombre:</span>
								<input type = "text" name = "nombre" id="nombre" value="<%= result.getString("nombre_usuario") %>">
							</label>
							<label for="pass">
								<span>Contraseña:</span>
								<input type = "text" name = "pass" id="pass" value="<%= result.getString("password") %>">
							</label>
							<label for="usuario">
								<span>Usuario:</span>
								<input type = "text" name = "usuario" id="usuario" value="<%= result.getString("usuario") %>">
							</label>
							<div class="contenedor-botones">
								<input type="submit" value="Editar" class="botones-usuario">
							</div>
						</form>
					</div>
					<%} 
					//int cedula2 = Integer.parseInt(request.getParameter("cedula2"));
					String correo = request.getParameter("correo");
					String nombre = request.getParameter("nombre");
					String pass = request.getParameter("pass");
					String usuario = request.getParameter("usuario");
					
					if (correo != null && nombre != null && pass != null && usuario != null){
						String sql = "UPDATE usuarios SET email_usuario ='"+correo+"', nombre_usuario = '"+nombre+"', password = '"+pass+"', usuario = '"+usuario+"' WHERE cedula_usuario = "+cedula;
						Statement st = conexion.createStatement();
						st.executeUpdate(sql);
						response.sendRedirect("usuarios.jsp");
					}
					%>
				</div>
			</section>
		</div>
	</section>
		
		
	
</body>
</html>