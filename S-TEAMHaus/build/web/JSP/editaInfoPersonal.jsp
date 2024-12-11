<%-- 
    Document   : editaInfoPersonal
    Created on : 6 dic. 2024, 12:41:54
    Author     : Usuario
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
            Base bd = new Base();
            HttpSession sesionUser = request.getSession(true);
            String userNameUsuarioS= "";
            String idUsuarioS= "";
            
            if (sesionUser != null && sesionUser.getAttribute("correo_electronico_usuario") != null) {
                userNameUsuarioS = (String) sesionUser.getAttribute("user_name_usuario");
            } else {
                response.sendRedirect("inicioSesion.jsp");
            }

            bd.conectar();
            String strQry1 = "select id_usuario from usuario where correo_electronico_usuario = '" + sesionUser.getAttribute("correo_electronico_usuario") + "';";
            ResultSet rs = null;
            rs= bd.consulta(strQry1);
            if (rs.next()){
                idUsuarioS= rs.getString(1);
            }
            bd.cierraConexion();

            String correo = request.getParameter("correo");
            String userNameUsuario = request.getParameter("userNameUsuario");
            String nombreUsuario = request.getParameter("nombreUsuario");
            String apellidoUsuario = request.getParameter("apellidoUsuario");
            String edad = request.getParameter("edad");
            String contraseña = request.getParameter("contraseña");
            String telefono = request.getParameter("telefono");
            String mensaje = "";
            

            try {
                bd.conectar();
                String strQry = "Call EditarUsuario('" + idUsuarioS + "', '" + correo + "', '" + userNameUsuario + "', '" + nombreUsuario + "', '" + apellidoUsuario + "', '" + edad + "', '" + contraseña + "', '" + telefono + "')";
                mensaje = bd.ejecutarProcedimiento(strQry);
                bd.cierraConexion();
                if ("Datos actualizados (nuevo correo).".equals(mensaje) || "Datos actualizados.".equals(mensaje)){
                        sesionUser.setAttribute("correo_electronico_usuario", correo);
                        sesionUser.setAttribute("user_name_usuario", userNameUsuario);
                        sesionUser.setAttribute("nombre_usuario", nombreUsuario);
                        sesionUser.setAttribute("apellido_usuario", apellidoUsuario);
                        sesionUser.setAttribute("edad_usuario", edad);
                        sesionUser.setAttribute("contrasena_usuario", contraseña);
                        sesionUser.setAttribute("telefono_usuario", telefono);
                    
                    response.sendRedirect("miPerfil.jsp");
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
        <h1>Redireccionando...</h1>
    </body>
</html>
