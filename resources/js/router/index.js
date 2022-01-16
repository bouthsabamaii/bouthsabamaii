import { createWebHistory, createRouter } from "vue-router";
import Store from "../pages/Store.vue";
import Pos from "../pages/Pos.vue";
import Report from "../pages/Report.vue";
import Transection from "../pages/Transection.vue";
import User from "../pages/User.vue";
import Notfound from "../pages/Notfound.vue"
import Login from "../pages/Login.vue"
import Register from "../pages/register.vue"

export const routes = [
    {
        name: "login2",
        path: "/login",
        component: Login,
    },
    {
        name: "login",
        path: "/",
        component: Login,
    },
    {
        name: "register",
        path: "/register",
        component: Register,
    },
    {
        name: "store",
        path: "/store",
        component: Store,
    },
    {
        name: "pos",
        path: "/pos",
        component: Pos,
    },
    {
        name: "report",
        path: "/report",
        component: Report,
    },
    {
        name: "transection",
        path: "/transection",
        component: Transection,
    },
    {
        name: "user",
        path: "/user",
        component: User,
    },
    {
        path: "/:catchAll(.*)",
        component: Notfound,
      },
];

const router = createRouter({
    history: createWebHistory(),
    routes: routes,
    scrollBehavior() {
        window.scrollTo(0, 0);
    }
});



export default router;
