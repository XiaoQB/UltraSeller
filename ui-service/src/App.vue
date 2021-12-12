<template>
  <div id="app">
    <el-header class="store-menu" :hidden="hideMenu">
      <el-menu
        :default-active="currentPage"
        mode="horizontal"
        @select="handleSelect"
        @change="handleMenu"
        router
        background-color="#545c64"
        text-color="#fff"
        active-text-color="#ffd04b"
      >
        <el-menu-item index="/storePage">商品页面</el-menu-item>
        <el-menu-item index="/buyerOrder" :disabled="!hideLogin"
          >我的订单</el-menu-item
        >
        <el-menu-item index="/messageCenter" :disabled="!hideLogin"
          >消息中心
        </el-menu-item>
        <el-menu-item index="/buyerCart" :disabled="!hideLogin"
          >我的购物车</el-menu-item
        >
        <el-menu-item class="user-login" index="/login" style="float: right">
          <div :hidden="hideLogin">
            <el-avatar
              :size="50"
              :src="currentImg"
              @error="userImageHandler()"
              @change="handleUser()"
            >
            </el-avatar>
            登录/注册
          </div>
          <div :hidden="!hideLogin">
            <el-avatar
              :size="50"
              src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"
              @error="userImageHandler()"
            >
            </el-avatar>
            <span style="marginLeft: 20px" :aria-label="userData.userName">{{
              userData.userName
            }}</span>
          </div>
        </el-menu-item>
        <el-menu-item
          index="/buyerWallet"
          :disabled="!hideLogin"
          style="float: right"
        >
          <span class="user-wallet-text" :aria-label="userData.userWallet"
            >钱包余额:  {{ userData.userWallet }}</span
          >
        </el-menu-item>
      </el-menu>
    </el-header>
    <router-view></router-view>
  </div>
</template>
<script src="main.js"></script>
<script>
//mport HelloWorld from './components/HelloWorld.vue'

export default {
  name: "App",
  components: {
    // eslint-disable-next-line vue/no-unused-components
  },
  data() {
    return {
      hideMenu: false,
      storePage: "storePage",
      userData: {
        token: "",
        userName: "",
        userImg: "",
        userRole: "",
        userWallet: "",
      },
      currentPage: "/storePage",
      hideLogin: false,
      currentImg: "",
      defaultImg:
        "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
    };
  },
  mounted() {
    this.handleMenu();
    this.userImageHandler();
  },
  updated() {},
  methods: {
    handleMenu() {
      if (
        this.$route.path === "/" ||
        this.$route.path === "/storePage" ||
        this.$route.path === "/buyerOrder" ||
        this.$route.path === "/messageCenter" ||
        this.$router.path === "/buyerCart" ||
        this.$route.path === "/buyerWallet"
      ) {
        this.hideMenu = false;
      } else {
        this.hideMenu = true;
      }
    },
    handleSelect(key) {
      this.currentPage = key;
    },
    handleUser() {
      this.userData.userName = localStorage.getItem("user_name");
      this.userData.token = localStorage.getItem("token");
      this.userData.userWallet = localStorage.getItem("user_wallet");
      this.userImageHandler();
      if (
        this.userData.userName === "" ||
        this.userData.userName === null ||
        this.userData.userName === undefined
      ) {
        this.hideLogin = false;
      } else {
        this.hideLogin = true;
      }
    },
    userImageHandler() {
      this.userData.userImg = "";
      if (
        this.userData.userImg === "" ||
        this.userData.userImg === null ||
        this.userData.userImg === undefined
      ) {
        this.currentImg = this.defaultImg;
      } else {
        this.currentImg = this.userData.userImg;
      }
    },
  },
  watch: {
    $route() {
      this.handleMenu();
      this.handleUser();
    },
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  /* margin-top: 60px; */
}
.logo {
  width: 100%;
  height: 100%;
}
.user-wallet-text {
  font-size: 20px;
}
</style>
