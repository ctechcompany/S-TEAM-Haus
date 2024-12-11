/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function toggleOptions(element, show = true) {
    // Alterna el estado activo del select actual
    if (show) {
        element.classList.add("active");
    } else {
        element.classList.remove("active");
    }
}

// Cambia el texto al seleccionar una opción y oculta el menú
function selectOption(option, event) {
    event.stopPropagation(); // Evita que el clic se propague al contenedor
    const selectedValue = option.textContent; // Obtener el valor seleccionado

    // Aquí puedes hacer una solicitud para enviar el valor seleccionado a un JSP
    fetch('cursoOTTOBOT.jsp', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'selectedValue=' + encodeURIComponent(selectedValue) // Envía el valor seleccionado
    })
    .then(response => response.text())
    .then(data => {
        console.log('Respuesta del servidor:', data);
        // Maneja la respuesta del servidor aquí si es necesario
    })
    .catch(error => console.error('Error al enviar la opción:', error));

    // Actualiza el display del select con el valor seleccionado
    const display = option.closest('.custom-select').querySelector('.select-display');
    display.innerHTML = `<h1>${selectedValue}</h1>`; // Cambia el texto del display

    // Cierra el menú
    toggleOptions(option.closest('.custom-select'), false);
}

// Cierra el select al hacer clic fuera de él
document.addEventListener('click', function(event) {
    const selects = document.querySelectorAll('.custom-select');
    selects.forEach(select => {
        if (!select.contains(event.target)) {
            select.classList.remove('active');
        }
    });
});

