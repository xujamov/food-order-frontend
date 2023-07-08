import { createWebHistory, createRouter } from "vue-router";
import Login from '../pages/Login.vue';
import Register from '../pages/Register.vue';
import Home from '../pages/Home.vue';
import About from '../pages/About.vue';
import Promo from '../pages/Promo.vue';
import Menu from '../pages/Menu.vue';
import Table from '../pages/Table.vue';
import Cart from '../pages/Cart.vue';
import Checkout from '../pages/Checkout.vue';
import Thank from '../pages/Thank.vue';
import MyOrder from '../pages/MyOrder.vue';
import Admin from '../admin/Admin.vue';
import Dashboard from '../admin/Dashboard.vue';
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
import 'firebase/compat/firestore';
// import {getCurrentUser} from "vuefire";


const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
    meta: { requiresAuth: false },
  },
  {
    path: "/about",
    name: "About",
    component: About,
    meta: { requiresAuth: false },
  },
  {
    path: "/promotions",
    name: "Promotions",
    component: Promo,
    meta: { requiresAuth: false },
  },
  {
    path: "/menu",
    name: "Menu",
    component: Menu,
    meta: { requiresAuth: false },
  },
  {
    path: "/table",
    name: "Table",
    component: Table,
    meta: { requiresAuth: false },
  },
  {
    path: "/cart",
    name: "Cart",
    component: Cart,
    meta: { requiresAuth: false },
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
    meta: { requiresAuth: false },
  },
  {
    path: "/register",
    name: "Register",
    component: Register,
    meta: { requiresAuth: false },
  },
  {
    path: "/checkout",
    name: "Checkout",
    component: Checkout,
    meta: { requiresAuth: true },
  },
  {
    path: "/thank",
    name: "Thank",
    component: Thank,
    meta: { requiresAuth: true },
  },
  {
    path: "/myorder",
    name: "MyOrder",
    component: MyOrder,
    meta: { requiresAuth: true },
  },
  {
    path: "/admin",
    name: "Admin",
    component: Admin,
    meta: { requiresAuth: false },
  },
  {
    path: "/admin/dashboard",
    name: "Dashboard",
    component: Dashboard,
    meta: { requiresAuth: true },
  },
  {
    path: '/:pathMatch(.*)*',
    component: Home,
    meta: { requiresAuth: false },
    // https://stackoverflow.com/questions/68504803/how-can-i-make-a-catch-all-other-route-in-vue-router-also-catch-the-url-when-p
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach(async (to) => {
  // routes with `meta: { requiresAuth: true }` will check for the users, others won't
  if (to.meta.requiresAuth) {
    const currentUser = await firebase.auth().currentUser
    // if the user is not logged in, redirect to the login page
    if (!currentUser) {
      return {
        path: '/',
        query: {
          // we keep the current path in the query so we can redirect to it after login
          // with `router.push(route.query.redirect || '/')`
          redirect: to.fullPath,
        },
      }
    }
  }
})

export default router;