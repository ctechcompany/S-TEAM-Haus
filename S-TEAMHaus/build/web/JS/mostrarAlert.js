/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function mostrarMensaje(mensaje) {
    Swal.fire({
        title: "Todo bien",
        text: mensaje,
        imageUrl: "../IMAGENES/tacheStemsito.png",
        imageWidth: 400,
        imageHeight: 315,
        imageAlt: "Custom image"
    });
}