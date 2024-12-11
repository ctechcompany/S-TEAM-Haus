<%-- 
    Document   : validarCodigoOTTOBOT
    Created on : 10 dic 2024, 02:02:34
    Author     : Javier
--%>

<%@page import="conexion.Base"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../CSS/ingresarCodigoOTTOBOT.css" rel="stylesheet" type="text/css"/>
    <title>Resultado de la Validación</title>
</head>
<body>
    <div class="background"></div>
    <div class="form-container">
        <%
            // Recibir el código del curso desde el formulario
            String courseCode = request.getParameter("course-code");
            String mensaje = "";
            String idUsuario = (String) session.getAttribute("id_usuario");

            // Verificar si el usuario está logueado
            if (idUsuario == null || idUsuario.isEmpty()) {
                response.sendRedirect("inicioSesion.jsp");
                return; // Detener la ejecución aquí para evitar que se procese el resto del código
            } else {
                // Convertir idUsuario de String a int de manera segura
                try {
                    int idUsuarioInt = Integer.parseInt(idUsuario);

                    // Conectar a la base de datos
                    Base bd = new Base();
                    try {
                        bd.conectar();

                        // Preparar la consulta con parámetros para evitar inyección SQL
                        String strQry = "CALL ValidarYAgregarAvance(?, 1, ?)";
                        PreparedStatement stmt = bd.getConn().prepareStatement(strQry);
                        stmt.setInt(1, idUsuarioInt);
                        stmt.setString(2, courseCode);

                        // Ejecutar la consulta
                        ResultSet rs = stmt.executeQuery();

                        // Verificar el resultado de la validación
                        if (rs.next()) {
                            mensaje = rs.getString("mensaje");
                        } else {
                            mensaje = "Ocurrió un error en la validación del código.";
                        }

                        bd.cierraConexion();
                    } catch (Exception ex) {
                        mensaje = "Error en la base de datos: " + ex.getMessage();
                    }
                } catch (NumberFormatException e) {
                    // Si la conversión falla (el id_usuario no es un número válido)
                    mensaje = "ID de usuario no válido. Asegúrate de que tu sesión sea correcta.";
                }
            }

            // Si el mensaje es "Exitoso", redirigir antes de imprimir cualquier mensaje
            if ("Exitoso".equals(mensaje)) {
                response.sendRedirect("progresoEducativoCursos.jsp");
                return; // Detener la ejecución aquí
            } else {
                // Redirigir de nuevo al formulario de ingreso del código con el mensaje de error
                response.sendRedirect("ingresarCodigoOTTOBOT.jsp?mensaje=" + mensaje);
            }
        %>
    </div>
</body>
</html>
