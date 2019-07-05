import * as firebase from "firebase/app";
import "firebase/performance";

export class FirebaseUtil {
    constructor() {
        firebase.initializeApp({
            apiKey: "AIzaSyAHQUCycYx0VbSPtIPvIpBbUBXPO3gUUmY",
            authDomain: "thevineshdev.firebaseapp.com",
            databaseURL: "https://thevineshdev.firebaseio.com",
            projectId: "thevineshdev",
            storageBucket: "thevineshdev.appspot.com",
            messagingSenderId: "568509925872",
            appId: "1:568509925872:web:604e7a6e0ff6b914"
        });

    }

    initPerformance() {
        const perf = firebase.performance();
    }
}