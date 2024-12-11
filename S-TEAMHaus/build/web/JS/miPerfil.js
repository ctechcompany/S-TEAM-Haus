/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// Validación para navegación normal y al regresar a la página
window.onload = validarSesion;
window.onpageshow = function(event) {
    if (event.persisted) { // Detecta si la página viene de caché
        validarSesion();
    }
};

function validarSesion() {
    // Verificar si hay una sesión iniciada
    const sesionActiva = localStorage.getItem('sesionIniciada');
    
    if (!sesionActiva) {
        Swal.fire({
            title: "No hay una sesión activa",
            text: "Inicia sesión o regístrate",
            imageUrl: "../IMAGENES/tacheStemsito.png",
            imageWidth: 400,
            imageHeight: 315,
            imageAlt: "Custom image",
            confirmButtonText: "OK"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '../JSP/inicioSesion.jsp';
            }
        });
    }
}






