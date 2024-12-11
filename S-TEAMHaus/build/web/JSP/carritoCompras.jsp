<%-- 
    Document   : carritoCompras
    Created on : 13 oct. 2024, 16:11:00
    Author     : diego
--%>

<%@page import="conexion.Base"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/carritoCompras.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/nuevaNav.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
        <link href="../CSS/nuevaNav.css" rel="stylesheet" type="text/css"/>

        <title>JSP Page</title>
    </head>
    <body>

        <header>


            <%
                HttpSession sesionUser = request.getSession(true);
                String correo = "";
                String userNameUsuario= "";
                String nombreUsuario= "";
                String apellidoUsuario= "";
                String edad= "";
                String contraseña= "";
                String telefono= "";
                String idUsuarioS= "";
                
                if (sesionUser != null && sesionUser.getAttribute("correo_electronico_usuario") != null) {
                    correo = (String) sesionUser.getAttribute("correo_electronico_usuario");
                    userNameUsuario = (String) sesionUser.getAttribute("user_name_usuario");
                    nombreUsuario = (String) sesionUser.getAttribute("nombre_usuario");
                    apellidoUsuario = (String) sesionUser.getAttribute("apellido_usuario");
                    edad = (String) sesionUser.getAttribute("edad_usuario");
                    contraseña = (String) sesionUser.getAttribute("contrasena_usuario");
                    telefono = (String) sesionUser.getAttribute("telefono_usuario");

                } else {
                    response.sendRedirect("inicioSesion.jsp");
                }
                
                Base bd = new Base();
                bd.conectar();
                String strQry1 = "select id_usuario from usuario where correo_electronico_usuario = '" + correo + "';";
                ResultSet rs = null;
                rs= bd.consulta(strQry1);
                if (rs.next()){
                    idUsuarioS= rs.getString(1);
                }
                bd.cierraConexion();
            %>

            <button class="menu-toggle">☰</button>
            <nav>
                <a href="../index.jsp" class="item"> 
                    <div class="header-STEM">
                        <img src="../IMAGENES/NavStems.png" alt="#"/>
                        S-TEAM HAUS              
                    </div>
                </a>
                <a href="cursos.jsp" class="item">Cursos</a>
                <div class="item">
                    Tienda
                    <div class="dropdown">
                        <div>
                            <a href="carritoCompras.jsp">Carrito de compras</a>
                            <a href="robot2Compra.jsp">Robots</a>
                        </div>
                    </div>
                </div>
                <a href="miPerfil.jsp" class="item">Bienvenido <%= userNameUsuario%></a>
                <div class="underline"></div>
                <script src="../JS/responsive_nav.js" type="text/javascript"></script>
            </nav>

        </header>

        <div class="container">

            <div class="cnt-izquierdo">
                <br><br>
                <div class="cnt-izquierdo-h2">

                    <h3>Productos</h3> <h3 class="precioD">Precio</h3><h3>Cantidad</h3><h3>Subtotal</h3>

                </div>
                <br><br>
                <div class="cnt-izquierdo-productos">
                    <%
                        String idRobot= "";
                        String cantidad= "";
                        String precio= "";
                        String nombreR= "";
                        String descripcion= "";
                        String precioT= "";
                        String precioTT= "";
                        int precioTE= 0;
                        int precioE= 0;
                        int cantidadE= 0;
                        int precioTTE= 0;
                        bd.conectar();
                        String strQry = "select id_robot, cantidad from RobotsEnCarrito where id_usuario = '" + idUsuarioS + "';";
                        ResultSet rs1 = null;
                        rs1= bd.consulta(strQry);
                        while (rs1.next()){
                            idRobot = rs1.getString(1);
                            cantidad = rs1.getString(2);
                            switch (idRobot){
                            case "1":
                                nombreR="OTTO bot";
                                break;
                            case "2":
                                nombreR="OTTO bot";
                                break;
                            case "3":
                                nombreR="ARES STEMKIT 2.2";
                                break;
                            default:
                                nombreR="error";
                                break;
                            }
                            String strQry2 = "select precio_robot, descripcion_robot from Robot where id_robot = '" + idRobot + "';";
                            ResultSet rs2 = null;
                            rs2= bd.consulta(strQry2);
                            if (rs2.next()){
                                precio= rs2.getString(1);
                                descripcion= rs2.getString(2);
                            }
                            precioE= Integer.parseInt(precio);
                            cantidadE= Integer.parseInt(cantidad);
                            precioTE= precioE*cantidadE;
                            precioT=precioTE + " ";
                            precioTTE=precioTTE+precioTE;
                    %>
                    <div class="cnt-izquierdo-productos-div">

                        <div class="cnt-izquierdo-productos-div-producto">

                            <div class="cnt-izquierdo-productos-div-producto-imagen">

                                <button>

                                    <img class="eliminarImagen" src="../IMAGENES/eliminarImagen.png" alt="alt"/>

                                </button>

                                <img src="../IMAGENES/imagenPCuadrado.png" alt="alt"/>

                            </div>

                            <div class="cnt-izquierdo-productos-div-producto-descripcion">

                                <h3><%= nombreR%></h3>
                                <p><%= descripcion%></p>
                            </div>

                        </div>

                        <div class="cnt-izquierdo-productos-div-precio">
                            <h3>$<%= precio%> mnx</h3>
                        </div>

                        <div class="cnt-izquierdo-productos-div-cantidad">
                            
                            <form action="suma1cantidad.jsp">
                                <button type="submit">
                                    <input type="hidden" name="idUsuario" value="<%= idUsuarioS%>">
                                    <input type="hidden" name="idRobot" value="<%= idRobot%>">
                                    <input type="hidden" name="cantidad" value="<%= cantidad%>">
                                    <img src="../IMAGENES/agregarImagen.png" alt="agregarImagen"/>
                                </button>
                            </form>

                            <h3><%= cantidad%></h3>

                            <form action="resta1cantidad.jsp">
                                <button type="submit">
                                    <input type="hidden" name="idUsuario" value="<%= idUsuarioS%>">
                                    <input type="hidden" name="idRobot" value="<%= idRobot%>">
                                    <input type="hidden" name="cantidad" value="<%= cantidad%>">
                                    <img src="../IMAGENES/quitarSigno.png" alt="quitarImagen"/>
                                </button>
                            </form>
                        </div>

                        <div class="cnt-izquierdo-productos-div-subtotal">

                            <h3>$<%= precioTE%> mnx</h3>

                        </div>

                    </div>
                    <br><br>
                    <%
                        }
                        bd.cierraConexion();
                    %>
                </div>
                <br> <br> <br> <br>
                <div class="cnt-izquierdo-segirComprando">

                    <button class="buttonAzul">
                        <img class="flecha" src="../IMAGENES/flechita_carrit_compras.svg" alt="flechaIzquierda"/>
                        <div class="TextoButtonA">
                            EXPLORAR MÁS
                        </div>
                    </button>

                    <div class="cnt-izquierdo-segirComprando-productos">

                        <div class="cnt_izquierdo-Titulo">
                            <h3>¿QUÉ TAL ESTE PRODUCTO?</h3>
                            <button class="button_izq">
                                <div class="TextoButtonA">
                                    ¡CONOCEME!
                                </div>
                            </button>
                        </div> 
                        <div class="cnt_izquierdo_img">
                            <img class="OttoIzq" src="../IMAGENES/OTTOverde.png"alt="flechaIzquierda"  alt="OttoIzq"/>

                        </div>
                    </div>
                </div>
            </div>
            <aside class="cnt-aside">
                <div class="cnt-aside-envio">
                    <label class="cnt-aside-envio-label">
                        <input type="radio" id="envioPaqueteriaNormal" name="envioPaqueteriaNormal" value="envioPaqueteriaNormal">
                        <p>Envio a toda la republica mexicana: <b>$90mnx</b></p>
                    </label>
                    <label class="cnt-aside-envio-label">
                        <input type="radio" id="envioPaqueteriaNormal" name="envioPaqueteriaNormal" value="envioPaqueteriaNormal">
                        <p>Ubicacion de la papeleria- UNIT Pick Up></p>
                    </label>
                    <label class="cnt-aside-envio-label">
                        <input type="radio" id="envioPaqueteriaNormal" name="envioPaqueteriaNormal" value="envioPaqueteriaNormal">
                        <p>Ubicacion de la papeleria- UNIT Pick Up></p>
                    </label>
                    <div class="cnt-aside-pago-total">
                        <%
                            int total = precioTTE + 90;
                        %>
                        <h3>Total</h3><h3>$<%= total%> MXN</h3>
                    </div>
                    <form action="formDireccion.jsp" method="post">
                        <input type="hidden" name="total" value="<%= total%>">
                        <button type="submit" class="buttonAzulPagar"> PAGAR
                        </button>
                    </form>
                </div>
            </aside>



        </div>

        <footer>

            <div class="footer">

                <div class="footer-hipervinculos">

                    <div class="footer-hipervinculos-links">

                        <h2>Información de STEM</h2>
                        <a href="#"><p>Página de la empresa</p></a>
                        <a href="#"><p>Sucursales</p></a>
                        <a href="#"><p>Información de Contacto</p></a>

                    </div>

                    <div class="footer-hipervinculos-links">

                        <h2>Servicio al Cliente</h2>
                        <a href="#"><p>Contactanos</p></a>
                        <a href="#"><p>Preguntas frecuentes</p></a>
                        <a href="#"><p>UNIT Pick Up</p></a>

                    </div>

                    <div class="footer-hipervinculos-links">

                        <h2>OTTO</h2>
                        <a href="#"><p>Derechos reservados</p></a>
                        <a href="#"><p>Página oficial</p></a>
                        <a href="#"><p>Contacto(Robot OTTO)</p></a>

                    </div>

                    <div class="footer-hipervinculos-links">
                        <h2>Términos y Condiciones</h2>
                        <a href="#"><p>T&C Tienda Online</p></a>
                        <a href="#"><p>T&C Cuenta</p></a>
                    </div>

                </div>

                <div class="footer-imagenesRedesSociales">

                    <div class="footer-imagenesRedesSociales-STEM">

                        <img src="../IMAGENES/imagenP.png" alt="#"/>

                    </div>

                    <div class="footer-imagenesRedesSociales-RedesSociales">

                        <h2>¡Nuestras Redes Sociales!</h2>

                        <div class="button-container">

                            <button class="button flex-center">

                                <svg
                                    viewBox="0 0 24 24"
                                    class="btn-svg"
                                    width="22px"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                    >
                                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                                <g
                                    id="SVGRepo_tracerCarrier"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    ></g>
                                <g id="SVGRepo_iconCarrier">
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M12 18C15.3137 18 18 15.3137 18 12C18 8.68629 15.3137 6 12 6C8.68629 6 6 8.68629 6 12C6 15.3137 8.68629 18 12 18ZM12 16C14.2091 16 16 14.2091 16 12C16 9.79086 14.2091 8 12 8C9.79086 8 8 9.79086 8 12C8 14.2091 9.79086 16 12 16Z"
                                    fill="#fff"
                                    ></path>
                                <path
                                    d="M18 5C17.4477 5 17 5.44772 17 6C17 6.55228 17.4477 7 18 7C18.5523 7 19 6.55228 19 6C19 5.44772 18.5523 5 18 5Z"
                                    fill="#fff"
                                    ></path>
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M1.65396 4.27606C1 5.55953 1 7.23969 1 10.6V13.4C1 16.7603 1 18.4405 1.65396 19.7239C2.2292 20.8529 3.14708 21.7708 4.27606 22.346C5.55953 23 7.23969 23 10.6 23H13.4C16.7603 23 18.4405 23 19.7239 22.346C20.8529 21.7708 21.7708 20.8529 22.346 19.7239C23 18.4405 23 16.7603 23 13.4V10.6C23 7.23969 23 5.55953 22.346 4.27606C21.7708 3.14708 20.8529 2.2292 19.7239 1.65396C18.4405 1 16.7603 1 13.4 1H10.6C7.23969 1 5.55953 1 4.27606 1.65396C3.14708 2.2292 2.2292 3.14708 1.65396 4.27606ZM13.4 3H10.6C8.88684 3 7.72225 3.00156 6.82208 3.0751C5.94524 3.14674 5.49684 3.27659 5.18404 3.43597C4.43139 3.81947 3.81947 4.43139 3.43597 5.18404C3.27659 5.49684 3.14674 5.94524 3.0751 6.82208C3.00156 7.72225 3 8.88684 3 10.6V13.4C3 15.1132 3.00156 16.2777 3.0751 17.1779C3.14674 18.0548 3.27659 18.5032 3.43597 18.816C3.81947 19.5686 4.43139 20.1805 5.18404 20.564C5.49684 20.7234 5.94524 20.8533 6.82208 20.9249C7.72225 20.9984 8.88684 21 10.6 21H13.4C15.1132 21 16.2777 20.9984 17.1779 20.9249C18.0548 20.8533 18.5032 20.7234 18.816 20.564C19.5686 20.1805 20.1805 19.5686 20.564 18.816C20.7234 18.5032 20.8533 18.0548 20.9249 17.1779C20.9984 16.2777 21 15.1132 21 13.4V10.6C21 8.88684 20.9984 7.72225 20.9249 6.82208C20.8533 5.94524 20.7234 5.49684 20.564 5.18404C20.1805 4.43139 19.5686 3.81947 18.816 3.43597C18.5032 3.27659 18.0548 3.14674 17.1779 3.0751C16.2777 3.00156 15.1132 3 13.4 3Z"
                                    fill="#fff"
                                    ></path>
                                </g>
                                </svg>

                            </button>

                            <button class="button flex-center">

                                <svg
                                    fill="#fff"
                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                    xmlns="http://www.w3.org/2000/svg"
                                    version="1.1"
                                    class="btn-svg"
                                    width="22px"
                                    viewBox="0 -2 20 20"
                                    >
                                <g stroke-width="0" id="SVGRepo_bgCarrier"></g>
                                <g
                                    stroke-linejoin="round"
                                    stroke-linecap="round"
                                    id="SVGRepo_tracerCarrier"
                                    ></g>
                                <g id="SVGRepo_iconCarrier">
                                <title>twitter [#154]</title>
                                <desc>Created with Sketch.</desc>
                                <defs></defs>
                                <g
                                    fill-rule="evenodd"
                                    fill="none"
                                    stroke-width="1"
                                    stroke="none"
                                    id="Page-1"
                                    >
                                <g
                                    fill="#fff"
                                    transform="translate(-60.000000, -7521.000000)"
                                    id="Dribbble-Light-Preview"
                                    >
                                <g transform="translate(56.000000, 160.000000)" id="icons">
                                <path
                                    id="twitter-[#154]"
                                    d="M10.29,7377 C17.837,7377 21.965,7370.84365 21.965,7365.50546 C21.965,7365.33021 21.965,7365.15595 21.953,7364.98267 C22.756,7364.41163 23.449,7363.70276 24,7362.8915 C23.252,7363.21837 22.457,7363.433 21.644,7363.52751 C22.5,7363.02244 23.141,7362.2289 23.448,7361.2926 C22.642,7361.76321 21.761,7362.095 20.842,7362.27321 C19.288,7360.64674 16.689,7360.56798 15.036,7362.09796 C13.971,7363.08447 13.518,7364.55538 13.849,7365.95835 C10.55,7365.79492 7.476,7364.261 5.392,7361.73762 C4.303,7363.58363 4.86,7365.94457 6.663,7367.12996 C6.01,7367.11125 5.371,7366.93797 4.8,7366.62489 L4.8,7366.67608 C4.801,7368.5989 6.178,7370.2549 8.092,7370.63591 C7.488,7370.79836 6.854,7370.82199 6.24,7370.70483 C6.777,7372.35099 8.318,7373.47829 10.073,7373.51078 C8.62,7374.63513 6.825,7375.24554 4.977,7375.24358 C4.651,7375.24259 4.325,7375.22388 4,7375.18549 C5.877,7376.37088 8.06,7377 10.29,7376.99705"
                                    ></path>
                                </g>
                                </g>
                                </g>
                                </g>
                                </svg>

                            </button>

                            <button class="button flex-center">

                                <svg
                                    viewBox="0 0 20 20"
                                    width="22px"
                                    class="btn-svg"
                                    version="1.1"
                                    xmlns="http://www.w3.org/2000/svg"
                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                    fill="#fff"
                                    stroke="#fff"
                                    >
                                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                                <g
                                    id="SVGRepo_tracerCarrier"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    ></g>
                                <g id="SVGRepo_iconCarrier">
                                <title>github [#fff142]</title>
                                <desc>Created with Sketch.</desc>
                                <defs></defs>
                                <g
                                    id="Page-1"
                                    stroke="none"
                                    stroke-width="1"
                                    fill="none"
                                    fill-rule="evenodd"
                                    >
                                <g
                                    id="Dribbble-Light-Preview"
                                    transform="translate(-140.000000, -7559.000000)"
                                    fill="#fff"
                                    >
                                <g id="icons" transform="translate(56.000000, 160.000000)">
                                <path
                                    d="M94,7399 C99.523,7399 104,7403.59 104,7409.253 C104,7413.782 101.138,7417.624 97.167,7418.981 C96.66,7419.082 96.48,7418.762 96.48,7418.489 C96.48,7418.151 96.492,7417.047 96.492,7415.675 C96.492,7414.719 96.172,7414.095 95.813,7413.777 C98.04,7413.523 100.38,7412.656 100.38,7408.718 C100.38,7407.598 99.992,7406.684 99.35,7405.966 C99.454,7405.707 99.797,7404.664 99.252,7403.252 C99.252,7403.252 98.414,7402.977 96.505,7404.303 C95.706,7404.076 94.85,7403.962 94,7403.958 C93.15,7403.962 92.295,7404.076 91.497,7404.303 C89.586,7402.977 88.746,7403.252 88.746,7403.252 C88.203,7404.664 88.546,7405.707 88.649,7405.966 C88.01,7406.684 87.619,7407.598 87.619,7408.718 C87.619,7412.646 89.954,7413.526 92.175,7413.785 C91.889,7414.041 91.63,7414.493 91.54,7415.156 C90.97,7415.418 89.522,7415.871 88.63,7414.304 C88.63,7414.304 88.101,7413.319 87.097,7413.247 C87.097,7413.247 86.122,7413.234 87.029,7413.87 C87.029,7413.87 87.684,7414.185 88.139,7415.37 C88.139,7415.37 88.726,7417.2 91.508,7416.58 C91.513,7417.437 91.522,7418.245 91.522,7418.489 C91.522,7418.76 91.338,7419.077 90.839,7418.982 C86.865,7417.627 84,7413.783 84,7409.253 C84,7403.59 88.478,7399 94,7399"
                                    id="github-[#fff142]"
                                    ></path>
                                </g>
                                </g>
                                </g>
                                </g>
                                </svg>

                            </button>

                            <button class="button flex-center">

                                <svg
                                    stroke="#fff"
                                    fill="#fff"
                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                    xmlns="http://www.w3.org/2000/svg"
                                    version="1.1"
                                    class="btn-svg"
                                    width="22px"
                                    viewBox="0 -3 20 20"
                                    >
                                <g stroke-width="0" id="SVGRepo_bgCarrier"></g>
                                <g
                                    stroke-linejoin="round"
                                    stroke-linecap="round"
                                    id="SVGRepo_tracerCarrier"
                                    ></g>
                                <g id="SVGRepo_iconCarrier">
                                <title>youtube [#fff168]</title>
                                <desc>Created with Sketch.</desc>
                                <defs></defs>
                                <g
                                    fill-rule="evenodd"
                                    fill="none"
                                    stroke-width="1"
                                    stroke="none"
                                    id="Page-1"
                                    >
                                <g
                                    fill="#fff"
                                    transform="translate(-300.000000, -7442.000000)"
                                    id="Dribbble-Light-Preview"
                                    >
                                <g transform="translate(56.000000, 160.000000)" id="icons">
                                <path
                                    id="youtube-[#fff168]"
                                    d="M251.988432,7291.58588 L251.988432,7285.97425 C253.980638,7286.91168 255.523602,7287.8172 257.348463,7288.79353 C255.843351,7289.62824 253.980638,7290.56468 251.988432,7291.58588 M263.090998,7283.18289 C262.747343,7282.73013 262.161634,7282.37809 261.538073,7282.26141 C259.705243,7281.91336 248.270974,7281.91237 246.439141,7282.26141 C245.939097,7282.35515 245.493839,7282.58153 245.111335,7282.93357 C243.49964,7284.42947 244.004664,7292.45151 244.393145,7293.75096 C244.556505,7294.31342 244.767679,7294.71931 245.033639,7294.98558 C245.376298,7295.33761 245.845463,7295.57995 246.384355,7295.68865 C247.893451,7296.0008 255.668037,7296.17532 261.506198,7295.73552 C262.044094,7295.64178 262.520231,7295.39147 262.895762,7295.02447 C264.385932,7293.53455 264.28433,7285.06174 263.090998,7283.18289"
                                    ></path>
                                </g>
                                </g>
                                </g>
                                </g>
                                </svg>

                            </button>

                        </div>

                    </div>

                </div>

            </div>

        </footer>

    </body>

</html>
