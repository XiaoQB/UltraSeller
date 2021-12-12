<template>
  <div id="buyerOrder" class="buyerOrder">
    <el-main>
      <div className="search-bar">
        <el-select v-model="status" placeholder="Select" align="right">
          <el-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
        <el-button
          @click="doSearch()"
          type="primary"
          icon="el-icon-search"
          align="right"
          style="margin-left: 10px"
          >查询订单</el-button
        >
      </div>
      <div
        class="order-tables"
        style="margin-bottom: 20px; margin-top: 20px"
        v-for="(item, index) in tableData"
        :key="index"
      >
        <span style="float: left; margin-bottom: 10px"
          >父订单: {{ item.orderId }}</span
        >
        <span style="margin-bottom: 10px">总价格: {{ item.totalPrice }}</span>
        <span style="margin-bottom: 10px; float: right"
          >总订单状态: {{ item.status }}</span
        >
        <el-table :data="item.subOrders" border>
          <el-table-column label="商品详情" type="expand">
            <template slot-scope="props">
              <el-descriptions
                title="商品信息"
                column="2"
                style="margin-left: 20px"
              >
                <el-descriptions-item label="商品图">
                  <img :src="props.row.commodity.imgLink" class="item-image" />
                </el-descriptions-item>
                <el-descriptions-item label="商品 ID">
                  <div>{{ props.row.commodity.id }}</div>
                </el-descriptions-item>
                <el-descriptions-item label="商品名称">
                  <div>{{ props.row.commodity.name }}</div>
                </el-descriptions-item>
                <el-descriptions-item label="商品分类">
                  <div>{{ props.row.commodity.keywords }}</div>
                </el-descriptions-item>
                <el-descriptions-item label="商品描述">
                  <div>{{ props.row.commodity.description }}</div>
                </el-descriptions-item>
                <el-descriptions-item label="商家">
                  <div>{{ props.row.commodity.vendorName }}</div>
                </el-descriptions-item>
                <el-descriptions-item label="库存">
                  <div>{{ props.row.commodity.inventory }}</div>
                </el-descriptions-item>
              </el-descriptions>
            </template>
          </el-table-column>
          <el-table-column prop="commodityName" label="商品名">
          </el-table-column>
          <el-table-column prop="price" label="单价"></el-table-column>
          <el-table-column prop="num" label="购买数量"></el-table-column>
          <el-table-column prop="totalPrice" label="总价"></el-table-column>
          <el-table-column prop="address" label="地址"></el-table-column>
          <el-table-column prop="status" label="状态"></el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scope">
              <span v-if="scope.row.status === 'doing'">
                <el-button size="medium" @click="returnBack(scope.row)"
                  >退货 {{ scope.row.status }}</el-button
                >
              </span>
              <span v-if="scope.row.status === 'doing'">
                <el-button size="medium" @click="returnBack(scope.row)"
                  >付款</el-button
                >
              </span>
              <span v-if="scope.row.status === 'doing'">
                <el-button size="medium" @click="returnBack(scope.row)"
                  >确认收货</el-button
                >
              </span>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <el-pagination
        background
        layout="total, prev, pager, next, sizes,jumper"
        :page-sizes="[5, 10, 15]"
        :page-size="formInline.pageSize"
        :total="dataTotalCount"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      >
      </el-pagination>
    </el-main>
    <el-footer>
      <div class="customer-service"></div>
    </el-footer>
    <el-dialog title="修改收货地址" :visible.sync="showDialog" width="45%">
      <el-form ref="commodityList" :model="address" label-width="100px">
        <el-descriptions-item
          placeholder="目前只支持输入图片链接"
          label="收货地址"
          prop="address"
        >
          <el-input v-model="address"></el-input>
        </el-descriptions-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="changeSubmit()">提交</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "buyerOrder",
  data() {
    return {
      index: 1,
      showDialog: false,
      address: "beijking",
      dataTotalCount: 0, //查询条件的总数据量
      formInline: {
        currentPage: 1,
        pageSize: 10,
      },
      userOrderList: [],
      options: [
        {
          value: "WAIT_TO_PAY",
          label: "待付款",
        },
        {
          value: "WAIT_TO_TRANSFER",
          label: "待发货",
        },
        {
          value: "WAIT_TO_RECEIPT",
          label: "待收货",
        },
        {
          value: "COMPLETE",
          label: "已完成",
        },
        {
          value: "CANCEL",
          label: "已取消",
        },
      ],
      tableData: [
        {
          orderId: "1",
          status: "doing",
          totalPrice: 19235.3,
          address: "叉二",
          buyerId: 24,
          createTime: "2021-11-28T12:02:28.000+0000",
          updateTime: "2021-11-28T12:02:28.000+0000",
          subOrders: [
            {
              subOrderId: "11",
              orderId: "1",
              status: "doing",
              totalPrice: 19198.0,
              address: "叉二",
              salerId: 5,
              commodityId: "202111252235327924",
              commodityName: "your beats",
              price: 1919.8,
              num: 10,
              createTime: null,
              updateTime: null,
              commodity: {
                id: "202111252235327924",
                name: "11111",
                imgLink: "water.jpg",
                price: 2.0e7,
                description: "塞阀塞否",
                inventory: 10,
                vendorName: "矿泉水",
                vendorId: 0,
                keywords: "饮用水",
                typeList: null,
                typeIdx: null,
                num: null,
              },
            },
            {
              subOrderId: "12",
              orderId: "1",
              status: "doing",
              totalPrice: 37.35,
              address: "叉二",
              salerId: 3,
              commodityId: "202111252235327924",
              commodityName: "my soul",
              price: 12.45,
              num: 3,
              createTime: null,
              updateTime: null,
              commodity: {
                id: "202111252235327924",
                name: "22222",
                imgLink: "water.jpg",
                price: 2.0e7,
                description: "塞阀塞否",
                inventory: 10,
                vendorName: "矿泉水",
                vendorId: 0,
                keywords: "饮用水",
                typeList: null,
                typeIdx: null,
                num: null,
              },
            },
            {
              subOrderId: "13",
              orderId: "1",
              status: "doing",
              totalPrice: 19198.0,
              address: "叉二",
              salerId: 5,
              commodityId: "202111252235327924",
              commodityName: "your beats",
              price: 1919.8,
              num: 10,
              createTime: null,
              updateTime: null,
              commodity: {
                id: "202111252235327924",
                name: "33333",
                imgLink: "water.jpg",
                price: 2.0e7,
                description: "塞阀塞否",
                inventory: 10,
                vendorName: "矿泉水",
                vendorId: 0,
                keywords: "饮用水",
                typeList: null,
                typeIdx: null,
                num: null,
              },
            },
          ],
        },
        {
          orderId: "2",
          status: "doing",
          totalPrice: 19235.3,
          address: "叉二",
          buyerId: 24,
          createTime: "2021-11-28T12:02:28.000+0000",
          updateTime: "2021-11-28T12:02:28.000+0000",
          subOrders: [
            {
              subOrderId: "21",
              orderId: "2",
              status: "doing",
              totalPrice: 19198.0,
              address: "叉二",
              salerId: 5,
              commodityId: "202111252235327924",
              commodityName: "your beats",
              price: 1919.8,
              num: 10,
              createTime: null,
              updateTime: null,
              commodity: {
                id: "202111252235327924",
                name: "44444",
                imgLink: "water.jpg",
                price: 2.0e7,
                description: "塞阀塞否",
                inventory: 10,
                vendorName: "矿泉水",
                vendorId: 0,
                keywords: "饮用水",
                typeList: null,
                typeIdx: null,
                num: null,
              },
            },
            {
              subOrderId: "22",
              orderId: "2",
              status: "doing",
              totalPrice: 37.35,
              address: "叉二",
              salerId: 3,
              commodityId: "202111252235327924",
              commodityName: "my soul",
              price: 12.45,
              num: 3,
              createTime: null,
              updateTime: null,
              commodity: {
                id: "202111252235327924",
                name: "5555555",
                imgLink: "water.jpg",
                price: 2.0e7,
                description: "塞阀塞否",
                inventory: 10,
                vendorName: "矿泉水",
                vendorId: 0,
                keywords: "饮用水",
                typeList: null,
                typeIdx: null,
                num: null,
              },
            },
          ],
        },
      ],
      status: "",
      // currentDate: new Date()
    };
  },
  mounted() {
    // this.updateUserOrderList();
  },
  methods: {
    //分页 初始页currentPage、初始每页数据数pagesize和数据testpage--->控制每页几条
    handleSizeChange: function(size) {
      this.formInline.pageSize = size;
      this.getList();
    },
    // 控制页面的切换
    handleCurrentChange: function(currentpage) {
      this.formInline.currentPage = currentpage;
      this.getList();
    },
    handleSelect(key) {
      this.salerPage = key;
    },
    spanMethod({ columIndex }) {
      if (columIndex === 1 && columIndex === 2) {
        return [1, 2];
      }
    },
    updateUserOrderList() {
      this.http({
        headers: {
          token: localStorage.getItem("token"),
          role: localStorage.getItem("user_role"),
        },
        method: "GET",
        url: "/api/order/list",
        params: {
          user_ids: localStorage.getItem("user_id"),
          page: this.currentPage,
          num: this.pageSize,
        },
      }).then((resp) => {
        this.userOrderList = resp.data.data;
      });
    },
    returnBack(row) {
      this.http({
        headers: {
          token: localStorage.getItem("token"),
          role: localStorage.getItem("user_role"),
        },
        method: "put",
        url: "/api/order/change",
        params: {
          orderId: row.id,
        },
      }).then((response) => {
        if (response.data.code === 200) {
          this.getList(),
            this.$message({
              type: "success",
              message: "退货完成",
            });
        }
        this.getList();
      });
    },
    shipments(row) {
      this.http({
        headers: {
          token: localStorage.getItem("token"),
          role: localStorage.getItem("user_role"),
        },
        method: "put",
        url: "/api/order/change",
        params: {
          orderId: row.id,
        },
      }).then((response) => {
        if (response.data.code === 200) {
          this.getList(),
            this.$message({
              type: "success",
              message: "发货成功",
            });
        }
        this.getList();
      });
    },
    doSearch() {
      this.http({
        headers: {
          token: window.localStorage["token"],
        },
        method: "get",
        params: {
          status: this.status,
        },
      }).then((response) => {
        if (response.data.code === 200) {
          this.$message({
            type: "success",
            message: "查询成功",
          });
        }
      });
    },
    changeAddress() {
      this.showDialog = true;
    },
    changeSubmit() {},
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

.orders {
  width: 100%;
  height: 100%;
  margin-top: 50px;
}

.item-image {
  width: 100%;
  display: block;
}
</style>
