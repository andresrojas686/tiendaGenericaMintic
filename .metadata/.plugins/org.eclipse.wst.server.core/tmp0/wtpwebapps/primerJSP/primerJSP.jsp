<%@page import="co.edu.mintic.Calculos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Primer JSP</title>
<style>
	body{
		background-color:yellow;
	}
	h1{
		color:blue;
	}
	span{
		color:red;
		font-weight: bold;
	}
</style>
</head>
<body>
	<h1>Primer JSP</h1>
	la fecha del sistema es <span><%= new java.util.Date() %></span><br>
	Convertir a mayusculas <%= new String ("Julian").toUpperCase() %><br>
	La suma de 5 y 7 es: <%= 5+7 %><br>
	10 es mayor 100? <%= 10>100 %>
	
	<%
		for (int i = 0; i<10; i++) {
			out.println("<br>Es el mensaje: "+i);
		}
	%>
	
	<%!  /* Cuando son metodos tengo que poner el signo de admiración */
		private int resultado;
		public int metodoSuma(int num1, int num2){
			resultado = num1 + num2;
			return resultado;
		}
	%>
	<br>
	<%= metodoSuma(7,5) %>
	<br>
	La resta de 8 y 3 es: <%= Calculos.metodoResta(8, 3) %>
	<br>
	Petición datos del navegador <%= request.getHeader("User-Agent") %>
	<br>
	petición de idioma utilizado <%= request.getLocale() %>
	<jsp:include page="info.jsp"></jsp:include>
	<jsp:include page="info.jsp"></jsp:include>
	<jsp:include page="info.jsp"></jsp:include>
	<jsp:include page="info.jsp"></jsp:include>
</body>
</html>