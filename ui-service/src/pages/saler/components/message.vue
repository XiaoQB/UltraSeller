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
      <h3>
        已付款的订单消息
      </h3>
      <el-table
        :data="payTableData"
        border
        stripe
        style="width: 100%"
        :row-style="tableRowStyle"
      >
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
        <el-table-column label="买家id" prop="buyerId"> </el-table-column>
        <el-table-column label="收货地址" prop="address"> </el-table-column>
        <el-table-column label="商品编号" prop="commodityId"> </el-table-column>
        <el-table-column label="商品名称" prop="commodityName">
        </el-table-column>
        <el-table-column label="价格" prop="price"> </el-table-column>
        <el-table-column label="数量" prop="num"> </el-table-column>
        <el-table-column label="总价" prop="totalPrice"> </el-table-column>
        <el-table-column label="创建时间" prop="createTime"> </el-table-column>
        <el-table-column label="更新时间" prop="updateTime"> </el-table-column>
        <el-table-column label="状态">
          <template slot-scope="scope">
            <div v-if="scope.row.status === 1">
              未读
            </div>
            <div v-else-if="scope.row.status === 0">
              已读
            </div>
          </template>
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <div v-if="scope.row.status === 1">
              <el-button size="mini" @click="readPayMessage(scope.row.id)"
                >已读</el-button
              >
            </div>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        background
        layout="total, prev, pager, next, sizes,jumper"
        :page-sizes="[5, 10, 15]"
        :page-size="formInline.pageSize0"
        :total="dataTotalCount0"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      >
      </el-pagination>
      <div>
        <h3>已收货的订单信息</h3>
        <el-divider></el-divider>
      </div>

      <el-table
        :data="doneTableData"
        border
        stripe
        style="width: 100%"
        :row-style="tableRowStyle"
      >
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
        <el-table-column label="买家id" prop="buyerId"> </el-table-column>
        <el-table-column label="收货地址" prop="address"> </el-table-column>
        <el-table-column label="商品编号" prop="commodityId"> </el-table-column>
        <el-table-column label="商品名称" prop="commodityName">
        </el-table-column>
        <el-table-column label="价格" prop="price"> </el-table-column>
        <el-table-column label="数量" prop="num"> </el-table-column>
        <el-table-column label="总价" prop="totalPrice"> </el-table-column>
        <el-table-column label="创建时间" prop="createTime"> </el-table-column>
        <el-table-column label="更新时间" prop="updateTime"> </el-table-column>
        <el-table-column label="状态">
          <template slot-scope="scope">
            <div v-if="scope.row.status === 1">
              未读
            </div>
            <div v-else-if="scope.row.status === 0">
              已读
            </div>
          </template>
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <div v-if="scope.row.status === 1">
              <el-button size="mini" @click="readCompleteMessage(scope.row.id)"
                >已读</el-button
              >
            </div>
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
  </div>
</template>

<script>
export default {
  name: "message",
  data() {
    return {
      address: "",
      dataTotalCount0: 0,
      dataTotalCount: 0, //查询条件的总数据量
      formInline: {
        currentPage0: 1,
        pageSize0: 10,
        currentPage: 1,
        pageSize: 10,
      },
      payTableData: [],
      doneTableData: [],
    };
  },
  mounted() {
    this.getPayMessageList();
    this.getCompleteMessageList();
  },
  methods: {
    //分页 初始页currentPage、初始每页数据数pagesize和数据testpage--->控制每页几条
    handleSizeChange: function(size) {
      this.formInline.pageSize = size;
      this.getPayMessageList();
    },

    // 控制页面的切换
    handleCurrentChange: function(currentpage) {
      this.formInline.currentPage = currentpage;
      this.getPayMessageList();
    },

    tableRowStyle(row) {
      let rowBackground = {};
      if (row.row.status === 1) {
        rowBackground.background = "rgba(220,180,15,0.53)";
        return rowBackground;
      }
    },

    getPayMessageList() {
      this.http({
        headers: {
          "Content-Type": "application/json;",
          token: sessionStorage["token"],
          role: sessionStorage["user_role"],
        },
        method: "get",
        url: "api/order/notification/saler/pay",
        params: {
          salerId: sessionStorage["user_id"],
          page: this.formInline.currentPage,
          num: this.formInline.pageSize,
        },
      })
        .then((response) => {
          if (response.data.code === 200) {
            this.payTableData = response.data.data.rows;
            this.dataTotalCount0 = response.data.data.total;
          }
        })
        .catch(function(error) {
          this.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
    },
    readPayMessage(id) {
      var messageId = id;
      this.http({
        headers: {
          token: sessionStorage["token"],
          role: sessionStorage["user_role"],
        },
        method: "post",
        url: "api/order/notification/change",
        params: {
          id: messageId,
        },
      })
        .then((response) => {
          if (response.data.code === 200) {
            this.getCompleteMessageList();
          }
        })
        .catch(function(error) {
          this.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
    },
    readCompleteMessage(id) {
      var messageId = id;
      this.http({
        headers: {
          token: sessionStorage["token"],
          role: sessionStorage["user_role"],
        },
        method: "post",
        url: "api/order/notification/change",
        params: {
          id: messageId,
        },
      })
        .then((response) => {
          if (response.data.code === 200) {
            this.getPayMessageList();
          }
        })
        .catch(function(error) {
          this.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
    },
    getCompleteMessageList() {
      this.http({
        headers: {
          "Content-Type": "application/json;",
          token: sessionStorage["token"],
          role: sessionStorage["user_role"],
        },
        method: "get",
        url: "api/order/notification/saler/complete",
        params: {
          salerId: sessionStorage["user_id"],
          page: this.formInline.currentPage0,
          num: this.formInline.pageSize0,
        },
      })
        .then((response) => {
          if (response.data.code === 200) {
            this.doneTableData = response.data.data.rows;
            this.dataTotalCount = response.data.data.total;
          }
        })
        .catch(function(error) {
          this.$message({
            type: "error",
            message: "系统异常：" + error,
          });
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
