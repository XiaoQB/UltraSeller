<template>
  <div class="buyer">
    
    <el-header style="width: 30%; height: 30%; margin: auto">
      <img class="logo" src="@/assets/store_logo.png" />
    </el-header>
    <el-main>
    </el-main>
    <el-footer>
      <div></div>
    </el-footer>
  </div>
</template>

<script>
export default {
  name: "buyer",
  data() {
    return {
      input: "",
      pageSize: 24,
      totalItems: 6,
      userData: {
        userName: "",
        userImg: "",
      },
    };
  },
  mounted() {
  },
  methods: {
    handlePage() {
      console.log(this.currentPage);
    },
    handleSelect(key, keyPath) {
      console.log(key, keyPath)
    },
    passData() {
      this.$router.push;
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.user-login {
  margin-right: 20px;
}

.input {
  width: 60%;
  display: inline-block;
}

.logo {
  width: 100%;
  height: 100%;
}

.goods {
  width: 100%;
  height: 100%;
  margin-top: 50px;
}

.item-image {
  width: 100%;
  display: block;
}

.pagination {
  margin-top: 30px;
}

.buy-commodity-bottom {
  float: left;
  margin-left: 0px;
}

.edit-commodity-bottom {
  float: right;
  margin-left: 0px;
}
</style>
