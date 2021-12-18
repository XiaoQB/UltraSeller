<template>
  <div class="store">
    <el-header class="store-menu">
      <el-menu
        :default-active="salerOrder"
        mode="horizontal"
        @select="handleSelect"
        background-color="#545c64"
        text-color="#fff"
        active-text-color="#ffd04b"
      >
        <el-menu-item index="saler">
          <router-link class="a" to="/saler">商品信息</router-link>
        </el-menu-item>
        <el-menu-item index="salerOrder">
          <router-link class="a" to="salerOrder">
            订单信息
          </router-link>
        </el-menu-item>
        <el-menu-item index="wallet">
          <router-link class="a" to="/wallet">
            钱包
          </router-link></el-menu-item
        >
        <el-menu-item index="message">
          <router-link class="a" to="message">
            消息
          </router-link>
        </el-menu-item>
        <el-menu-item index="to-login" style="float: right">
          <el-col :span="12">
            <div class="user-image">
              <router-link class="a" to="/login">
                退出
              </router-link>
              <el-avatar :size="50">
                <img
                  src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"
                />
              </el-avatar>
            </div>
          </el-col>
        </el-menu-item>
      </el-menu>
    </el-header>
    <el-main>
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
        >查询订单</el-button
      >
      <el-table :data="tableData" border stripe style="width: 100%">
        <el-table-column label="序号" align="center" width="70px">
          <template slot-scope="scope">
            {{
              (formInline.currentPage - 1) * formInline.pageSize +
                scope.$index +
                1
            }}
          </template>
        </el-table-column>
        <el-table-column label="订单编号" prop="subOrderId"> </el-table-column>
        <el-table-column
          v-for="(item, index) in columnIndex"
          :key="index"
          :label="item"
        >
          <template slot-scope="scope">
            <div v-if="item === '图片'">
              <el-popover placement="top-start" title="" trigger="hover">
                <img
                  :src="scope.row.commodity.imgLink"
                  alt=""
                  style="width: 150px;height: 150px"
                />
                <img
                  slot="reference"
                  :src="scope.row.commodity.imgLink"
                  style="width: 100px;height: 100px"
                />
              </el-popover>
            </div>
            <span v-else>{{ scope.row.commodity.name }}</span>
          </template>
        </el-table-column>
        <el-table-column label="价格" prop="price"> </el-table-column>
        <el-table-column label="卖家id" prop="salerId"> </el-table-column>
        <el-table-column label="收货地址" prop="address"> </el-table-column>
        <el-table-column label="数量" prop="num"> </el-table-column>
        <el-table-column label="总价" prop="totalPrice"> </el-table-column>
        <el-table-column label="订单状态" prop="status"> </el-table-column>
        <el-table-column label="物流公司" prop="logistics"> </el-table-column>
        <el-table-column label="创建时间" prop="createTime"> </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <div v-if="scope.row.status === '未发货'">
              <el-button size="mini" @click="showDialogTran()">发货</el-button>
            </div>
            <el-dialog
              title="选择物流公司"
              :visible.sync="showDialogTrans"
              width="45%"
            >
              <el-form ref="commodityList" :model="address" label-width="100px">
                <el-select v-model="trans" placeholder="Select" align="right">
                  <el-option
                    v-for="item in optionsTrans"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  >
                  </el-option>
                </el-select>
              </el-form>

              <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="shipments(scope.row)"
                  >提交</el-button
                >
              </span>
            </el-dialog>
            <el-button size="mini" @click="changeAddress(scope.row)"
              >修改地址</el-button
            >
          </template>
        </el-table-column>
      </el-table>
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
        <el-form-item
          placeholder="目前只支持输入图片链接"
          label="收货地址"
          prop="address"
        >
          <el-input v-model="address"></el-input>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="changeSubmit()">提交</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "salerOrder",
  data() {
    return {
      showDialog: false,
      showDialogTrans: false,
      address: "",
      dataTotalCount: 0, //查询条件的总数据量
      formInline: {
        currentPage: 1,
        pageSize: 10,
      },
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
      optionsTrans: [
        {
          value: "顺丰",
          label: "顺丰",
        },
        {
          value: "圆通",
          label: "圆通",
        },
        {
          value: "神通",
          label: "神通",
        },
        {
          value: "此路不通",
          label: "此路不通",
        },
      ],
      trans: "", //物流公司
      columnIndex: ["图片", "商品名称"],
      tableData: [
        {
          commodity: {
            imgLink:
              "https://ts3.cn.mm.bing.net/th/id/OIP-C.305fYj0cWoTv_Q8TIbJ02wHaHG?w=196&h=188&c=7&r=0&o=5&dpr=2&pid=1.7",
            name: "面包",
          },
          subOrderId: "20210101001",
          price: "10",
          buyer: "好吃",
          address: "北京",
          status: "未发货",
          createTime: "2021-11-10 17:35:37",
          num: "5",
          totalPrice: "50",
          logistics: "顺丰",
        },
      ],
      status: "",
      changeInfo: {
        subOrderId: "",
        address: "",
        status: "",
        totalPrice: 0,
        logistics: "",
      },
    };
  },
  mounted() {
    this.getOrderList();
  },
  methods: {
    //分页 初始页currentPage、初始每页数据数pagesize和数据testpage--->控制每页几条
    handleSizeChange: function(size) {
      this.formInline.pageSize = size;
      this.getOrderList();
    },

    // 控制页面的切换
    handleCurrentChange: function(currentpage) {
      this.formInline.currentPage = currentpage;
      this.getOrderList();
    },
    handleSelect(key) {
      this.salerPage = key;
    },

    UserImageHandler() {
      return true;
    },
    /**
     * 获取更新订单list
     */
    getOrderList() {
      var that = this;

      this.http({
        headers: {
          "Content-Type": "application/json;",
          token: localStorage["token"],
          role: localStorage["user_role"],
        },
        method: "get",
        url: "/api/order/saler-list",
        params: {
          user_ids: localStorage["user_id"],
          page: this.formInline.currentPage,
          num: this.formInline.pageSize,
        },
      })
        .then((response) => {
          if (response.data.code === 200) {
            this.tableData = response.data.data;
          }
        })
        .catch(function(error) {
          that.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
    },
    showDialogTran() {
      this.showDialogTrans = true;
    },
    /**
     * 发货
     * @param row
     */
    shipments(row) {
      console.log(row.address);
      this.http({
        headers: {
          "Content-Type": "application/json;",
          token: window.localStorage["token"],
          role: localStorage["user_role"],
        },
        method: "put",
        url: "/api/order/change",
        data: {
          order: {},
          subOrders: [
            {
              subOrderId: row.subOrderId,
              address: row.address,
              status: "WAIT_TO_RECEIPT",
              totalPrice: row.totalPrice,
              logistics: this.trans,
            },
          ],
          buyerId: "",
        },
      }).then((response) => {
        if (response.data.code === 200) {
          this.getList(),
            this.$message({
              type: "success",
              message: "发货成功",
            });
        }
        this.getOrderList();
      });
    },
    doSearch() {
      if (this.status === "") {
        this.$message({
          type: "error",
          message: "请输入要查询的订单状态",
        });
      } else {
        this.http({
          headers: {
            token: window.localStorage["token"],
            role: localStorage["user_role"],
          },
          method: "get",
          url: "/api/order/saler-orders-status",
          params: {
            user_id: localStorage["id"],
            status: this.status,
            page: this.formInline.currentPage,
            num: this.formInline.pageSize,
          },
        })
          .then((response) => {
            if (response.data.code === 200) {
              this.tableData = response.data.data;
              this.$message({
                type: "success",
                message: "查询成功",
              });
            }
          })
          .catch(function(error) {
            this.$message({
              type: "error",
              message: "系统异常：" + error,
            });
          });
      }
    },
    changeAddress(row) {
      this.showDialog = true;
      this.changeInfo = {
        subOrderId: row.subOrderId,
        address: row.address,
        status: row.status,
        totalPrice: row.totalPrice,
        logistics: row.logistics,
      };
    },
    changeSubmit() {
      this.showDialog = false;
      this.http({
        headers: {
          "Content-Type": "application/json;",
          token: window.localStorage["token"],
          role: localStorage["user_role"],
        },
        method: "put",
        url: "/api/order/change",
        data: {
          order: {},
          subOrders: [
            {
              subOrderId: this.changeInfo.subOrderId,
              address: this.address,
              status: this.changeInfo.status,
              totalPrice: this.changeInfo.totalPrice,
              logistics: this.changeInfo.logistics,
            },
          ],
          buyerId: "",
        },
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
.a {
  text-decoration: none;
}
</style>
