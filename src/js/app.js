import { Analytics } from '../js/analytics/base.js'
require("../scss/main.scss");
require("../assets/robots.txt");

const analytics = new Analytics();

const main = () => {
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('/sw.js')
        });
    }
    
};

main();
