<%-- 
    Document   : enviarCarrito
    Created on : 9 dic. 2024, 19:43:54
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
            HttpSession sesionUser = request.getSession(true);
            String correo= "";
            String idUsuarioS= "";
            
            if (sesionUser != null && sesionUser.getAttribute("correo_electronico_usuario") != null) {
                correo = (String) sesionUser.getAttribute("correo_electronico_usuario");
            } else {
                response.sendRedirect("inicioSesion.jsp");
            }

            bd.conectar();
            String strQry1 = "select id_usuario from usuario where correo_electronico_usuario = '" + correo + "';";
            ResultSet rs = null;
            rs= bd.consulta(strQry1);
            if (rs.next()){
                idUsuarioS= rs.getString(1);
            }
            bd.cierraConexion();
            
            String cantidad = request.getParameter("cantidad");
            String idRobot = request.getParameter("idRobot");
            String mensaje = "";
            
            try {
                bd.conectar();
                String strQry = "Call InsertarRobotCarrito('" + idUsuarioS + "', '" + idRobot + "', '" + cantidad + "')";
                mensaje = bd.ejecutarProcedimiento(strQry);
                bd.cierraConexion();
                if ("Incrementa la cantidad del Robot en el carrito del Usuario.".equals(mensaje) || "Agrega el Robot al carrito del Usuario.".equals(mensaje) || "Agrega el Robot creando el carrito del Usuario.".equals(mensaje)){
                    request.setAttribute("message", mensaje);
                    request.getRequestDispatcher("robot2Compra.jsp").forward(request, response);
                } else if(mensaje.equals("El correo ya está registrado por otro usuario.")) {
                        request.setAttribute("errorMessage", mensaje);
                        request.getRequestDispatcher("editarUsuario.jsp").forward(request, response);
                }
            } catch (Exception ex) {
                mensaje = ex.getMessage();
                request.setAttribute("errorMessage", mensaje);
                request.getRequestDispatcher("editarUsuario.jsp").forward(request, response);
            }
        %>
        <h1>Redireccionando... (no hay página xd)</h1>
    </body>
</html>
