<template>
  <div class="store">
    <el-header class="store-menu">
      <el-menu
        :default-active="storePage"
        mode="horizontal"
        @select="handleSelect"
        background-color="#545c64"
        text-color="#fff"
        active-text-color="#ffd04b"
      >
        <el-menu-item index="store-page" route="/">商品页面</el-menu-item>
        <el-menu-item index="my-orders-page">我的订单</el-menu-item>
        <el-menu-item index="message-center-page" disabled
          >消息中心
        </el-menu-item>
        <el-menu-item index="wallet">我的钱包</el-menu-item>
        <el-menu-item
          class="user-login"
          index="to-login"
          style="float: right"
          @change="handleUser()"
          @click="onclick"
        >
          <div :hidden="hideLogin">
            <el-avatar :size="50" :src="circleUrl" @error="userImageHandler()">
              <img
                :src="currentImg"
              />
            </el-avatar>
            <a href="/login" style="marginLeft: 20px">登录/注册</a>
          </div>
          <div :hidden="!hideLogin">
            <el-avatar :size="50" :src="circleUrl" @error="userImageHandler()">
              <img
                src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"
              />
            </el-avatar>
            <span style="marginLeft: 20px" :aria-label="userData.userName"
              >{{userData.userName}}</span
            >
          </div>
        </el-menu-item>
      </el-menu>
    </el-header>
    <el-header style="width: 30%; height: 30%; margin: auto">
      <img class="logo" src="@/assets/store_logo.png" />
    </el-header>
    <el-main>
      <el-input
        class="input"
        placeholder="请输入商品"
        v-model="input"
        clearable
      >
      </el-input>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <el-button class="search-button" type="primary">搜索</el-button>
      <div class="goods">
        <el-row>
          <el-col :span="4" v-for="(o, index) in totalItems" :key="o">
            <el-card
              class="card"
              :body-style="{ padding: auto }"
              shadow="hover"
            >
              <img
                src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                class="item-image"
              />
              <div style="padding: 5px">
                <el-descriptions title="商品信息" :column="1">
                  <el-descriptions-item label="名字"
                    >好吃的汉堡 {{ index }}
                  </el-descriptions-item>
                  <el-descriptions-item label="品牌">McD</el-descriptions-item>
                  <el-descriptions-item label="分类">
                    <el-tag size="small">食品</el-tag>
                  </el-descriptions-item>
                  <el-descriptions-item label="价格"
                    >{{ 10 + index }}
                  </el-descriptions-item>
                </el-descriptions>
                <div class="card-action">
                  <el-button type="primary" class="buy-commodity-bottom">
                    买它！
                  </el-button>
                  <el-button type="text" class="edit-commodity-bottom">
                    <router-link :to="`/commodityManager`"
                      >商品编辑
                    </router-link>
                  </el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
        <div class="pagination">
          <el-pagination
            background
            layout="prev, pager, next, jumper"
            :page-size="pageSize"
            :total="totalItems"
          >
          </el-pagination>
        </div>
      </div>
    </el-main>
    <el-footer>
      <div class="customer-service"></div>
    </el-footer>
  </div>
</template>

<script>
export default {
  name: "store-page",

  data() {
    return {
      storePage: "store-page",
      input: "",
      hideLogin: false,
      currentImg: "",
      defaultImg: "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
      pageSize: 24,
      totalItems: 6,
      userData: {
        userName: "",
        userImg: "",
      },
      Mock: [
        {
          id: "20210101001",
          name: "面包",
          imgLink:
            "https://ts3.cn.mm.bing.net/th/id/OIP-C.305fYj0cWoTv_Q8TIbJ02wHaHG?w=196&h=188&c=7&r=0&o=5&dpr=2&pid=1.7",
          price: "10",
          description: "好吃",
          inventory: "10",
          vendorName: "test01",
        },
        {
          id: "20210101002",
          name: "白酒",
          imgLink:
            "https://ts1.cn.mm.bing.net/th/id/OIP-C.PWh-k1csn9MRuq9-kqf0wwHaLG?w=196&h=293&c=7&r=0&o=5&dpr=2&pid=1.7",
          price: "100",
          description: "一喝就倒",
          inventory: "10",
          vendorName: "test01",
        },
        {
          id: "20210101003",
          name: "卫生纸",
          imgLink:
            "https://ts2.cn.mm.bing.net/th/id/OIP-C.3yAPWpweG_grlE-hx0GSbQHaE7?w=255&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
          price: "10",
          description: "可以擦皮皮",
          inventory: "10",
          vendorName: "test01",
        },
        {
          id: "20210101004",
          name: "矿泉水",
          imgLink:
            "https://ts3.cn.mm.bing.net/th/id/OIP-C.fIfwcxCc6sjAUWxifyiJQAHaHa?w=205&h=205&c=7&r=0&o=5&dpr=2&pid=1.7",
          price: "2",
          description: "没有虫卵的农夫山泉",
          inventory: "25",
          vendorName: "test01",
        },
      ],
    };
  },
  mounted() {
    this.handleUser();
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },

    userImageHandler() {
      this.userData.userImg = this.$route.query.userImg;
      if (this.userData.userImg === ""||
      this.userData.userImg === null || 
      this.userData.userImg === undefined) {
        this.currentImg = this.defaultImg
      } else {
        this.currentImg = this.userData.userImg
      }
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
