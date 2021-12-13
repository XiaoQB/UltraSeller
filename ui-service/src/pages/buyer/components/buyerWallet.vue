<template>
  <div id="buyerWallet" class="buyerWallet">
    <el-main>
      <div class="block" style="display: flex; margin-bottom: 20px">
        <el-avatar shape="square" :size="125" :src="defaultImg"></el-avatar>
      </div>
      <el-descriptions
        title="用户信息"
        column="1"
        style="width: 800px; font-size: 20px"
        border
      >
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-user"></i>
            用户名
          </template>
          {{ userData.userName }}</el-descriptions-item
        >
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-user"></i>
            用户名角色
          </template>
          {{ userData.userRole }}</el-descriptions-item
        >
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-mobile-phone"></i>
            手机号
          </template>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-message"></i>
            邮箱地址
          </template>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-office-building"></i>
            默认收货地址</template
          >二叉楼
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-info"></i>
            钱包id</template
          >{{ userWallet.walletId }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-coin"></i>
            钱包余额
          </template>
          {{ userWallet.balance }} RMB
          <el-button
            style="margin-left: 20px"
            type="primary"
            @click="visible = true"
            >充值</el-button
          >
        </el-descriptions-item>
      </el-descriptions>
      <el-dialog
        title="充值"
        :visible.sync="visible"
        style="max-width: 800px; heigh: 500px; padding-top: 200px; padding-left: 550px"
      >
        <div>
          <span style="margin-right: 10px; font-size: 20px">金额:</span>
          <spam>
            <el-input-number v-model="money" :step="10"></el-input-number>
          </spam>
        </div>
        <div style="margin-top: 10px">
          <el-button @click="visible = false">取 消</el-button>
          <el-button type="primary" @click="doChargeMoney()">确 定</el-button>
        </div>
      </el-dialog>
    </el-main>
  </div>
</template>

<script>
export default {
  name: "wallet",
  data() {
    return {
      visible: false,
      money: 0, //充值数量
      userData: {
        userName: "",
        userImg: "",
        userRole: "",
      },
      userWallet: {
        walletId: "",
        balance: -1, // 钱
        role: "",
      },
      defaultImg:
        "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
    };
  },
  mounted() {
    this.getUserWallet();
  },
  methods: {
    getUserWallet() {
      this.userData.userName = localStorage.getItem("user_name");
      this.userData.userRole = localStorage.getItem("user_role");
      this.userWallet.walletId = localStorage.getItem("user_walletId");
      this.userWallet.balance = localStorage.getItem("user_wallet");
    },
    doChargeMoney() {
      this.http({
        headers: {
          token: localStorage.getItem("token"),
          role: localStorage.getItem("user_role"),
        },
        method: "PUT",
        url: `/api/wallet/user`,
        params: {
          username: this.userData.userName,
          difference: this.money,
        },
      })
        .then((resp) => {
          if (resp.data.code === 200) {
            this.$message({
              type: "success",
              message: "已完成充值" + this.money + "RMB",
            });
          }
        })
        .catch(() => {
          this.$message({
            type: "error",
            message: "服务器异常"
          })
        });
      this.money = 0;
      this.visible = false;
    },
  },
};
</script>

<style scoped></style>
