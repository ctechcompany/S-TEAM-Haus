<%-- 
    Document   : añadirEnvio
    Created on : 2 nov. 2024, 21:53:34
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
            String correoElectronico = request.getParameter("correo_electronico");
            String nombreEnvio = request.getParameter("nombre_envio");
            String apellidosEnvio = request.getParameter("apellidos_envio");
            String pais = request.getParameter("pais");
            String estado = request.getParameter("estado");
            String calle = request.getParameter("calle");
            String numeroInterior = request.getParameter("numero_interior");
            if (numeroInterior == null || numeroInterior.isEmpty()) {
                numeroInterior = "S/N";
            }
            String numeroExterior = request.getParameter("numero_exterior");
            String colonia = request.getParameter("colonia");
            String alcaldiaMunicipio = request.getParameter("alcaldia_municipio");
            String codigoPostal = request.getParameter("codigo_postal");
            String telefonoContacto = request.getParameter("telefono_contacto");
            String total = request.getParameter("total");

            Base bd = new Base();

            try {
                bd.conectar();
                String strQry = "CALL InsertarDireccionEnvio(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = bd.getConn().prepareStatement(strQry);
                stmt.setString(1, nombreEnvio);
                stmt.setString(2, apellidosEnvio);
                stmt.setString(3, correoElectronico);
                stmt.setString(4, pais);
                stmt.setString(5, estado);
                stmt.setString(6, calle);
                stmt.setString(7, numeroInterior);
                stmt.setString(8, numeroExterior);
                stmt.setString(9, colonia);
                stmt.setString(10, codigoPostal);
                stmt.setString(11, alcaldiaMunicipio);
                stmt.setString(12, telefonoContacto);

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    String mensaje = rs.getString(1);
                    if (mensaje.equals("Envio registrado correctamente.")) {

                        String strQry1 = "select * from DireccionEnvio where nombre_envio = '" + nombreEnvio + "' and apellidos_envio = '" + apellidosEnvio + "' and correo_electronico = '" + correoElectronico + "' and calle = '" + calle + "';";

                        ResultSet rs1 = null;
                        rs1 = bd.consulta(strQry1);
                        if (rs1.next()) {

                            StringBuilder redirectUrl = new StringBuilder("pasarelaDePago.jsp?");
                            redirectUrl.append("correo_electronico=").append(correoElectronico)
                                    .append("&nombre_envio=").append(nombreEnvio)
                                    .append("&apellidos_envio=").append(apellidosEnvio)
                                    .append("&pais=").append(pais)
                                    .append("&estado=").append(estado)
                                    .append("&calle=").append(calle)
                                    .append("&numero_interior=").append(numeroInterior)
                                    .append("&numero_exterior=").append(numeroExterior)
                                    .append("&colonia=").append(colonia)
                                    .append("&alcaldia_municipio=").append(alcaldiaMunicipio)
                                    .append("&codigo_postal=").append(codigoPostal)
                                    .append("&telefono_contacto=").append(telefonoContacto)
                                    .append("&total=").append(total);

                            response.sendRedirect(redirectUrl.toString());

                            rs1.close();
                        }
                    }
                }
                rs.close();
                bd.cierraConexion();
            } catch (Exception error) {
                out.print(error.getMessage());
            }
        %>
    </body>
</html>
