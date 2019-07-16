import style from '../scss/main.scss'
// require("../assets/robots.txt");

const main = () => {
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('/sw.js')
        });
    }
};
main();
