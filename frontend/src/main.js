import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
import 'firebase/compat/firestore';

/* code from our Firebase console */
const firebaseConfig = {
    apiKey: 'AIzaSyC7yT4IgWad243U0KOEstQy361hRo9RfIo',
    authDomain: 'localhost',
    projectId: 'food-order-ce173',
    storageBucket: "",
    messagingSenderId: "",
    appId: "1:529975016184:android:70b71fcd7b779c2d3d990d",
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);


const app = createApp(App)
    app.use(router)
    app.use(store)
    app.mount('#app')

// npm install vue-router