<template>
  <div id="buyerOrder" class="buyerOrder">
    <el-main>
      <!-- <div className="search-bar">
        <el-select v-model="searchedStatus" placeholder="Select" align="right">
          <el-option
            v-for="item in statusOptions"
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
        <el-button
          @click="updateUserOrderList()"
          type="primary"
          align="right"
          style="margin-left: 10px"
          >重置</el-button
        >
      </div> -->
      <div
        class="order-tables"
        style="margin-bottom: 20px; margin-top: 20px; font-size: 20px"
        v-for="(item, index) in userOrderList"
        :key="index"
      >
        <span style="float: left; margin-bottom: 10px"
          >父订单号: {{ item.orderId }}</span
        >
        <span style="margin-bottom: 10px; float: right"
          >总价格: {{ item.totalPrice }}</span
        >
        <!-- <span style="margin-bottom: 10px; float: right"
          >总订单状态: {{ handleTranslateStatus(item.status) }}</span
        > -->
        <el-table :data="item.subOrders" border style="font-size: 20px">
          <el-table-column label="商品详情" type="expand">
            <template slot-scope="props">
              <el-descriptions
                title="商品信息"
                column="2"
                style="margin-left: 20px; font-size: 20px"
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
          <!-- {{
            item.subOrders.map((resp) => {
              return handleTranslateStatus(resp.status);
            })
          }} -->
          <el-table-column label="操作">
            <template slot-scope="scope">
              <span
                v-if="scope.row.status === 'WAIT_TO_PAY'"
                style="margin-left: 10px"
              >
                <el-button
                  size="medium"
                  type="primary"
                  @click="doPay(scope.row)"
                  >付款</el-button
                >
              </span>
              <span
                v-if="scope.row.status === 'WAIT_TO_RECEIPT'"
                style="margin-left: 10px"
              >
                <el-button
                  size="medium"
                  type="primary"
                  @click="confirmReceived(scope.row)"
                  >确认收货</el-button
                >
              </span>
              <span
                v-if="
                  scope.row.status !== 'COMPLETE' &&
                    scope.row.status !== 'CANCEL'
                "
                style="margin-left: 10px"
              >
                <el-button
                  size="medium"
                  type="primary"
                  @click="returnBack(scope.row)"
                  >退货</el-button
                >
              </span>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <el-empty v-if="noData" description="暂无订单"></el-empty>
    </el-main>
  </div>
</template>

<script>
export default {
  name: "buyerOrder",
  data() {
    return {
      index: 1,
      showDialog: false,
      dataTotalCount: 0, //查询条件的总数据量
      formInline: {
        currentPage: 1,
        pageSize: 10,
      },
      userOrderList: [],
      searchedStatus: "",
      noData: false,
    };
  },
  mounted() {
    this.updateUserOrderList();
  },
  methods: {
    // 翻译订单状态
    handleTranslateStatus(value) {
      switch (value) {
        case "WAIT_TO_PAY":
          return "待付款";
        case "WAIT_TO_TRANSFER":
          return "待发货";
        case "WAIT_TO_RECEIPT":
          return "待收货";
        case "COMPLETE":
          return "已完成";
        case "CANCEL":
          return "已取消";
        default:
          return value;
      }
    },
    // doSearch() {
    //   this.http({
    //     headers: {
    //       token: window.sessionStorage["token"],
    //     },
    //     method: "get",
    //     params: {
    //       status: this.searchedStatus,
    //     },
    //   }).then((response) => {
    //     if (response.data.code === 200) {
    //       this.$message({
    //         type: "success",
    //         message: "查询成功",
    //       });
    //     }
    //   });
    // },
    updateUserOrderList() {
      this.http({
        headers: {
          token: sessionStorage.getItem("token"),
          role: sessionStorage.getItem("user_role"),
        },
        method: "GET",
        url: "/api/order/list",
        params: {
          user_ids: sessionStorage.getItem("user_id"),
          page: 1,
          num: 10,
        },
      }).then((resp) => {
        if (resp.data.code === 200) {
          this.userOrderList = resp.data.data;
          if (this.userOrderList.length === 0) {
            this.noData = true;
          }
        } else {
          this.$message({
            type: "error",
            message: "无法连接到服务器",
          });
          this.noData = true;
        }
      });
      this.searchedStatus = "";
    },
    confirmReceived(rows) {
      this.http({
        headers: {
          token: sessionStorage.getItem("token"),
          role: sessionStorage.getItem("user_role"),
        },
        method: "PUT",
        url: `/api/wallet/deal`,
        data: {
          sellerName: rows.commodity.vendorName,
          buyerName: sessionStorage.getItem("user_name"),
          dealId: -1,
          price: rows.totalPrice,
          dealStatus: "finish",
        },
      })
        .then((resp) => {
          if (resp.data.code === 200) {
            this.http({
              headers: {
                token: sessionStorage.getItem("token"),
                role: sessionStorage.getItem("user_role"),
              },
              method: "put",
              url: "/api/order/change",
              data: {
                order: {
                  orderId: rows.orderId,
                },
                subOrders: [
                  { subOrderId: rows.subOrderId, status: "COMPLETE" },
                ],
                userName: sessionStorage.getItem("user_name"),
              },
            })
              .then((response) => {
                if (response.data.code === 200) {
                  this.$message({
                    type: "success",
                    message: "确认收货",
                  });
                }
              })
              .catch(
                this.$message({
                  type: "error",
                  message: "没有收货" + rows.orderId + rows.subOrderId,
                })
              );
          }
        })
        .catch(() => {
          this.$message({
            type: "error",
            message: "未完成订单" + rows.orderId + rows.subOrderId,
          });
        });
      this.updateUserOrderList();
    },
    returnBack(rows) {
      this.http({
        headers: {
          token: sessionStorage.getItem("token"),
          role: sessionStorage.getItem("user_role"),
        },
        method: "PUT",
        url: `/api/wallet/deal`,
        data: {
          sellerName: rows.commodity.vendorName,
          buyerName: sessionStorage.getItem("user_name"),
          dealId: -1,
          price: rows.totalPrice,
          dealStatus: "refund",
        },
      })
        .then((resp) => {
          if (resp.data.code === 200) {
            this.http({
              headers: {
                token: sessionStorage.getItem("token"),
                role: sessionStorage.getItem("user_role"),
              },
              method: "put",
              url: "/api/order/change",
              data: {
                order: {
                  orderId: rows.orderId,
                  // address: '',
                },
                subOrders: [{ subOrderId: rows.subOrderId, status: "CANCEL" }],
                userName: sessionStorage.getItem("user_name"),
              },
            })
              .then((response) => {
                if (response.data.code === 200) {
                  this.$message({
                    type: "success",
                    message: "退货完成",
                  });
                } else {
                  this.http({
                    headers: {
                      token: sessionStorage.getItem("token"),
                      role: sessionStorage.getItem("user_role"),
                    },
                    method: "PUT",
                    url: `/api/wallet/deal`,
                    data: {
                      sellerName: rows.commodity.vendorName,
                      buyerName: sessionStorage.getItem("user_name"),
                      dealId: -1,
                      price: -rows.totalPrice,
                      dealStatus: "refund",
                    },
                  });
                }
              })
              .catch(() => {
                this.http({
                  headers: {
                    token: sessionStorage.getItem("token"),
                    role: sessionStorage.getItem("user_role"),
                  },
                  method: "PUT",
                  url: `/api/wallet/deal`,
                  data: {
                    sellerName: rows.commodity.vendorName,
                    buyerName: sessionStorage.getItem("user_name"),
                    dealId: -1,
                    price: -rows.totalPrice,
                    dealStatus: "refund",
                  },
                });
                this.$message({
                  type: "error",
                  message: "退货失败" + rows.orderId + rows.subOrderId,
                });
              });
          }
        })
        .catch(() => {
          this.$message({
            type: "error",
            message: "退货失败",
          });
        });
      this.updateUserOrderList();
    },
    doPay(rows) {
      this.http({
        headers: {
          token: sessionStorage.getItem("token"),
          role: sessionStorage.getItem("user_role"),
        },
        method: "PUT",
        url: `/api/wallet/deal`,
        data: {
          sellerName: rows.commodity.vendorName,
          buyerName: sessionStorage.getItem("user_name"),
          dealId: -1,
          price: rows.totalPrice,
          dealStatus: "pending",
        },
      })
        .then((resp) => {
          if (resp.data.code === 200) {
            this.$message({
              type: "success",
              message: "付款成功",
            });
            this.http({
              headers: {
                token: sessionStorage.getItem("token"),
                role: sessionStorage.getItem("user_role"),
              },
              method: "put",
              url: "/api/order/change",
              data: {
                order: {
                  orderId: rows.orderId,
                  address: rows.address,
                },
                subOrders: [
                  {
                    subOrderId: rows.subOrderId,
                    address: rows.address,
                    status: "WAIT_TO_TRANSFER",
                    commodityId: rows.commodityId,
                    commodityName: rows.commodityName,
                    price: rows.price,
                    num: rows.num,
                    salerId: rows.salerId,
                  },
                ],
                buyerId: sessionStorage.getItem("user_id"),
              },
            })
              .then((response) => {
                if (response.data.code === 200) {
                  this.$message({
                    type: "success",
                    message: "订单更新成功",
                  });
                  this.updateUserOrderList();
                } else {
                  this.http({
                    headers: {
                      token: sessionStorage.getItem("token"),
                      role: sessionStorage.getItem("user_role"),
                    },
                    method: "PUT",
                    url: `/api/wallet/deal`,
                    data: {
                      sellerName: rows.commodity.vendorName,
                      buyerName: sessionStorage.getItem("user_name"),
                      dealId: -1,
                      price: -rows.totalPrice,
                      dealStatus: "pending",
                    },
                  });
                }
              })
              .catch(() => {
                this.http({
                  headers: {
                    token: sessionStorage.getItem("token"),
                    role: sessionStorage.getItem("user_role"),
                  },
                  method: "PUT",
                  url: `/api/wallet/deal`,
                  data: {
                    sellerName: rows.commodity.vendorName,
                    buyerName: sessionStorage.getItem("user_name"),
                    dealId: -1,
                    price: -rows.totalPrice,
                    dealStatus: "pending",
                  },
                });
              });
          } else {
            this.$message({
              type: "error",
              message: resp.data.msg,
            });
          }
        })
        .catch(() => {
          this.$message({
            type: "error",
            message: "付款失败",
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
</style>
