<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style/styles.css">
<link rel="stylesheet" href="style/main.css">
<title>Usuarios</title>
</head>
<body>
	<header>
        <h1 class="titulo-tienda">Tienda gen?rica</h1>
	<!-- -----------------------Menu-------------------------------- -->
	    <section class="main">
        <div class="container">
            <section class="row">
                <div class="col">
                    <div class="border-top border-bottom py-3">
                        <ul class="nav nav-pills nav-fill">
                            <li class="nav-item">
                                <a href="usuarios.jsp" class="nav-link active">Usuarios</a>
                            </li>
                            <li class="nav-item">
                                <a href="clientes.jsp" class="nav-link">Clientes</a>
                            </li>
                            <li class="nav-item">
                                <a href="proveedores.jsp" class="nav-link">Proveedores</a>
                            </li>
                            <li class="nav-item">
                                <a href="productos.jsp" class="nav-link">Productos</a>
                            </li>
                            <li class="nav-item">
                                <a href="ventas.jsp" class="nav-link">Ventas</a>
                            </li>
                            <li class="nav-item">
                                <a href="reportes.jsp" class="nav-link">Reportes</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- -----------------------FIN Menu-------------------------------- -->
            </header>
            <br>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","root", "Julian0992");
		PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios");
		ResultSet  result = ps.executeQuery();
	%>
	<section class="main">
		<div class="container">
			<section class="row">
				<div class="col">
					<table class="table table-hover">
						<tr>
							<th class="titulo-tabla">Cedula</th>
							<th class="titulo-tabla">Correo</th>
							<th class="titulo-tabla">Nombre</th>
							<th class="titulo-tabla">Contrase?a</th>
							<th class="titulo-tabla">Usuario</th>
							<th class="titulo-tabla-centrada" colspan="2">Acci?n</th>
						</tr>
						<%
							while(result.next()){
						%>
						<tr>
							<td><%= result.getInt("cedula_usuario") %></td>
							<td><%= result.getString("email_usuario") %></td>
							<td><%= result.getString("nombre_usuario") %></td>
							<td><%= result.getString("password") %></td>
							<td><%= result.getString("usuario") %></td>
							<td><a class="btn btn-info editar-usuario" href="editar.jsp?cedula=<%=result.getInt("cedula_usuario")%>">Editar</a></td>
							<td><a class="btn btn-info eliminar-usuario" href="eliminar.jsp?cedula=<%=result.getInt("cedula_usuario")%>">Eliminar</a></td>
						</tr>
						<%
							}
						%>
					</table>
					<a href="agregarUsuario.html" class="btn btn-info agregar-usuario">Agregar usuario</a>
				</div>
			</section>
		</div>
	</section>
	
	

</body>
</html>