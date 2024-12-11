<%-- 
    Document   : ingresarCodigoOTTOBOT
    Created on : 10 dic 2024, 01:59:02
    Author     : Javier
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../CSS/ingresarCodigoOTTOBOT.css" rel="stylesheet" type="text/css"/>
        <title>Ingreso de Código de Curso</title>
    </head>
    <body>

        <div class="background"></div>
        <div class="form-container">

            <h1>Ingresa tu Código de Curso</h1>
            <%
                String error = request.getParameter("mensaje");
                if (error == null) {
                } else {
                    if (error.equals("No_existe")) {
            %>
            <p style="color: red; font-size: small;">El codigo ingresado no existe</p>
            <%
                }

                if (error.equals("Utilizado")) {
            %>
            <p style="color: red; font-size: small;">El codigo ingresado ya se ha utiliazado anteriormente</p>
            <%
                    }
                }
            %>
            <form id="course-form" action="validarCodigoOTTOBOT.jsp">
                <label for="course-code">Código del Curso:</label>
                <input type="text" id="course-code" name="course-code" required placeholder="Ej: SMARTBOT2023">
                <button type="submit">Ingresar</button>
            </form>
            <a href="robot1Curso.jsp"><button class="btn-volver">VOLVER</button></a>
        </div>
    </body>
</html>
