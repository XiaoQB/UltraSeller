import Vue from "vue";
import App from "./App.vue";

import ElementUI from "element-ui"; //element-ui的全部组件
import "element-ui/lib/theme-chalk/index.css"; //element-ui的css
Vue.use(ElementUI); //使用elementUI

import adminLogin from "@/pages/adminLogin";
import admin from "@/pages/admin";
import commodityManager from "@/components/commodityManager";

import login from "@/pages/login";
import storePage from "@/pages/buyer/components/storePage";
import buyerOrder from "@/pages/buyer/components/buyerOrder";
import messageCenter from "@/pages/buyer/components/messageCenter";
import buyerCart from "@/pages/buyer/components/buyerCart";
import buyerWallet from "@/pages/buyer/components/buyerWallet";

import saler from "./pages/saler/components/saler";
import salerOrder from "./pages/saler/components/salerOrder";
import wallet from "./pages/saler/components/wallet";
import message from "./pages/saler/components/message";

import error from "@/pages/404";
import http from "./http";

Vue.prototype.http = http;

import VueCookies from "vue-cookies";

Vue.use(VueCookies);

import VueRouter from "vue-router";

Vue.use(VueRouter);

Vue.config.productionTip = false;

const router = new VueRouter({
  mode: "history",
  routes: [
    {
      path: "/",
      redirect: '/storePage'
    },
    {
      name: "saler",
      path: "/saler",
      component: saler,
      meta:{
        requireAuth: true
      }
    },
    {
      name: "salerOrder",
      path: "/salerOrder",
      component: salerOrder,
      meta:{
        requireAuth: true
      }
    },
    {
      name: "wallet",
      path: "/wallet",
      component: wallet,
      meta:{
        requireAuth: true
      }
    },
    {
      name: "message",
      path: "/message",
      component: message,
      meta:{
        requireAuth: true
      }
    },
    {
      name: "storePage",
      path: "/storePage",
      component: storePage,
    },
    {
      name: "buyerOrder",
      path: "/buyerOrder",
      component: buyerOrder,
      meta:{
        requireAuth: true
      }
    },
    {
      name: "messageCenter",
      path: "/messageCenter",
      component: messageCenter,
      meta:{
        requireAuth: true
      }
    },
    {
      name: "buyerCart",
      path: "/buyerCart",
      component: buyerCart,
      meta:{
        requireAuth: true
      }
    },
    {
      name: "buyerWallet",
      path: "/buyerWallet",
      component: buyerWallet,
      meta:{
        requireAuth: true
      }
    },
    {
      path: "/login",
      component: login,
    },
    {
      name: "adminLogin",
      path: "/adminLogin",
      component: adminLogin,
    },
    {
      name: "admin",
      path: "/admin",
      component: admin,
    },
    {
      name: "commodityManager",
      path: "/commodityManager",
      component: commodityManager,
      meta: {
        requireAuth: true,
      },
    },
    {
      path: "*",
      name: "404",
      component: error,
    },
  ],
});
router.beforeEach((to, from ,next)=>{
  if(to.matched.some((r)=>r.meta.requireAuth)){
    let user = sessionStorage['user_name'];
    if(user){
      next();
    }else{
      next({
        path:"/login",
        query: {redirect: to.fullPath}
      })
    }
  }else{
    next();
  }
});
new Vue({
  router,
  render: (h) => h(App),
}).$mount("#app");

export default VueRouter;