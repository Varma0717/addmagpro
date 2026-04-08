import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ['Inter', ...defaultTheme.fontFamily.sans],
                display: ['Outfit', ...defaultTheme.fontFamily.sans],
            },
            colors: {
                brand: {
                    50: '#fff7ed', 100: '#ffedd5', 200: '#fed7aa', 300: '#fdba74',
                    400: '#fb923c', 500: '#f97316', 600: '#ea580c', 700: '#c2410c',
                    800: '#9a3412', 900: '#7c2d12', 950: '#431407',
                },
                surface: {
                    50: '#fafafa', 100: '#f5f5f5', 200: '#e5e5e5', 300: '#d4d4d4',
                    400: '#a3a3a3', 500: '#737373', 600: '#525252', 700: '#404040',
                    800: '#262626', 900: '#171717', 950: '#0a0a0a',
                },
            },
            boxShadow: {
                soft: '0 2px 15px -3px rgba(0,0,0,0.07), 0 10px 20px -2px rgba(0,0,0,0.04)',
                glow: '0 0 20px rgba(249,115,22,0.15)',
                card: '0 1px 3px rgba(0,0,0,0.04), 0 6px 16px rgba(0,0,0,0.04)',
            },
            borderRadius: {
                '2xl': '1rem',
                '3xl': '1.5rem',
            },
            animation: {
                'fade-in': 'fadeIn 0.5s ease-out',
                'slide-up': 'slideUp 0.4s ease-out',
                'scale-in': 'scaleIn 0.3s ease-out',
            },
            keyframes: {
                fadeIn: { '0%': { opacity: '0' }, '100%': { opacity: '1' } },
                slideUp: { '0%': { opacity: '0', transform: 'translateY(10px)' }, '100%': { opacity: '1', transform: 'translateY(0)' } },
                scaleIn: { '0%': { opacity: '0', transform: 'scale(0.95)' }, '100%': { opacity: '1', transform: 'scale(1)' } },
            },
        },
    },

    plugins: [forms],
};
