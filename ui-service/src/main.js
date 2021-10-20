import Vue from 'vue'
import App from './App.vue'

import ElementUI from 'element-ui' //element-ui的全部组件
import 'element-ui/lib/theme-chalk/index.css'//element-ui的css
Vue.use(ElementUI) //使用elementUI


import login from "@/components/login";
import adminLogin from "@/components/adminLogin";
import admin from "@/components/admin";

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
            path:'/login',
            component:login
        },
        {
            path:'/adminLogin',
            component:adminLogin
        },
        {
            path:'/admin',
            component:admin
        }
    ]
})
new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
