<template>
  <div id="storePage" class="storePage">
    <el-header style="width: 30%; height: 30%; margin: auto">
      <img class="logo" src="@/assets/store_logo.png" />
    </el-header>
    <el-main>
      <el-input
        class="input"
        placeholder="请输入商品名"
        v-model="input"
        clearable
        style="width: 600px"
      >
      </el-input>
      <el-button
        class="search-button"
        type="primary"
        @click="doSearch()"
        style="marginLeft: 20px"
        >搜索商品</el-button
      >
      <div class="goods" @change="updateCommodityData()">
        <!-- <el-row>
          <el-col
            :span="4"
            v-for="(cardKey, index) in this.mock"
            :key="cardKey"
          >
            <el-card
              class="card"
              :body-style="{ padding: auto }"
              shadow="hover"
              :key="index"
            >
              <div style="padding: 5px">
                <img :src="commidityData_imgLink" class="item-image" />
                <el-descriptions title="商品信息" column="1">
                  <el-descriptions-item label="名字">
                    {{ commodityData_name }}</el-descriptions-item
                  >
                  <el-descriptions-item label="描述">{{
                    commodityData_description
                  }}</el-descriptions-item>
                  <el-descriptions-item label="库存">{{
                    commodityData_inventory
                  }}</el-descriptions-item>
                  <el-descriptions-item label="分类">
                    <el-tag size="small">{{ commodityData_type }}</el-tag>
                  </el-descriptions-item>
                  <el-descriptions-item label="价格">{{
                    commodityData_price
                  }}</el-descriptions-item>
                  <el-descriptions-item label="卖家名字">{{
                    commodityData_vendorName
                  }}</el-descriptions-item>
                </el-descriptions>
                <div class="card-action">
                  <el-button
                    type="primary"
                    class="buy-commodity-bottom"
                    @click="handleBuyClick()"
                  >
                    买它！
                  </el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row> -->
        <el-row>
          <el-col :span="4">
            <el-card
              class="card"
              :body-style="{ padding: auto }"
              shadow="hover"
            >
              <div style="padding: 5px">
                <img :src="mock[0].imgLink" class="item-image" />
                <el-descriptions title="商品信息" column="1">
                  <el-descriptions-item label="名字">
                    {{ mock[0].name }}</el-descriptions-item
                  >
                  <el-descriptions-item label="描述">{{
                    mock[0].description
                  }}</el-descriptions-item>
                  <el-descriptions-item label="库存">{{
                    mock[0].inventory
                  }}</el-descriptions-item>
                  <el-descriptions-item label="分类">
                    <el-tag size="small">{{ mock[0].type }}</el-tag>
                  </el-descriptions-item>
                  <el-descriptions-item label="价格">{{
                    mock[0].price
                  }}</el-descriptions-item>
                  <el-descriptions-item label="卖家名字">{{
                    mock[0].vendorName
                  }}</el-descriptions-item>
                </el-descriptions>
                <div class="card-action">
                  <el-button
                    type="primary"
                    class="buy-commodity-bottom"
                    @click="handleBuyClick()"
                  >
                    买它！
                  </el-button>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              class="card"
              :body-style="{ padding: auto }"
              shadow="hover"
            >
              <div style="padding: 5px">
                <img :src="mock[1].imgLink" class="item-image" />
                <el-descriptions title="商品信息" column="1">
                  <el-descriptions-item label="名字">
                    {{ mock[1].name }}</el-descriptions-item
                  >
                  <el-descriptions-item label="描述">{{
                    mock[1].description
                  }}</el-descriptions-item>
                  <el-descriptions-item label="库存">{{
                    mock[1].inventory
                  }}</el-descriptions-item>
                  <el-descriptions-item label="分类">
                    <el-tag size="small">{{ mock[0].type }}</el-tag>
                  </el-descriptions-item>
                  <el-descriptions-item label="价格">{{
                    mock[1].price
                  }}</el-descriptions-item>
                  <el-descriptions-item label="卖家名字">{{
                    mock[1].vendorName
                  }}</el-descriptions-item>
                </el-descriptions>
                <div class="card-action">
                  <el-button
                    type="primary"
                    class="buy-commodity-bottom"
                    @click="handleBuyClick()"
                  >
                    买它！
                  </el-button>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              class="card"
              :body-style="{ padding: auto }"
              shadow="hover"
            >
              <div style="padding: 5px">
                <img :src="mock[2].imgLink" class="item-image" />
                <el-descriptions title="商品信息" column="1">
                  <el-descriptions-item label="名字">
                    {{ mock[2].name }}</el-descriptions-item
                  >
                  <el-descriptions-item label="描述">{{
                    mock[2].description
                  }}</el-descriptions-item>
                  <el-descriptions-item label="库存">{{
                    mock[2].inventory
                  }}</el-descriptions-item>
                  <el-descriptions-item label="分类">
                    <el-tag size="small">{{ mock[0].type }}</el-tag>
                  </el-descriptions-item>
                  <el-descriptions-item label="价格">{{
                    mock[2].price
                  }}</el-descriptions-item>
                  <el-descriptions-item label="卖家名字">{{
                    mock[2].vendorName
                  }}</el-descriptions-item>
                </el-descriptions>
                <div class="card-action">
                  <el-button
                    type="primary"
                    class="buy-commodity-bottom"
                    @click="handleBuyClick()"
                  >
                    买它！
                  </el-button>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              class="card"
              :body-style="{ padding: auto }"
              shadow="hover"
            >
              <div style="padding: 5px">
                <img :src="mock[3].imgLink" class="item-image" />
                <el-descriptions title="商品信息" column="1">
                  <el-descriptions-item label="名字">
                    {{ mock[3].name }}</el-descriptions-item
                  >
                  <el-descriptions-item label="描述">{{
                    mock[3].description
                  }}</el-descriptions-item>
                  <el-descriptions-item label="库存">{{
                    mock[3].inventory
                  }}</el-descriptions-item>
                  <el-descriptions-item label="分类">
                    <el-tag size="small">{{ mock[0].type }}</el-tag>
                  </el-descriptions-item>
                  <el-descriptions-item label="价格">{{
                    mock[3].price
                  }}</el-descriptions-item>
                  <el-descriptions-item label="卖家名字">{{
                    mock[3].vendorName
                  }}</el-descriptions-item>
                </el-descriptions>
                <div class="card-action">
                  <el-button
                    type="primary"
                    class="buy-commodity-bottom"
                    @click="handleBuyClick()"
                  >
                    买它！
                  </el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </div>
      <div class="pagination">
        <el-pagination
          background
          layout="prev, pager, next, jumper"
          :page-size="pageSize"
          :total="totalItems"
        >
        </el-pagination>
      </div>
    </el-main>
  </div>
</template>

<script>
import { baseURL } from "@/http";
const commodityUrl = baseURL;
export default {
  name: "storePage",

  data() {
    return {
      num: 0,
      input: "",
      totalItems: 6,
      pageSize: 24,
      commodityData_id: "",
      commodityData_name: "",
      commodityData_imgLink: "",
      commodityData_description: "",
      commodityData_inventory: 0,
      commodityData_type: "",
      commodityData_price: 0,
      commodityData_vendorName: "",
      mock: [
        {
          id: "20210101001",
          name: "面包",
          imgLink:
            "https://ts3.cn.mm.bing.net/th/id/OIP-C.305fYj0cWoTv_Q8TIbJ02wHaHG?w=196&h=188&c=7&r=0&o=5&dpr=2&pid=1.7",
          price: "10",
          type: "食品",
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
          type: "饮品",
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
          type: "生活用品",
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
          type: "饮品",
          description: "没有虫卵的农夫山泉",
          inventory: "25",
          vendorName: "test01",
        },
      ],
    };
  },
  mounted() {
    this.updateCommodityData();
    this.num = this.Mock.length;
  },
  methods: {
    updateCommodityData() {
      this.http({
        headers: {
          token: localStorage["token"],
        },
        method: "get",
        url: `${commodityUrl}/commodity/lists`,
        params: {
          username: localStorage.getItem("user_id"),
          page: 1,
          pagesize: 10,
          seq: 0,
        },
      })
        .then((response) => {
          this.commodityData_id = response.data.id;
        })
        .catch(function(error) {
          this.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
    },
    doSearch(search) {
      this.http({
        headers: {
          token: localStorage["token"],
        },
        method: "get",
        url: `/commidity/search`,
        params: {
          q: search,
          pagesize: this.pageSize,
          page: this.currentPage,
          seq: 0,
        },
      }).then((res) => {
        if (res.data.code() === 200) {
          this.commodityList = res.data.rows;
          this.dataTotalCount = res.data.records;
        } else {
          this.$message({
            type: "error",
            message: "系统异常：",
          });
        }
      });
    },
    handleBuyClick() {
      console.log("买了");
    },
  },
};
</script>
<style scoped>
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
  height: 200px;
  display: block;
}
.pagination {
  margin-top: 30px;
}
.buy-commodity-bottom {
  float: center;
  margin-top: 10px;
}
</style>
