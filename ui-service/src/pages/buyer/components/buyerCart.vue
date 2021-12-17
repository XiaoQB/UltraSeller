<template>
  <div id="buyerCart" class="buyerCart">
    <el-main>
      <span>收货地址 : </span>
      <el-input
        v-model="userAddress"
        :disabled="noCommodityChose"
        autocomplete="off"
        placeholder="地址"
        style="width: 600px; margin-bottom: 20px; margin-right: 50px"
      ></el-input>
      <el-button
        type="primary"
        :disabled="noCommodityChose"
        @click="doBuyClick(selectedCommodities, userAddress)"
        style="margin-bottom: 20px; width: 300px"
        >购买选中的订单</el-button
      >
      <el-table
        :data="mock.goods_list"
        borders
        stripe
        style="margin-top: 20px"
        ref="multipleTable"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" width="55"></el-table-column>
        <el-table-column label="商品ID" prop="commodityId"> </el-table-column>
        <el-table-column label="商品名称" prop="name">
          <template slot-scope="scope">
            <el-input
              placeholder="请输入内容"
              v-show="scope.row.show"
              v-model="scope.row.name"
            ></el-input>
            <span v-show="!scope.row.show">{{ scope.row.name }}</span>
          </template>
        </el-table-column>
        <el-table-column label="图片" prop="imgLink">
          <template slot-scope="scope">
            <el-popover placement="top-start" title="" trigger="hover">
              <img
                :src="scope.row.imgLink"
                alt=""
                style="width: 150px;height: 150px"
              />
              <img
                slot="reference"
                :src="scope.row.imgLink"
                style="width: 100px;height: 100px"
              />
            </el-popover>
          </template>
        </el-table-column>
        <el-table-column label="单价" prop="price"> </el-table-column>
        <el-table-column label="描述" prop="description"> </el-table-column>
        <el-table-column label="卖家" prop="vendorName"> </el-table-column>
        <el-table-column label="购买数量" prop="num"> </el-table-column>
        <el-table-column label="总价" prop="totalPrice"> </el-table-column>
      </el-table>
    </el-main>
  </div>
</template>

<script>
export default {
  name: "buyerCart",
  data() {
    return {
      dataTotalCount: 0, //查询条件的总数据量
      userCartList: [],
      userAddress: "",
      selectedCommodities: [],
      noCommodityChose: true, //没有选择商品时，不能购买
      mock: {
        uid: "",
        goods_list: [
          {
            commodityId: "1",
            name: "白酒",
            imgLink:
              "https://tse1-mm.cn.bing.net/th/id/OIP-C.Ysp5JXpNQ13Jpx75yhIfYAHaHa?w=214&h=214&c=7&r=0&o=5&dpr=2&pid=1.7",
            totalPrice: 2880.0,
            price: 2880.0,
            description: "酒",
            inventory: 10,
            vendorName: "茅台 01",
            vendorId: 1,
            keywords: "酒",
            address: "地址 01", // 送货地址
            num: 1, //需要的数量
          },
          {
            commodityId: "2",
            name: "白酒",
            imgLink:
              "https://tse1-mm.cn.bing.net/th/id/OIP-C.Ysp5JXpNQ13Jpx75yhIfYAHaHa?w=214&h=214&c=7&r=0&o=5&dpr=2&pid=1.7",
            totalPrice: 5760.0,
            price: 2880.0,
            description: "酒",
            inventory: 10,
            vendorName: "茅台 02",
            vendorId: 2,
            keywords: "酒",
            address: "地址 02", // 送货地址
            num: 2, //需要的数量
          },
          {
            commodityId: "3",
            name: "白酒",
            imgLink:
              "https://tse1-mm.cn.bing.net/th/id/OIP-C.Ysp5JXpNQ13Jpx75yhIfYAHaHa?w=214&h=214&c=7&r=0&o=5&dpr=2&pid=1.7",
            totalPrice: 8640.0,
            price: 2880.0,
            description: "酒",
            inventory: 10,
            vendorName: "茅台 03",
            vendorId: 3,
            keywords: "酒",
            address: "地址 03", // 送货地址
            num: 3, //需要的数量
          },
          {
            commodityId: "4",
            name: "白酒",
            imgLink:
              "https://tse1-mm.cn.bing.net/th/id/OIP-C.Ysp5JXpNQ13Jpx75yhIfYAHaHa?w=214&h=214&c=7&r=0&o=5&dpr=2&pid=1.7",
            totalPrice: 11520.0,
            price: 2880.0,
            description: "酒",
            inventory: 10,
            vendorName: "茅台 04",
            vendorId: 4,
            keywords: "酒",
            address: "地址 04", // 送货地址
            num: 4, //需要的数量
          },
        ],
      },
    };
  },
  mounted() {
    this.updateUserCartList();
  },
  methods: {
    updateUserCartList() {
      this.http({
        headers: {
          token: localStorage.getItem("token"),
          role: localStorage.getItem("user_role"),
        },
        method: "GET",
        url: "/api/testapp/shopcar/GetCart/",
        params: {
          uid: localStorage.getItem("user_id"),
        },
      })
        .then((resp) => {
          this.userCartList = resp.goods_list;
          this.$message({
            type: "info",
            message: resp,
          });
        })
        .catch(() => {
          this.$message({
            type: "error",
            message: "购物车获取失败",
          });
        });
    },
    handleSelectionChange(index) {
      this.selectedCommodities = index;
      if (this.selectedCommodities.length !== 0) {
        this.noCommodityChose = false;
      } else {
        this.noCommodityChose = true;
      }
    },
    doBuyClick(rows, address) {
      if (address === null || address === "" || address === undefined) {
        return this.$message({
          type: "error",
          message: "请输入地址",
        });
      }
      this.http({
        headers: {
          token: localStorage.getItem("token"),
          role: localStorage.getItem("user_role"),
        },
        method: "post",
        url: `/api/order/create`,
        data: {
          buyerId: localStorage.getItem("user_id"),
          address: address,
          status: "WAIT_TO_PAY",
          commodities: rows.map((resp) => {
            return {
              id: resp.commodityId,
              vendorId: resp.vendorId,
              name: resp.name,
              price: resp.price,
              num: resp.num,
            };
          }),
        },
      }).then((res) => {
        if (res.data.code() === 200) {
          this.$message({
            type: "info",
            message: "订单创建成功",
          });
          this.userAddress = "";
        } else {
          this.$message({
            type: "error",
            message: "订单创建失败",
          });
        }
      });
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.user-image {
  margin-right: 20px;
}

.logo {
  width: 100%;
  height: 100%;
}

.item-image {
  width: 100%;
  display: block;
}
</style>
