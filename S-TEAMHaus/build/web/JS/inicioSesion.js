/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function validarCorreo() {
    const correo = document.getElementById("correo");
    const mensajeCorreo = document.getElementById("mensajeCorreo");
    const correoRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (!correoRegex.test(correo.value)) {
        mensajeCorreo.textContent = "Formato de correo inválido (Ejemplo: correo@gmail.com)";
    } else {
        mensajeCorreo.textContent = "";
    }
}

function validarContraseña() {
    const contraseña = document.getElementById("contraseña");
    const mensajeContraseña = document.getElementById("mensajeContraseña");
    const contraseñaRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,16}$/;

    if (!contraseñaRegex.test(contraseña.value)) {
        mensajeContraseña.textContent = "La contraseña debe tener entre 8 y 16 caracteres, incluir al menos una mayúscula, una minúscula y un símbolo especial";
    } else {
        mensajeContraseña.textContent = "";
    }
}


document.addEventListener("DOMContentLoaded", () => {
    const campos = [
        {elemento: "correo", funcion: validarCorreo},
        {elemento: "contraseña", funcion: validarContraseña}
    ];

    campos.forEach(campo => {
        const input = document.getElementById(campo.elemento);
        input.addEventListener("blur", campo.funcion);
        input.addEventListener("keyup", campo.funcion);
    });
});
