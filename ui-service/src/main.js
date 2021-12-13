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

import saler from "@/pages/saler/saler";
import salerOrder from "./pages/saler/salerOrder";
import wallet from "./components/wallet";

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
    },
    {
      name: "salerOrder",
      path: "/salerOrder",
      component: salerOrder,
    },
    {
      name: "wallet",
      path: "/wallet.yaml",
      component: wallet,
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
    },
    {
      name: "messageCenter",
      path: "/messageCenter",
      component: messageCenter,
    },
    {
      name: "buyerCart",
      path: "/buyerCart",
      component: buyerCart,
    },
    {
      name: "buyerWallet",
      path: "/buyerWallet",
      component: buyerWallet,
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
      meta: {
        requireAuth: true,
      },
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

new Vue({
  router,
  render: (h) => h(App),
}).$mount("#app");
