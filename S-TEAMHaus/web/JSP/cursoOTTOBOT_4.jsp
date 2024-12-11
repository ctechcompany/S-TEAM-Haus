<%-- 
    Document   : cursoOTTOBOT
    Created on : 25 oct. 2024, 09:17:58
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <script src="../JS/cursoOTTOBOT.js"></script>
        <style>/* Estilos generales */
            body, html {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                height: 100%;
            }

            .container {
                display: flex;
                flex-direction: column;
                height: 100vh;
            }

            .main-content {
                display: flex;
                flex: 1;
            }

            /* Estilos para la barra lateral */
            .sidebar {
                width: 250px;
                background-color: #f0f0f0;
                padding: 20px;
                overflow-y: auto;
            }

            .sidebar h2 {
                margin-top: 0;
                color: #333;
            }

            .modulos {
                margin-bottom: 20px;
            }

            .module-select {
                margin-bottom: 10px;
            }

            .module-select summary {
                cursor: pointer;
                font-weight: bold;
                padding: 5px 0;
            }

            .module-select ul {
                list-style-type: none;
                padding-left: 20px;
            }

            .module-select li {
                padding: 5px 0;
                cursor: pointer;
            }

            .module-select li:hover {
                color: #007bff;
            }

            .course-info {
                display: flex;
                flex-direction: column;
            }

            .course-info button, .course-info a button {
                margin-bottom: 10px;
                padding: 10px;
                background-color: #007bff;
                color: white;
                border: none;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                transition: background-color 0.3s;
            }

            .course-info button:hover, .course-info a button:hover {
                background-color: #0056b3;
            }

            /* Estilos para el contenedor del iframe */
            .iframe-container {
                flex: 1;
                padding: 20px;
            }

            .content {
                height: 100%;
            }

            iframe {
                width: 100%;
                height: 100%;
                border: none;
            }

            /* Estilos para el footer */
            .footer {
                background-color: #f0f0f0;
                padding: 10px;
                text-align: center;
            }

            #toggle-sidebar {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 16px;
            }

            #toggle-sidebar:hover {
                background-color: #0056b3;
            }</style>

    </head>
    <body>
        <div class="container">
            <div class="main-content">
                <nav class="sidebar">
                    <h2>Curso de Smart-Bot</h2>
                    <div class="modulos">
                        <details class="module-select">
                            <summary>Modulo 1</summary>
                            <ul>
                                <li ><a href="cursoOTTOBOT.jsp">¿Qué es la electricidad?</a> </li>
                                <li ><a href="cursoOTTOBOT_1.jsp">¿Qué es un robot?</a> </li>
                                <li  ><a href="cursoOTTOBOT_2.jsp">Otto</a> </li>
                                <li ><a href="cursoOTTOBOT_3.jsp">Herramientas / Programas</a> </li>
                            </ul>
                        </details>
                        <details class="module-select">
                            <summary>Modulo 2</summary>
                            <ul>
                                <li data-url="/modulo2/tema1">Tema 1</li>
                                <li data-url="/modulo2/tema2">Tema 2</li>
                            </ul>
                        </details>
                        <details class="module-select">
                            <summary>Modulo 3</summary>
                            <ul>
                                <li ><a href="cursoOTTOBOT_4.jsp">Introducción</a> </li>
                                <li ><a href="cursoOTTOBOT_5.jsp">Ejemplos</a> </li>
                                <li  ><a href="cursoOTTOBOT_6.jsp">Aplicaciones</a> </li>
                                <li ><a href="cursoOTTOBOT_7.jsp">Conclusiones</a> </li>
                            </ul>
                        </details>
                    </div>
                    <div class="course-info">
                        <button>Información del curso</button>
                        <button>Recursos</button>
                        <button>Información de Otto</button>
                        <a href="progresoEducativoCursos.jsp" style="text-decoration: none;"><button>Volver</button></a>
                    </div>

                </nav>
                <div class="iframe-container">
                    <main class="content">              
                        <iframe src="../modulo3/videoCursoOTTOBOT_1.jsp" id="content-iframe"></iframe>
                    </main>
                </div>
            </div>

            <footer class="footer">
            </footer>


            <script src="../JS/cursoOTTOBOT.js" type="text/javascript"></script>
    </body>

</html>
