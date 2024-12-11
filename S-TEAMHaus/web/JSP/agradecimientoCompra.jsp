<%-- 
    Document   : agradecimientoCompra
    Created on : 30 nov. 2024, 22:44:22
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../CSS/agradecimientoCompra.css"/>
        <link href="../CSS/nuevaNav.css" rel="stylesheet" type="text/css"/>
        <title>Gracias</title>
    </head>
    <body>
        <header>


            <%
                // Verificar si existe una sesión activa
                String correoElectronico = "correo_electronico_usuario";
                String nombreUsuario = "Usuario";

                // Verificar si existe una sesión activa
                HttpSession sesionUser = request.getSession(false);
                if (sesionUser != null && sesionUser.getAttribute("id_usuario") != null) {
                    // Obtener los valores de la sesión
                        String idUsuario = (String) sesionUser.getAttribute("id_usuario");
                    correoElectronico = (String) sesionUser.getAttribute("correo_electronico_usuario");
                    nombreUsuario = (String) sesionUser.getAttribute("nombre_usuario");

                    // Ahora puedes usar estos valores en la página JSP
                } else {
                    // Si no hay sesión activa, redirige al formulario de inicio de sesión
                    //response.sendRedirect("ruta_a_inicioSesion.jsp");
                }
            %>

            <nav>
                <a href="../index.jsp" class="item"> 
                    <div class="header-STEM">
                        <img src="../IMAGENES/imagenP.png" alt="#"/>
                        Inicio              
                    </div>
                </a>
                <a href="cursos.jsp" class="item">Cursos</a>
                <div class="item">
                    Tienda
                    <div class="dropdown">
                        <div>
                            <a href="carritoCompras.jsp" aria-label="Carrito de compras">🛍️ Carrito de compras</a>
                            <a href="#.jsp">Robots</a>
                            <a href="#.jsp">Productos</a>
                        </div>
                    </div>
                </div>
                <a href="miPerfil.jsp" class="item" aria-label="Perfil de usuario">👤 Bienvenido <%= nombreUsuario%></a>
                <div class="underline"></div>
            </nav>

        </header>
        <main>
            <div class="container">
                <div class="card">
                    <div class="hearts" aria-hidden="true">
                        <div class="heart" style="left: 10%; animation: float 2.9s infinite;"></div>
                        <div class="heart" style="left: 30%; animation: float 4s infinite;"></div>
                        <div class="heart" style="left: 50%; animation: float 5s infinite;"></div>
                        <div class="heart" style="left: 70%; animation: float 2.4s infinite;"></div>
                        <div class="heart" style="left: 90%; animation: float 3s infinite;"></div>
                    </div>
                    <img src="../IMAGENES/stemsitoAgradecimiento.png" alt=""/>
                    <h1>¡GRACIAS POR COMPRAR EN S-TEAM Haus!</h1>
                    <p>Te enviaremos un correo con todos los detalles.</p>
                </div>
            </div>
        </main>
    </body>
</html>
