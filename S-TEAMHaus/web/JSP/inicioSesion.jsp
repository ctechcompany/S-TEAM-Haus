<%-- 
    Document   : inicioSesion
    Created on : 28 oct. 2024, 22:29:40
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
        <title> Inicio Sesión </title>
        <script src="../JS/inicioSesion.js" type="text/javascript"></script>
        <link href="../CSS/formInicioSesion.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="nav">

        </nav>
        <!-- Contenedor STEM -->
        <div class="cnt">
            <H1> S-TEAM HAUS</h1>
        </div>
           <div class="cntSub">
            <h2>INICIO SESIÓN</h2>
        </div>
        <!-- contenedor Formulario -->
        <br><br><br><br> <br><br> 
        <div class="cnt2">
            
            <div class="cnt2-form-card1">
                <div class="cnt2-form-card2">
                    <form class="cnt2-form" action="validacionInicioSesion.jsp" novalidate>
                        <p class="cnt2-form-heading"><B>INICIO SESIÓN</B></p>
                                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                        <% if (errorMessage != null) {%>
                        <div style="color:red;">
                            <%= errorMessage%>
                        </div>
                        <% }%>
                        <div class="cnt2-form-field">
                            <input
                                required=""
                                placeholder="Correo Electrónico"
                                class="cnt2-input-field"
                                type="email"
                                id="correo"
                                name="correo"
                                />
                            
                        </div>
                        <p id="mensajeCorreo" style="color:red; font-size:small;"></p> 

                        <div class="cnt2-form-field">
                            <input
                                required="" 
                                placeholder="Password"
                                class="cnt2-input-field"
                                type="password"
                                id="contraseña"
                                name="contraseña"
                                />
                            
                        </div>
                        <p id="mensajeContraseña" style="color:red; font-size:small;"></p>
                        <br>
                        <button type="submit" class="cnt2-sendMessage-btn">INICIAR SESIÓN</button>
                        <button type="button" class="cnt2-sendMessage-btn" onclick="window.location.href='registroSesion.jsp'">CREAR CUENTA</button>
                    </form>
                </div>
            </div>
          <!-- div OttoNinja -->
          <div class="cnt-OttoNinja">
               <img src="../IMAGENES/ottoNinja.svg" alt="#"/>
          </div>
        </div>
    </body>
</html>
