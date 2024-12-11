/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// Funciones de validación para cada campo

var seguirC=true;
var seguirU=true;
var seguirN=true;
var seguirA=true;
var seguirE=true;
var seguirP=true;
var seguirT=true;
var seguirTodo=true;

function validarCorreo() {
    const correo = document.getElementById("correo");
    const mensajeCorreo = document.getElementById("mensajeCorreo");
    const correoRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (!correoRegex.test(correo.value)) {
        mensajeCorreo.textContent = "Formato de correo inválido (Ejemplo: correo@gmail.com)";
        seguirC=false;
    } else {
        mensajeCorreo.textContent = "";
        seguirC=true;
    }
}

function validarUserNameUsuario() {
    const userNameUsuario = document.getElementById("userNameUsuario");
    const mensajeuserNameUsuario = document.getElementById("mensajeuserNameUsuario");
    const usuarioRegex = /^[a-zA-Z0-9.@_-]{5,15}$/;
    if (!usuarioRegex.test(userNameUsuario.value)) {
        mensajeuserNameUsuario.textContent = "El user name debe tener entre 5 y 15 caracteres y puede incluir letras, números y  . @ _";
        seguirU=false;
    } else {
        mensajeuserNameUsuario.textContent = "";
        seguirU=true;
    }
}


function validarNombreUsuario() {
    const nombreUsuario = document.getElementById("nombreUsuario");
    const mensajeNombre = document.getElementById("mensajeNombre");
    const usuarioRegex = /^[a-zA-Z\s]{5,30}$/;

    if (!usuarioRegex.test(nombreUsuario.value)) {
        mensajeNombre.textContent = "El nombre solo debe tener letras sin simbolos";
        seguirN = false;
    } else {
        mensajeNombre.textContent = "";
        seguirN = true;
    }
}



function validarNombreUsuario() {
    const nombreUsuario = document.getElementById("nombreUsuario");
    const mensajeNombre = document.getElementById("mensajeNombre");
    const usuarioRegex = /^[a-zA-Z\s]{5,30}$/;

    if (!usuarioRegex.test(nombreUsuario.value)) {
        mensajeNombre.textContent = "El nombre solo debe tener letras sin simbolos";
        seguir = false;
    } else {
        mensajeNombre.textContent = "";
        seguir = true;
    }
}

function validarApellidoUsuario() {
    const apellidoUsuario = document.getElementById("apellidoUsuario");
    const mensajeApellidos = document.getElementById("mensajeApellidos");
    const usuarioRegex = /^[a-zA-Z\s]{1,30}$/;

    if (!usuarioRegex.test(apellidoUsuario.value)) {
        mensajeApellidos.textContent = "El apellido solo puede contener letras";
        seguirA = false;
    } else {
        mensajeApellidos.textContent = "";
        seguirA = true;
    }
}
function validarEdad() {
    const edad = document.getElementById("edad");
    const mensajeEdad = document.getElementById("mensajeEdad");

    if (edad.value < 12 || edad.value > 100) {
        mensajeEdad.textContent = "La edad debe estar entre 12 y 100";
        seguirE=false;
    } else {
        mensajeEdad.textContent = "";
        seguirE=true;
    }
}

function validarContraseña() {
    const contraseña = document.getElementById("contraseña");
    const mensajeContraseña = document.getElementById("mensajeContraseña");
    const contraseñaRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,16}$/;

    if (!contraseñaRegex.test(contraseña.value)) {
        mensajeContraseña.textContent = "La contraseña debe tener entre 8 y 16 caracteres, incluir al menos una mayúscula, una minúscula y un símbolo especial";
        seguirP=false;
    } else {
        mensajeContraseña.textContent = "";
        seguirP=true;
    }
}

function validarTelefono() {
    const telefono = document.getElementById("telefono");
    const mensajeTelefono = document.getElementById("mensajeTelefono");
    const telefonoRegex = /^[0-9]{10,20}$/;

    if (!telefonoRegex.test(telefono.value)) {
        mensajeTelefono.textContent = "Agrega un numero de telefono valido";

        seguirT = false;
    } else {
        mensajeTelefono.textContent = "";
        seguirT = true;
    }
}

function validarTodoSeguir() {
    validarCorreo();
    validarUserNameUsuario();
    validarNombreUsuario();
    validarApellidoUsuario();
    validarEdad();
    validarContraseña();
    validarTelefono();
    
    if(seguirC===true && seguirU===true && seguirN===true && seguirA===true && seguirE===true && seguirP===true && seguirT===true){
        seguirTodo=true;
    } else {
        seguirTodo=false;
    }

}

function validarFormulario() {
    let esValido = true;
    validarTodoSeguir();

    if (!seguirTodo) {
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

// Evento para validar al hacer clic fuera del campo y al soltar una tecla
document.addEventListener("DOMContentLoaded", () => {
    const campos = [
        {elemento: "correo", funcion: validarCorreo},
        {elemento: "userNameUsuario", funcion: validarUserNameUsuario},
        {elemento: "nombreUsuario", funcion: validarNombreUsuario},
        {elemento: "apellidoUsuario", funcion: validarApellidoUsuario},
        {elemento: "edad", funcion: validarEdad},
        {elemento: "contraseña", funcion: validarContraseña},
        {elemento: "telefono", funcion: validarTelefono}
    ];

    campos.forEach(campo => {
        const input = document.getElementById(campo.elemento);
        input.addEventListener("blur", campo.funcion);
        input.addEventListener("keyup", campo.funcion);
    });
});

