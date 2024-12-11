<%-- 
    Document   : registroSesion
    Created on : 29 oct. 2024, 09:16:00
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../CSS/formRegistroSesion.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
        <script src="../JS/registroSesion.js" type="text/javascript"></script>
        <title> Registro Sesión </title>
    </head>
    <body>
        <!-- Contenedor STEM -->
        <div class="cnt">
            <H1> S-TEAM HAUS</h1>
        </div>
        <div class="cntSub">
            <h2> REGISTRO</h2>
        </div>
        <!-- contenedor Formulario -->
        <br>
        <div class="cnt2">
            <div class="cnt2-form-card1">
                <div class="cnt2-form-card2">
                    <form class="cnt2-form" action="añadirRegistroSesion.jsp" onsubmit="return validarFormulario()" novalidate>
                        <p class="cnt2-form-heading"><B>REGISTRO DE SESIÓN</B></p>
                        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                        <% if (errorMessage != null) {%>
                        <div style="color:red;">
                            <%= errorMessage%>
                        </div>
                        <% }%>
                        <div class="cnt2-form-field">
                            <input
                                required=""
                                placeholder="Correo Electronico"
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
                                placeholder="User Name"
                                class="cnt2-input-field"
                                type="text"
                                maxlength="15"
                                minlength="5"
                                id="userNameUsuario"
                                name="userNameUsuario"
                                />                       
                        </div>
                        <p id="mensajeuserNameUsuario" style="color:red; font-size:small;"></p>
                        
                        <div class="cnt2-form-field">
                            <input
                                required=""
                                placeholder="Nombre (s)"
                                class="cnt2-input-field"
                                type="text"
                                id="nombreUsuario"
                                name="nombreUsuario"
                                />                       
                        </div>
                        <p id="mensajeNombre" style="color:red; font-size:small;"></p>
                        
                        <div class="cnt2-form-field">
                            <input
                                required=""
                                placeholder="Apellidos"
                                class="cnt2-input-field"
                                type="text"
                                id="apellidoUsuario"
                                name="apellidoUsuario"
                                />                       
                        </div>
                        <p id="mensajeApellidos" style="color:red; font-size:small;"></p>

                        <div class="cnt2-form-field">
                            <input
                                required=""
                                placeholder="Edad"
                                class="cnt2-input-field"
                                type="number"
                                min="12"
                                max="100"
                                id="edad"
                                name="edad"
                                />                     
                        </div>
                        <p id="mensajeEdad" style="color:red; font-size:small;"></p>

                        <div class="cnt2-form-field">
                            <input
                                required=""
                                placeholder="Contraseña"
                                class="cnt2-input-field"
                                type="password"
                                maxlength="16"
                                minlength="8"
                                id="contraseña"
                                name="contraseña"
                                />                        
                        </div>
                        <p id="mensajeContraseña" style="color:red; font-size:small;"></p>
                        
                        <div class="cnt2-form-field">
                            <input
                                required=""
                                placeholder="Telefono"
                                class="cnt2-input-field"
                                type="text"
                                id="telefono"
                                name="telefono"
                                />                        
                        </div>
                        <p id="mensajeTelefono" style="color:red; font-size:small;"></p>
                        <br>
                        <button type="submit" class="cnt2-sendMessage-btn">ENVIAR</button>
                        <button type="button" class="cnt2-sendMessage-btn" onclick="window.location.href = 'inicioSesion.jsp'">INICIAR SESIÓN</button>
                    </form>
                </div>
            </div 
            <!-- OTTO NINJA -->

            <div class="cnt-OttoNinja">
                <img src="../IMAGENES/ottoNinja.svg" alt="#"/>
            </div>
        </div>
                        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
</html>
