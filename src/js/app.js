import style from '../scss/main.scss'
// require("../assets/robots.txt");

const main = () => {
    document.addEventListener('DOMContentLoaded', (event) => { setTheme() });
    document.getElementById("dark_mode_toggle").addEventListener("click", (event) =>{toggleDarkMode()});

    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('/sw.js')
        });
    }
};
main();

const toggleDarkMode = () => {
    localStorage.setItem('mode', (localStorage.getItem('mode') || 'light') === 'dark' ? 'light' : 'dark');
    setTheme();
}

const setTheme = () => {
    localStorage.getItem('mode') === 'dark' ? document.querySelector('body').classList.add('dark') : document.querySelector('body').classList.remove('dark');
};