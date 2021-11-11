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
        <el-menu-item index="store-page">商品页面</el-menu-item>
        <el-menu-item index="my-orders-page">我的订单</el-menu-item>
        <el-menu-item index="message-center-page" disabled
        >消息中心
        </el-menu-item
        >
        <el-menu-item
            index="to-login"
            style="float: right"
            @change="handleUser"
            @click="onclick"
        >
          <el-col :span="12">
            <div class="user-image">
              <el-avatar :size="50" :src="circleUrl" @error="UserImageHandler">
                <img
                    src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"
                />
              </el-avatar>
            </div>
          </el-col>
          <a href="/login">登录/注册</a>
        </el-menu-item>
      </el-menu>
    </el-header>
    <el-header style="width: 30%; height: 30%; margin: auto">
      <img class="logo" src="@/assets/store_logo.png"/>
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
                  </el-descriptions-item
                  >
                  <el-descriptions-item label="品牌">McD</el-descriptions-item>
                  <el-descriptions-item label="分类">
                    <el-tag size="small">食品</el-tag>
                  </el-descriptions-item>
                  <el-descriptions-item label="价格">{{
                      10 + index
                    }}
                  </el-descriptions-item>
                </el-descriptions>
                <div class="card-action">
                  <el-button type="primary" class="buy-commodity-bottom">
                    买它！
                  </el-button>
                  <el-button type="text" class="edit-commodity-bottom">
                    <router-link :to="`/commodityManager`"
                    >商品编辑
                    </router-link
                    >
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
      // currentDate: new Date()
      pageSize: 24,
      totalItems: 6,
    };
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },

    UserImageHandler() {
      return true;
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.user-image {
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
