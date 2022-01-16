import { createApp } from "vue";

import App from "./App.vue";
import router from "./router";
import axios from 'axios'
import VueTableLite from 'vue3-table-lite'
import Pagination from './components/Pagination.vue';
import DashGrap from './components/DashGrap.vue';
import Cleave from 'vue-cleave-component';

require("./bootstrap");

const app = createApp(App);
app.use(router);
app.config.globalProperties.$axios = axios;
app.component('vuetablelite',VueTableLite);
app.component('pagination',Pagination);
app.component('dashqrap',DashGrap);
app.use(Cleave);

app.mount("#app");


