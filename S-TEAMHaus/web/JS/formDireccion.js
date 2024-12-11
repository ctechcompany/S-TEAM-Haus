/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
var seguir1 = true;
var seguir2 = true;
var seguir3 = true;
var seguir4 = true;
var seguir5 = true;
var seguir6 = true;
var seguir7 = true;
var seguir8 = true;
var seguir9 = true;
var seguir10 = true;
var seguirTodo = true;




function validarCorreo() {
    const correo = document.getElementById("correo_electronico");
    const mensajeCorreo = document.getElementById("mensajeCorreo");
    const correoRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (!correoRegex.test(correo.value)) {
        mensajeCorreo.textContent = "Formato de correo inválido (Ejemplo: correo@gmail.com)";
        seguir1 = false;
    } else {
        mensajeCorreo.textContent = "";
        seguir1 = true;
    }
}

function validarNombreUsuario() {
    const nombreUsuario = document.getElementById("nombre_envio");
    const mensajeNombre_envio = document.getElementById("mensajeNombre_envio");
    const usuarioRegex = /^[a-zA-Z\s]{5,30}$/;

    if (!usuarioRegex.test(nombreUsuario.value)) {
        mensajeNombre_envio.textContent = "El nombre solo debe tener letras sin simbolos";
        seguir2 = false;
    } else {
        mensajeNombre_envio.textContent = "";
        seguir2 = true;
    }
}

function validarApellidoUsuario() {
    const nombreUsuario = document.getElementById("apellidos_envio");
    const mensajeApellidos_envio = document.getElementById("mensajeApellidos_envio");
    const usuarioRegex = /^[a-zA-Z\s]{1,30}$/;

    if (!usuarioRegex.test(nombreUsuario.value)) {
        mensajeApellidos_envio.textContent = "El apellido solo puede contener letras";
        seguir3 = false;
    } else {
        mensajeApellidos_envio.textContent = "";
        seguir3 = true;
    }
}



function validarCalle() {
    const calle = document.getElementById("calle");
    const mensajeCalle = document.getElementById("mensajeCalle");
    const calleRegex = /^[a-zA-Z0-9\s]{1,40}$/;

    if (!calleRegex.test(calle.value)) {
        mensajeCalle.textContent = "La calle solo puede contener letras y numeros";
        seguir4 = false;
    } else {
        mensajeCalle.textContent = "";
        seguir4 = true;
    }
}

function validarNumExt() {
    const numeroExt = document.getElementById("numero_exterior");
    const mensajeNumeroExt = document.getElementById("mensajeNumeroExt");
    const numeroExtRegex = /^[a-zA-Z0-9]{1,40}$/;

    if (!numeroExtRegex.test(numeroExt.value)) {
        mensajeNumeroExt.textContent = "Solo puede contener letras y numeros";
        seguir5 = false;
    } else {
        mensajeNumeroExt.textContent = "";
        seguir5 = true;
    }
}

function validarNumInt() {
    const numeroInt = document.getElementById("numero_interior");
    const mensajeNumeroInt = document.getElementById("mensajeNumeroInt");
    const numeroIxtRegex = /^[a-zA-Z0-9]{0,40}$/;

    if (!numeroIxtRegex.test(numeroInt.value)) {
        mensajeNumeroInt.textContent = "Solo puede contener letras y numeros";
        seguir6 = false;
    } else {
        mensajeNumeroInt.textContent = "";
        seguir6 = true;
    }
}

function validarColonia() {
    const colonia = document.getElementById("colonia");
    const mensajeColonia = document.getElementById("mensajeColonia");
    const numeroExtRegex = /^[a-zA-Z0-9._\s-]{1,40}$/;

    if (!numeroExtRegex.test(colonia.value)) {
        mensajeColonia.textContent = "Solo puede contener letras, numeros y algunos símbolos";
        seguir7 = false;
    } else {
        mensajeColonia.textContent = "";
        seguir7 = true;
    }
}

function validarAlcaliaMunicipio() {
    const alcaldia_municipio = document.getElementById("alcaldia_municipio");
    const mensajeAlcaliaMunicipio = document.getElementById("mensajeAlcaliaMunicipio");
    const alcaliaMunicipioRegex = /^[a-zA-Z0-9._\s-]{1,40}$/;

    if (!alcaliaMunicipioRegex.test(alcaldia_municipio.value)) {
        mensajeAlcaliaMunicipio.textContent = "Solo puede contener letras, numeros y algunos símbolos";
        seguir8 = false;
    } else {
        mensajeAlcaliaMunicipio.textContent = "";
        seguir8 = true;
    }
}

function validarCodigoP() {
    const codigo_postal = document.getElementById("codigo_postal");
    const mensajeCodigoPostal = document.getElementById("mensajeCodigoPostal");
    const alcaliaMunicipioRegex = /^[0-9]{5}$/;

    if (!alcaliaMunicipioRegex.test(codigo_postal.value)) {
        mensajeCodigoPostal.textContent = "Solo puede contener 5 numeros";
        seguir9 = false;
    } else {
        mensajeCodigoPostal.textContent = "";
        seguir9 = true;
    }
}

function validarTelefono() {
    const telefono = document.getElementById("telefono_contacto");
    const mensajeTelefono = document.getElementById("mensajeTelefono");
    const alcaliaMunicipioRegex = /^[0-9_\s-]{10,20}$/;

    if (!alcaliaMunicipioRegex.test(telefono.value)) {
        mensajeTelefono.textContent = "Solo puede numeros y algunos simbolos";
        seguir10 = false;
    } else {
        mensajeTelefono.textContent = "";
        seguir10 = true;
    }
}

function validarFormulario() {
    let esValido = true;

    const correoElectronico = document.getElementById('correo_electronico').value;
    const nombreEnvio = document.getElementById('nombre_envio').value;
    const apellidosEnvio = document.getElementById('apellidos_envio').value;
    const pais = document.getElementById('pais').value;
    const estado = document.getElementById('estado').value;
    const calle = document.getElementById('calle').value;
    const numeroInterior = document.getElementById('numero_interior').value;
    const numeroExterior = document.getElementById('numero_exterior').value;
    const colonia = document.getElementById('colonia').value;
    const alcaldiaMunicipio = document.getElementById('alcaldia_municipio').value;
    const codigoPostal = document.getElementById('codigo_postal').value;
    const telefonoContacto = document.getElementById('telefono_contacto').value;
    validarCorreo();
    validarNombreUsuario();
    validarApellidoUsuario();
    validarCalle();
    validarNumExt();
    validarColonia();
    validarAlcaliaMunicipio();
    validarCodigoP();
    validarTelefono();
    
    if(seguir1===true && seguir2===true && seguir3===true && seguir4===true && seguir5===true && seguir6===true && seguir7===true && seguir8===true && seguir9===true && seguir10===true){
        seguirTodo=true;
    } else {
        seguirTodo=false;
    }

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
        {elemento: "correo_electronico", funcion: validarCorreo},
        {elemento: "nombre_envio", funcion: validarNombreUsuario},
        {elemento: "apellidos_envio", funcion: validarApellidoUsuario},
        {elemento: "calle", funcion: validarCalle},
        {elemento: "numero_exterior", funcion: validarNumExt},
        {elemento: "numero_interior", funcion: validarNumInt},
        {elemento: "colonia", funcion: validarColonia},
        {elemento: "alcaldia_municipio", funcion: validarAlcaliaMunicipio},
        {elemento: "codigo_postal", funcion: validarCodigoP},
        {elemento: "telefono_contacto", funcion: validarTelefono}
    ];

    campos.forEach(campo => {
        const input = document.getElementById(campo.elemento);
        input.addEventListener("blur", campo.funcion);
        input.addEventListener("keyup", campo.funcion);
    });
});

