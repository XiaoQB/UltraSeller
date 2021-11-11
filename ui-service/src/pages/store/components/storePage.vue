<template>
  <div id="storePage" class="storePage">
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
                  <el-descriptions-item label="名字" prop="commodity.name"
                    >
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
    };
  },
  mounted: function() {
    
  },
  methods: {
    updateCommodityData() {
      this.commodityData = JSON.parse(this.$route.query.commodityData)
    },
  }
};
</script>
