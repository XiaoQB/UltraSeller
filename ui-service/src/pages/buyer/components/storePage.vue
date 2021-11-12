<template>
  <div id="storePage" class="storePage">
    <el-header style="width: 30%; height: 30%; margin: auto">
      <img class="logo" src="@/assets/store_logo.png" />
    </el-header>
    <el-main>
      <el-input
        class="input"
        placeholder="请输入商品"
        :v-model="input"
        clearable
      >
      </el-input>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <el-button class="search-button" type="primary">搜索</el-button>
      <div class="goods" @change="updateCommodityData()">
        <el-row>
          <el-col :span="4">
            <el-card
              class="card"
              :body-style="{ padding: auto }"
              shadow="hover"
            >
              <img src="imgLink" class="item-image" prop="commodity.img" />
              <div style="padding: 5px">
                <el-descriptions title="商品信息" :column="1">
                  <el-descriptions-item label="名字" prop="commodity.name">
                  </el-descriptions-item>
                  <el-descriptions-item
                    label="描述"
                    prop="commodity.description"
                  ></el-descriptions-item>
                  <el-descriptions-item
                    label="库存"
                    prop="commodity.inventory"
                  ></el-descriptions-item>
                  <el-descriptions-item label="分类" prop="commodity.type">
                    <el-tag size="small"></el-tag>
                  </el-descriptions-item>
                  <el-descriptions-item
                    label="价格"
                    prop="commodity.price"
                  ></el-descriptions-item>
                  <el-descriptions-item
                    label="卖家名字"
                    prop="commodity.vendorName"
                  ></el-descriptions-item>
                </el-descriptions>
                <div class="card-action">
                  <el-button type="primary" class="buy-commodity-bottom">
                    买它！
                  </el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </div>
    </el-main>
  </div>
</template>

<script>
export default {
  name: "storePage",
  data() {
    return {
      age: 15,
      input: "",
      commodityData: [
        {
          id: "",
          name: "",
          imgLink: "",
          description: "",
          inventory: 0,
          type: "",
          price: 0,
          vendorName: "",
        },
      ],
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
  mounted: function() {},
  methods: {
    updateCommodityData() {
      this.commodityData = JSON.parse(this.$route.query.commodityData);
    },
  },
};
</script>
<style scoped>
.logo {
  width: 100%;
  height: 100%;
}
</style>
