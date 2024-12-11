/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var seguirC=true;

function validarCantIngresada() {
    const cantidad = document.getElementById("cantidad");
    const mensajeCantidad = document.getElementById("mensajeCantidad");

    if (cantidad.value < 1) {
        mensajeCantidad.textContent = "La cantidad mínima es 1";
        seguirC=false;
    } else {
        mensajeCantidad.textContent = "";
        seguirC=true;
    }
}

function validarCantidad() {
    let esValido = true;
    validarCantIngresada();

    const cantidad = document.getElementById('cantidad').value;
   
    if (!seguirC) {
        esValido = false;
    }

    if (!esValido) {
        Swal.fire({
            title: "Error en el formulario",
            text: "Por favor, corrige los campos con errores.",
            imageUrl: "../IMAGENES/tacheStemsito.png",
            imageWidth: 400,
            imageHeight: 315,
            imageAlt: "Custom image"
        });
        return false;
    }

    return true;
}

document.addEventListener("DOMContentLoaded", () => {
    const campos = [
        {elemento: "cantidad", funcion: validarCantIngresada}
    ];

    campos.forEach(campo => {
        const input = document.getElementById(campo.elemento);
        input.addEventListener("blur", campo.funcion);
        input.addEventListener("keyup", campo.funcion);
    });
});