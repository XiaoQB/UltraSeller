import Vue from 'vue'
import App from './App.vue'

import ElementUI from 'element-ui' //element-ui的全部组件
import 'element-ui/lib/theme-chalk/index.css'//element-ui的css
Vue.use(ElementUI) //使用elementUI


import login from "@/pages/login";
import adminLogin from "@/pages/adminLogin";
import admin from "@/pages/admin";
import NotFound from '@/pages/404';
import store from '@/pages/store/index';

import axios from 'axios'
import VueAxios from "vue-axios";
Vue.use(VueAxios, axios)
axios.defaults.baseURL = 'http://localhost:8888/'


import VueCookies from 'vue-cookies'
Vue.use(VueCookies)

import VueRouter from "vue-router";
Vue.use(VueRouter)

Vue.config.productionTip = false


const router = new VueRouter({
    mode: 'history',
    routes:[
        {
            path: '/',
            redirect: '/store',
        },
        {
            path:'/login',
            component:login
        },
        {
            path:'/adminLogin',
            component: adminLogin
        },
        {
            path:'/admin',
            component: admin
        },
        {
            path:'/store',
            component: store
        },
        {
            path: '/404',
            component: NotFound,
        },
        {
            path: '*',
            redirect: '/404',
        },
    ]
})
new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
