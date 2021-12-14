<template>
  <div id="messageCenter">
    <div class="head">
      <span style="float: left; font-size: 25px; margin: 20px">
        排序:
        <el-radio-group v-model="reverse" style="margin-left: 10px">
          <el-radio :label="true" border size="medium">最早消息</el-radio>
          <el-radio :label="false" border size="medium">最新消息</el-radio>
        </el-radio-group>
      </span>
      <span style="float: right; font-size: 25px; margin: 20px">
        今天日期: {{ curretDate }}
      </span>
    </div>
    <div>
      <el-timeline :reverse="reverse">
        <el-timeline-item
          v-for="(item, index) in buyerMessages"
          :key="index"
          placement="top"
          size="large"
          style="padding-right: 900px"
          :timestamp="formatTime(item.createTime)"
        >
          <el-badge
            value="new"
            :hidden="readOrNot(item.status)"
            style="width: 800px; font-size: 20px"
          >
            <el-card @click="readMessage" shadow="hover">
              <div slot="header" style="margin-bottom: 20px">
                <span style="float: left">已发货通知</span>
                <span style="float: right">{{
                  formatTime(item.createTime)
                }}</span>
              </div>
              <div>
                ID为{{ item.salerId }}的商家已发货, 您的商品{{
                  item.commodityName
                }}正在运往{{ item.address }}的途中。
              </div>
              <div style="margin-top: 10px">
                请注意查收!
              </div>
              <el-button
                size="medium"
                style="margin-top: 15px"
                @click="readMessage(item.id)"
                >已读</el-button
              >
            </el-card>
          </el-badge>
        </el-timeline-item>
      </el-timeline>
    </div>
    <el-empty v-if="noData" description="暂无消息"></el-empty>
  </div>
</template>

<script>
export default {
  name: "messageCenter",
  data() {
    return {
      curretDate: "",
      lastMonth: "",
      reverse: true, // 时间排序，true是最新
      buyerMessages: [], // 所有消息
      noData: false,
      mock: [
        {
          id: 4,
          type: "WAIT_TO_RECEIPT",
          subOrderId: "7c7e3346-87a4-4e39-add6-b089a864cd30",
          totalPrice: null,
          address: "交叉2",
          salerId: 14,
          buyerId: 11281,
          commodityId: "2021112819543201354",
          commodityName: "2",
          price: 1919.8,
          num: 10,
          status: 1,
          createTime: "2021-12-13T03:22:46.000+0000",
          updateTime: "2021-12-07T12:17:40.000+0000",
        },
        {
          id: 3,
          type: "WAIT_TO_RECEIPT",
          subOrderId: "17b9ac4e-2e30-4bf4-95e9-c0c3e1bf0997",
          totalPrice: null,
          address: "交叉1",
          salerId: 14,
          buyerId: 11281,
          commodityId: "2021112819491078893",
          commodityName: "1",
          price: 12.45,
          num: 1,
          status: 0,
          createTime: "2021-12-13T03:22:46.000+0000",
          updateTime: "2021-12-14T21:09:24.000+0000",
        },
      ],
    };
  },
  mounted() {
    this.updateMessages();
    this.getCurretDate();
  },
  methods: {
    updateMessages() {
      this.http({
        headers: {
          token: localStorage.getItem("token"),
          role: localStorage.getItem("user_role"),
        },
        method: "GET",
        url: `/api/order/notification/buyer/receive`,
        params: {
          buyerId: localStorage.getItem("user_id"),
          page: 1,
          num: 10,
        },
      })
        .then((resp) => {
          if (resp.data.code === 200) {
            this.buyerMessages = resp.data.data.rows;
            if (this.buyerMessages.length === 0) {
              this.noData = true;
            }
          }
        })
        .catch(() => {
          this.$message({
            type: "error",
            message: "获取失败",
          });
        });
    },
    getCurretDate() {
      var nowDate = new Date();
      let date = {
        year: nowDate.getFullYear(),
        month: nowDate.getMonth() + 1,
        day: nowDate.getDate(),
      };
      this.curretDate = date.year + "/" + date.month + "/" + date.day;
    },
    formatTime(time) {
      return time.substring(0, 10);
    },
    // 是否已读
    readOrNot(status) {
      if (status === 1) {
        return false;
      } else if (status === 0) {
        return true;
      }
    },
    readMessage(id) {
      this.http({
        headers: {
          token: localStorage.getItem("token"),
          role: localStorage.getItem("user_role"),
        },
        method: "post",
        url: "/api/order/notification/change",
        params: {
          id: id,
        },
      })
        .then(() => {
          this.updateMessages();
        })
        .catch(() => {
          this.updateMessages();
        });
    },
  },
};
</script>
<style scoped>
.messageCenter {
  width: 100%;
}
.head {
  width: 100%;
  height: 80px;
}
</style>
