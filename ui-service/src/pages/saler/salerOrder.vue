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
          <router-link to="/saler">商品信息</router-link>
        </el-menu-item>
        <el-menu-item index="salerOrder">
          <router-link to="salerOrder">
            订单信息
          </router-link>
        </el-menu-item>
        <el-menu-item index="message-center-page"
        >
          <router-link to="/packet">
            钱包
          </router-link>
        </el-menu-item
        >
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
      <el-select v-model="value" placeholder="Select" align="right">
        <el-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value">
        </el-option>
      </el-select>
      <el-button @click="doSearch()" type="primary" icon="el-icon-search" align="right">查询订单</el-button>
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
            {{ (formInline.currentPage - 1) * formInline.pageSize + scope.$index + 1 }}
          </template>
        </el-table-column>
        <el-table-column
            label="订单编号"
            prop="id">
        </el-table-column>
        <el-table-column
            label="商品名称"
            prop="name">
          <template slot-scope="scope">
            <el-input placeholder="请输入内容" v-show="scope.row.show" v-model="scope.row.name"></el-input>
            <span v-show="!scope.row.show">{{ scope.row.name }}</span>
          </template>
        </el-table-column>
        <el-table-column
            label="图片"
            prop="imgLink">
          <template slot-scope="scope">
            <el-popover placement="top-start" title="" trigger="hover">
              <img :src=scope.row.imgLink alt="" style="width: 150px;height: 150px">
              <img slot="reference" :src=scope.row.imgLink style="width: 100px;height: 100px">
            </el-popover>
          </template>
        </el-table-column>
        <el-table-column
            label="价格"
            prop="price">
        </el-table-column>
        <el-table-column
            label="商品描述"
            prop="description">
        </el-table-column>
        <el-table-column
            label="库存"
            prop="inventory">
        </el-table-column>
        <el-table-column
            label="所有者名字"
            prop="vendorName">
        </el-table-column>
        <el-table-column
            label="操作">
          <template slot-scope="scope">
            <el-button
                size="mini"
                @click="getDetail(scope.$index, scope.row)">详情
            </el-button>
            <el-button
                size="mini"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)">删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination background
                     layout="total, prev, pager, next, sizes,jumper"
                     :page-sizes="[5, 10, 15]"
                     :page-size="formInline.pageSize"
                     :total="dataTotalCount"
                     @size-change="handleSizeChange"
                     @current-change="handleCurrentChange">
      </el-pagination>
    </el-main>
    <el-footer>
      <div class="customer-service"></div>
    </el-footer>
  </div>
</template>

<script>

import userService from "../../services/user"

export default {

  name: "saler",


  data() {
    return {
      dataTotalCount: 0,      //查询条件的总数据量
      formInline: {
        currentPage: 1,
        pageSize: 10,
      },
      options: [{
        value: '待付款',
        label: '待付款'
      }, {
        value: '待发货',
        label: '待发货'
      }, {
        value: '待收货',
        label: '待收货'
      }, {
        value: '已完成',
        label: '已完成'
      }, {
        value: '已取消',
        label: '已取消'
      }],
      value: ''

      // currentDate: new Date()
    };
  },
  methods: {
    //分页 初始页currentPage、初始每页数据数pagesize和数据testpage--->控制每页几条
    handleSizeChange: function (size) {
      this.formInline.pageSize = size;
      this.getList();
    },

    // 控制页面的切换
    handleCurrentChange: function (currentpage) {
      this.formInline.currentPage = currentpage;
      this.getList();
    },
    handleSelect(key) {
      this.salerPage = key;
    },

    UserImageHandler() {
      return true;
    },
    getList() {
      userService.getLists();
    }
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
