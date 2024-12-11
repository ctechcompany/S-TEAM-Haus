<%-- 
    Document   : añadirRegistroSesion
    Created on : 29 oct. 2024, 09:20:27
    Author     : diego
--%>

<%@page import="conexion.Base"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String correo = request.getParameter("correo");
            String userNameUsuario = request.getParameter("userNameUsuario");
            String nombreUsuario = request.getParameter("nombreUsuario");
            String apellidoUsuario = request.getParameter("apellidoUsuario");
            String edad = request.getParameter("edad");
            String contraseña = request.getParameter("contraseña");
            String telefono = request.getParameter("telefono");
            String mensaje = "";
            
            Base bd = new Base();

            try {
                bd.conectar();
                String strQry = "Call InsertarUsuario('" + correo + "', '" + userNameUsuario + "', '" + nombreUsuario + "', '" + apellidoUsuario + "', '" + edad + "', '" + contraseña + "', '" + telefono + "')";
                mensaje = bd.ejecutarProcedimiento(strQry);
                bd.cierraConexion();
                if ("Usuario registrado correctamente.".equals(mensaje)){
                        HttpSession sesionUser = (HttpSession) request.getSession();
                        sesionUser.setAttribute("correo_electronico_usuario", correo);
                        sesionUser.setAttribute("user_name_usuario", userNameUsuario);
                        sesionUser.setAttribute("nombre_usuario", nombreUsuario);
                        sesionUser.setAttribute("apellido_usuario", apellidoUsuario);
                        sesionUser.setAttribute("edad_usuario", edad);
                        sesionUser.setAttribute("contrasena_usuario", contraseña);
                        sesionUser.setAttribute("telefono_usuario", telefono);
                    
                    response.sendRedirect("../index.jsp");
                } else if(mensaje.equals("El correo ya está registrado.")) {
                        request.setAttribute("errorMessage", mensaje);
                        request.getRequestDispatcher("registroSesion.jsp").forward(request, response);
                }
            } catch (Exception ex) {
                mensaje = ex.getMessage();
                request.setAttribute("errorMessage", mensaje);
                request.getRequestDispatcher("registroSesion.jsp").forward(request, response);
            }
    %>
    </body>
</html>
