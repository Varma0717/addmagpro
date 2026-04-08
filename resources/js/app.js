import './bootstrap';

import Alpine from 'alpinejs';

window.Alpine = Alpine;

Alpine.start();

/* Scroll-triggered animations */
if ('IntersectionObserver' in window) {
    const obs = new IntersectionObserver((entries) => {
        entries.forEach(e => { if (e.isIntersecting) { e.target.classList.add('animate-slide-up'); obs.unobserve(e.target); } });
    }, { threshold: 0.1 });
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('[data-animate]').forEach(el => obs.observe(el));
    });
}
