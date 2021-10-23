import Vue from 'vue'
import App from './App.vue'

import ElementUI from 'element-ui' //element-ui的全部组件
import 'element-ui/lib/theme-chalk/index.css'//element-ui的css
Vue.use(ElementUI) //使用elementUI


import login from "@/components/login";
import adminLogin from "@/components/adminLogin";
import admin from "@/components/admin";

import http from './http'
Vue.prototype.http = http;


import VueCookies from 'vue-cookies'
Vue.use(VueCookies)

import VueRouter from "vue-router";
Vue.use(VueRouter)

Vue.config.productionTip = false


const router = new VueRouter({
    mode: 'history',
    routes:[
        {
            name:'login',
            path:'/login',
            component:login,

        },
        {
            name:'adminLogin',
            path:'/adminLogin',
            component:adminLogin
        },
        {
            name:'admin',
            path:'/admin',
            component:admin,
            meta:{
                requireAuth: true,
            }
        },
        {
            name:'store',
            path:'/store',
            component:admin,

        }
    ]
})
new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
