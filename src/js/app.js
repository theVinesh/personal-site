import {FirebaseUtil} from './firebase_util'
import style from '../scss/main.scss'
require("../assets/robots.txt");

const firebaseUtil = new FirebaseUtil();
const main = () => {
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('/sw.js')
        });
    }
    firebaseUtil.initPerformance();
};
main();
