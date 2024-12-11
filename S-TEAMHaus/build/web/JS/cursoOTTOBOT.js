/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.querySelectorAll('.module-select li').forEach(item => {
    item.addEventListener('click', (e) => {
        const url = e.target.getAttribute('data-url');
        document.getElementById('content-iframe').src = url;
    });
});

// Responsive sidebar toggle
const toggleSidebar = document.getElementById('toggle-sidebar');
const sidebar = document.querySelector('.sidebar');

toggleSidebar.addEventListener('click', () => {
    sidebar.classList.toggle('active');
    toggleSidebar.textContent = sidebar.classList.contains('active') ? 'Ocultar Módulos' : 'Ver Módulos';
});

// Close sidebar when clicking outside on mobile
document.addEventListener('click', (e) => {
    if (window.innerWidth <= 768 && !sidebar.contains(e.target) && e.target !== toggleSidebar) {
        sidebar.classList.remove('active');
        toggleSidebar.textContent = 'Ver Módulos';
    }
});

// Update button text on window resize
window.addEventListener('resize', () => {
    if (window.innerWidth > 768) {
        toggleSidebar.textContent = 'Ver Módulos';
        sidebar.classList.remove('active');
    }
});
