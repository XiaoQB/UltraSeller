import Vue from 'vue'
import App from './App.vue'

import ElementUI from 'element-ui' //element-ui的全部组件
import 'element-ui/lib/theme-chalk/index.css'//element-ui的css
Vue.use(ElementUI) //使用elementUI


import login from "@/pages/login";
import adminLogin from "@/pages/adminLogin";
import admin from "@/pages/admin";


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
        path:'/login',
        component:login,

    },
    {
        name:'adminLogin',
        path:'/adminLogin',
        component: adminLogin
    },
    {
        name:'admin',
        path:'/admin',
        component: admin,
        meta:{
        requireAuth: true,
    }
    },
    ]
})
new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
