<template>
  <el-container>
    <el-header class="manager-header">
      管理中心
    </el-header>
    <el-main>
      <el-tabs type="border-card" v-model="activeName" @tab-click="handleClick">

        <!-------------------------------------------------------->
        <el-tab-pane label="买家管理" name="buyerManager">
          <buyerManager v-if="activeName == 'buyerManager'" ref="buyerManager"></buyerManager>
        </el-tab-pane>
        <!-------------------------------------------------------->
        <el-tab-pane label="卖家管理" name="sellerManager">
          <sellerManager v-if="activeName == 'sellerManager'" ref="sellerManager"></sellerManager>
        </el-tab-pane>
        <!-------------------------------------------------------->
        <el-tab-pane label="商品管理" name="commodityManager">
          <commodityManager v-if="activeName == 'commodityManager'" ref="commodityManager"></commodityManager>
        </el-tab-pane>
      </el-tabs>

    </el-main>
  </el-container>



</template>
<script>
import buyerManager from "@/components/buyerManager";
import sellerManager from "@/components/sellerManager";
import commodityManager from "@/components/commodityManager";

export default {
  components: {
    // eslint-disable-next-line vue/no-unused-components
    buyerManager,
    // eslint-disable-next-line vue/no-unused-components
    sellerManager,
    // eslint-disable-next-line vue/no-unused-components
    commodityManager
  },
  data() {
    return {
      activeName: 'buyerManager'
    };
  },
  mounted() {
    this.onQuery();
  },
  methods: {
    handleClick(tab) {
      this.activeName = tab.name;
      var that = this;
      setTimeout(function () {
        that.onQuery();
      }, 500);
    },

    onQuery() {
      this.$refs[this.activeName].getList();
    },

  }


};
</script>
<style>
.manager-header {
  background-color: #B3C0D1;
  color: #333;
  text-align: center;
  line-height: 60px;
  font-family: "Arial Hebrew Scholar";
}
</style>
