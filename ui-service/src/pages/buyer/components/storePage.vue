<template>
  <div id="storePage" class="storePage">
    <el-header style="width: 300px; height: 300px; margin: auto">
      <img class="logo" src="@/assets/ultraseller.png" />
    </el-header>
    <el-main>
      <el-input
        class="input"
        placeholder="请输入商品名"
        v-model="search"
        clearable
        style="width: 600px"
      >
      </el-input>
      <el-button
        class="search-button"
        type="primary"
        @click="doSearch(search)"
        style="marginLeft: 20px"
        >搜索商品</el-button
      >
      <el-button
        class="search-button"
        type="primary"
        @click="updateCommodityData()"
        style="marginLeft: 20px"
        >重置</el-button
      >
      <div class="goods" @change="updateCommodityData()">
        <el-card
          class="card"
          v-for="(item, index) in this.commodityList"
          :key="index"
          :body-style="{ padding: 5 }"
          shadow="hover"
        >
          <div style="padding: 5px">
            <img :src="item.imgLink" class="item-image" />
            <el-descriptions
              title="商品信息"
              column="1"
              style="margin-top: 10px"
            >
              <el-descriptions-item label="名字">
                {{ item.name }}</el-descriptions-item
              >
              <el-descriptions-item label="描述">{{
                item.description
              }}</el-descriptions-item>
              <el-descriptions-item label="库存">{{
                item.inventory
              }}</el-descriptions-item>
              <el-descriptions-item label="分类">
                <el-tag size="small">{{ item.keywords }}</el-tag>
              </el-descriptions-item>
              <el-descriptions-item label="价格">{{
                item.price
              }}</el-descriptions-item>
              <el-descriptions-item label="卖家">{{
                item.vendorName
              }}</el-descriptions-item>
            </el-descriptions>
            <div class="card-action">
              <el-button
                :key="index"
                type="primary"
                class="buy-commodity-bottom"
                :disabled="disabledToBuy"
                @click="handleVisible(index)"
              >
                买它!!!!!
              </el-button>
            </div>
          </div>
        </el-card>
        <el-dialog title="创建订单" :visible.sync="dialogFormVisible">
          <el-form :model="userForm">
            <el-form-item label="收获地址:">
              <el-input
                v-model="userForm.userAddress"
                autocomplete="off"
              ></el-input>
            </el-form-item>
            <el-form-item label="请选择购买数量">
              <el-input-number
                v-model="userForm.quantityToBuy"
                placeholder="请选择购买数量"
              >
              </el-input-number>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="doBuyClick()">创 建</el-button>
            <el-button type="primary" @click="doAddToCartClick()"
              >加入购物车</el-button
            >
          </div>
        </el-dialog>
      </div>
      <div class="pagination">
        <el-pagination
          background
          layout="prev, pager, next, jumper"
          :total="records"
          :page-size="pageSize"
          :current-page.sync="currentPage"
        >
        </el-pagination>
      </div>
    </el-main>
  </div>
</template>

<script>
export default {
  name: "storePage",

  data() {
    return {
      curretDate: "",
      search: "",
      commodityIndex: -1, //商品索引
      disabledToBuy: true,
      currentPage: 1,  // 当前页
      records: 0,   // 总数据量
      pageSize: 12,   // 每页显示条数
      commodityList: [],
      dialogFormVisible: false, // 弹出框
      userForm: {
        quantityToBuy: 1, // 购买数量
        userAddress: "二叉楼", // 用户地址
      },
    };
  },
  mounted() {
    this.updateCommodityData();
    this.getCurretDate();
  },
  methods: {
    updateCommodityData() {
      this.http({
        headers: {
          token: sessionStorage.getItem("token"),
          role: sessionStorage.getItem("user_role"),
        },
        method: "GET",
        url: "/api/commodity/listall",
        params: {
          page: this.currentPage,
          pagesize: this.pageSize,
          seq: 0,
        },
      })
        .then((resp) => {
          this.records = resp.data.data.records;
          this.commodityList = resp.data.data.rows;
          if (
            sessionStorage.getItem("user_name") !== null ||
            sessionStorage.getItem("user_name") !== "" ||
            sessionStorage.getItem("user_name") !== undefined
          ) {
            this.disabledToBuy = false;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    doSearch(value) {
      this.http({
        headers: {
          token: sessionStorage.getItem("token"),
          role: sessionStorage.getItem("user_role"),
        },
        method: "get",
        url: `/api/commodity/search`,
        params: {
          q: value,
          pagesize: this.pageSize,
          page: this.currentPage,
        },
      }).then((res) => {
        if (res.data.code === 200) {
          this.commodityList = res.data.data.rows;
          if (this.commodityList.length === 0) {
            this.$message({
              type: "info",
              message: "没有该商品",
            });
          }
        }
      });
    },
    getCurretDate() {
      var nowDate = new Date();
      let date = {
        year: nowDate.getFullYear(),
        month: nowDate.getMonth() + 1,
        day: nowDate.getDate(),
        hour: nowDate.getHours(),
        min: nowDate.getMinutes(),
        sec: nowDate.getSeconds(),
      };
      this.curretDate =
        date.year +
        "/" +
        date.month +
        "/" +
        date.day +
        " " +
        date.hour +
        ":" +
        date.min +
        ":" +
        date.sec;
    },
    handleVisible(value) {
      this.dialogFormVisible = true;
      this.commodityIndex = value;
    },
    doBuyClick() {
      this.http({
        headers: {
          token: sessionStorage.getItem("token"),
          role: sessionStorage.getItem("user_role"),
        },
        method: "post",
        url: `/api/order/create`,
        data: {
          buyerId: sessionStorage.getItem("user_id"),
          address: this.userForm.userAddress,
          status: "WAIT_TO_PAY",
          commodities: [
            {
              id: this.commodityList[this.commodityIndex].id,
              vendorId: this.commodityList[this.commodityIndex].vendorId,
              name: this.commodityList[this.commodityIndex].name,
              price: this.commodityList[this.commodityIndex].price,
              num: this.userForm.quantityToBuy,
            },
          ],
        },
      }).then((res) => {
        this.commodityIndex = -1;
        this.userForm.quantityToBuy = 1;
        this.userForm.userAddress = "";
        this.dialogFormVisible = false;
        if (res.data.code() === 200) {
          this.$message({
            type: "info",
            message: "订单创建成功",
          });
        } else {
          this.$message({
            type: "error",
            message: "订单创建失败",
          });
        }
      });
    },
    doAddToCartClick() {
      this.http({
        headers: {
          token: sessionStorage.getItem("token"),
          // "Content-Type": "application/json",
          role: sessionStorage.getItem("user_role"),
        },
        method: "POST",
        url: "/api/testapp/shopcar/AddCart/",
        data: {
          uid: sessionStorage.getItem("user_id"),
          good_list: [
            {
              id: this.commodityList[this.commodityIndex].id,
              cart_num: this.userForm.quantityToBuy,
              status: "1",
              creat_time: this.curretDate,
              update_time: this.curretDate,
            },
          ],
        },
      })
        .then((res) => {
          this.commodityIndex = -1;
          this.userForm.quantityToBuy = 1;
          this.userForm.userAddress = "二叉楼";
          this.dialogFormVisible = false;

          this.$message({
            type: "info",
            message: res,
          });
        })
        .catch(() => {
          this.$message({
            type: "error",
            message: "系统服务异常",
          });
        });
    },
  },
};
</script>
<style scoped>
.logo {
  width: 100%;
  height: 100%;
}
.card {
  max-width: 400px;
  max-height: 600px;
  margin: 10px;
}
.goods {
  width: 100%;
  height: 100%;
  margin-top: 50px;
  display: grid;
  /*  声明列的宽度  */
  grid-template-columns: repeat(5, 20%);
  /*  声明行的高度  */
  grid-template-rows: 550px;
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
  width: 150px;
  float: center;
}
</style>
