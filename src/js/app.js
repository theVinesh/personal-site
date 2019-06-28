require("../scss/main.scss");
require("../assets/robots.txt");

function init() {
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('/sw.js')
        });
    }
}

init();