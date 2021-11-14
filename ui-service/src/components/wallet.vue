<template>
  <div>
    <div>
      <el-header class="store-menu">
        <el-menu
            :default-active="this.salerPage"
            mode="horizontal"
            @select="handleSelect"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
        >

          <el-menu-item index="saler">
            <router-link to="/saler">
              商品信息
            </router-link>
          </el-menu-item>
          <el-menu-item index="/salerOrder">
            <router-link to="/salerOrder">
              订单信息

            </router-link></el-menu-item>
          <el-menu-item index="message-center-page"
          ><router-link to="/wallet">
            钱包
          </router-link></el-menu-item>
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
          </el-menu-item>
        </el-menu>
      </el-header>
      <el-main>
        <el-descriptions title="钱包信息">
          <el-descriptions-item label="钱包余额">{{money}}</el-descriptions-item>
        </el-descriptions>
        <el-dialog title="订单详情" :visible.sync="showDialog" width="45%">
          <el-form ref="tableData" :model="tableData[nowRow]"  label-width="100px">
            <el-form-item label="订单编号" prop="id">
              <span>{{orderInfo.subOrderId}}</span>
            </el-form-item>
            <el-form-item label="商品名称" prop="seller">
              <span >{{orderInfo.commodityName}}</span>
            </el-form-item>
            <el-form-item label="商品单价" prop="seller">
              <span >{{orderInfo.price}}</span>
            </el-form-item>
            <el-form-item label="商品数量" prop="seller">
              <span >{{orderInfo.num}}</span>
            </el-form-item>
            <el-form-item label="商品总价" prop="seller">
              <span >{{orderInfo.totalPrice}}</span>
            </el-form-item>
            <el-form-item label="订单时间" prop="seller">
              <span >{{orderInfo.createTime}}</span>
            </el-form-item>
          </el-form>


        </el-dialog>
    <el-table
        :data="tableData"
        border
        stripe
        style="width: 100%"
    >
      <el-table-column
          label="序号"
          align="center"
          width="70px">
        <template slot-scope="scope">
          <span>{{scope.$index + 1}}</span>
        </template>
      </el-table-column>
      <el-table-column
          label="订单编号"
          prop="orderId">
      </el-table-column>
      <el-table-column
          label="订单时间"
          prop="time">
      </el-table-column>
      <el-table-column
          label="价格"
          prop="amount">
      </el-table-column>
      <el-table-column
          label="操作">
        <template slot-scope="scope">
          <el-button
              size="mini"
              @click="getDetail(scope.$index, scope.row)">详情
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    </el-main>

  </div>
  </div>
</template>

<script>

export default {
  name: "wallet",
  data() {
    return {
      money: "777",
      showDialog: false,
      formInline: {
        currentPage: 1,
        pageSize: 10,
      },
      tableData: [
        {
          orderId: "20210101001",
          time:"2121/9/0 23:00::00",
          amount:"+70"
        },
      ],
      orderInfo: {
        subOrderId:"99",
        commodityName:"矿泉水",
        totalPrice:"5.2",
        num:"4",
        price:"1.3",
        createTime:"2021-11-11 19:01:22",

      }
    }
  },
  mounted() {
    this.getMoney();
    this.getList()
  },
  methods: {
    getMoney() {
      this.http({
        headers: {
          'token': localStorage['token'],
          'role': localStorage['role']
        },
        method: "get",
        url: `/wallet/user`,
        params: {
          username: localStorage['user_id'],
        }
      })
          .then(response => {
            this.money = response.data.data.balance
          })
          .catch(function (error) {
            this.$message({
              type: 'error',
              message: '系统异常：' + error
            });
          });

    },
    getList() {
      var that = this;
      this.http({
        headers: {
          'token': localStorage['token'],
          'role': localStorage['role']
        },
        method: "get",
        url: `/wallet/user/deal`,
        params: {
          username: localStorage['user_id'],
          size:"-1"
        }
      })
          .then(response => {
            that.tableData = response.data.data;
          })
          .catch(function (error) {
            that.$message({
              type: 'error',
              message: '系统异常：' + error
            });
          });
    },
    getDetail(index, row) {
      this.http({
        headers: {
          'token': localStorage['token'],
          'role': localStorage['role']
        },
        method: "get",
        url: "/order/order-detail",
        params: {
          subOrderId: row.orderId
        }
      }).then(response => {
        if (response.data.code === 200) {
          this.orderInfo = response.data.data
          this.showDialog = true
        }
      }).catch(function (error){
        this.$message({
          type:"error",
          message:error
        })
      });
      console.log(index, row);
    },




  }
}
</script>

<style scoped>
.buttonadd {
  color: #FFF;
  background-color: #409EFF;
  border-color: #409EFF;
  float: right
}
</style>
