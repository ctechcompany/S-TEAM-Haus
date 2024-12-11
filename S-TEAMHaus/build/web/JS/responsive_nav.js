/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener('DOMContentLoaded', function () {
    const menuToggle = document.querySelector('.menu-toggle');
    const nav = document.querySelector('nav');
    const items = document.querySelectorAll('.item');

    menuToggle.addEventListener('click', function () {
        nav.classList.toggle('active');
        menuToggle.textContent = nav.classList.contains('active') ? '✕' : '☰';
    });

    items.forEach(item => {
        item.addEventListener('click', function () {
            if (window.innerWidth <= 768) {
                this.classList.toggle('active');
            }
        });
    });

    window.addEventListener('resize', function () {
        if (window.innerWidth > 768) {
            nav.classList.remove('active');
            items.forEach(item => item.classList.remove('active'));
            menuToggle.textContent = '☰';
        }
    });
});
