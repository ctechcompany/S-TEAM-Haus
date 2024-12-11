<%-- 
    Document   : resta1cantidad
    Created on : 10 dic. 2024, 04:46:24
    Author     : eclip
--%>

<%@page import="conexion.Base"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          Base bd = new Base();
          String cantidad = request.getParameter("cantidad");
          String idRobot = request.getParameter("idRobot");
          String idUsuario = request.getParameter("idUsuario");
          int cantidadE= Integer.parseInt(cantidad);
          int cantidadN=cantidadE+1;
          String mensaje = "";
          bd.conectar();
          String strQry = "UPDATE RobotsEnCarrito SET cantidad = " + cantidadN + " WHERE id_usuario = " + idUsuario + " and id_robot = " + idRobot + ";";
          bd.edita(strQry);
          bd.cierraConexion();
          response.sendRedirect("carritoCompras.jsp");
        %>
        <h1>Hello World!</h1>
    </body>
</html>
