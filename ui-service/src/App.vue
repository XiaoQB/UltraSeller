<template>
  <div id="app">
    <el-header class="store-menu" :hidden="hideMenu">
      <el-menu
        @change="handleMenu()"
        :default-active="currentPage"
        mode="horizontal"
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
        <el-menu-item index="/buyerWallet" :disabled="!hideLogin"
          >我的钱包</el-menu-item
        >
        <el-menu-item class="user-login" index="/login" style="float: right">
          <div :hidden="hideLogin">
            <el-avatar :size="50" :src="currentImg" @error="userImageHandler()">
            </el-avatar>
            <a href="/login" style="marginLeft: 20px">登录/注册</a>
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
      userData: {
        userName: "",
        userImg: "",
        userRole: "",
      },
      currentPage: "/storePage",
      hideLogin: false,
      currentImg: "",
      defaultImg:
        "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
    };
  },
  mounted() {
    this.handleUser();
    this.handleMenu();
  },
  updated: {},
  methods: {
    handleMenu() {
      if (
        this.$route.path === "/" ||
        this.$route.path === "/storePage" ||
        this.$route.path === "/buyerOrder" ||
        this.$route.path === "/messageCenter" ||
        this.$route.path === "/buyerWallet"
      ) {
        this.hideMenu = false;
      } else {
        this.hideMenu = true;
      }
        this.handleUser();
    },
    handleUser() {
      this.userImageHandler();
      this.userData.userName = this.$route.query.userName;
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
      this.userData.userImg = this.$route.query.userImg;
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
    $route: "handleMenu",
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
</style>
