<%-- 
    Document   : validacionInicioSesion
    Created on : 28 oct. 2024, 20:52:32
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
            String userNameUsuario= "";
            String nombreUsuario= "";
            String apellidoUsuario= "";
            String edad= "";
            String contraseña = request.getParameter("contraseña");
            String telefono= "";                                                                                                                                                                                                                                                                                      
            String mensaje = "";
            
            Base bd = new Base();

            try {
            bd.conectar();
                String strQry = "Call ValidRUsuario('" + correo + "', '" + contraseña + "')";
                mensaje = bd.ejecutarProcedimiento(strQry);
                if ("Bienvenido de nuevo.".equals(mensaje)) {
                    String strQry1 = "select * from usuario where correo_electronico_usuario = '" + correo + "';";
                    ResultSet rs = null;
                    rs= bd.consulta(strQry1);
                    if (rs.next()){
                        HttpSession sesionUser = (HttpSession) request.getSession();
                        sesionUser.setAttribute("id_usuario", rs.getString(1));
                        sesionUser.setAttribute("correo_electronico_usuario", correo);
                        sesionUser.setAttribute("user_name_usuario", rs.getString(3));
                        sesionUser.setAttribute("nombre_usuario", rs.getString(4));
                        sesionUser.setAttribute("apellido_usuario", rs.getString(5));
                        sesionUser.setAttribute("edad_usuario", rs.getString(6));
                        sesionUser.setAttribute("contrasena_usuario", rs.getString(7));
                        sesionUser.setAttribute("telefono_usuario", rs.getString(8));

                    }
                    bd.cierraConexion();

                    response.sendRedirect("../index.jsp");
                } else {
                    bd.cierraConexion();
                    request.setAttribute("errorMessage", mensaje);
                    request.getRequestDispatcher("inicioSesion.jsp").forward(request, response);
                }
            } catch (Exception ex) {
                bd.cierraConexion();
                mensaje = ex.getMessage();
                request.setAttribute("errorMessage", mensaje);
            }
            bd.cierraConexion();
        %>
    </body>
</html>
