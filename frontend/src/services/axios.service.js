import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
import 'firebase/compat/firestore';
import axios from "axios";
// axios.defaults.baseURL = import.meta.env.VITE_BASE_URL
// axios.defaults.withCredentials = true

const Axios = axios.create({
    baseURL: 'https://restaurant-ordering-system.onrender.com/api',
    headers: { 'Content-Type': 'application/json' },
})


/* ALL AXIOS REQUESTS */
Axios.interceptors.request.use(
    async (config) => {

        await firebase.auth().currentUser.getIdToken(true).then( function (idToken) {
            config.headers = {
                ...config.headers,
                Authorization: `Bearer ${idToken}`,
            }
            // ...
        }).catch(function (error) {
            // Handle error
            console.log('authError', error)
        });
        return config
    },
    (error) => Promise.reject(error)
)

export const AxiosService = Axios