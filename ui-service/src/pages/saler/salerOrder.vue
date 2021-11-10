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

        > <router-link to="/wallet">
          钱包
        </router-link></el-menu-item
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
      <el-select v-model="status" placeholder="Select" align="right">
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
            label="买家id"
            prop="buyer">
        </el-table-column>
        <el-table-column
            label="收货地址"
            prop="address">
        </el-table-column>
        <el-table-column
            label="订单状态"
            prop="status">
        </el-table-column>
        <el-table-column
            label="操作">
          <template slot-scope="scope">
           <div v-if="scope.row.status==='未发货'">
             <el-button
                 size="mini"
                 @click="shipments(scope.row)">发货</el-button>
           </div>
            <el-button
                size="mini"
<<<<<<< HEAD
                @click="changeAddress(scope.row)">修改地址</el-button>
=======
                @click="getDetail(scope.$index, scope.row)">详情
            </el-button>
            <el-button
                size="mini"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)">删除
            </el-button>
>>>>>>> master
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
    <el-dialog title="修改收货地址" :visible.sync="showDialog" width="45%">
      <el-form ref="commodityList" :model="address"  label-width="100px">
        <el-form-item placeholder="目前只支持输入图片链接"
                      label="收货地址"
                      prop="address">
          <el-input  v-model="address"></el-input>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
            <el-button type="primary" @click="changeSubmit()">提交</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>

import userService from "../../services/user"

export default {
  name: "saler",
  data() {
    return {
      showDialog:false,
      address:"beijking",
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
      tableData: [
        {
          id:"20210101001",
          name:"面包",
          imgLink:"https://ts3.cn.mm.bing.net/th/id/OIP-C.305fYj0cWoTv_Q8TIbJ02wHaHG?w=196&h=188&c=7&r=0&o=5&dpr=2&pid=1.7",
          price:"10",
          buyer:"好吃",
          address:"10",
          status:"未发货",
        },
      ],
      status: ''
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
    },
    shipments(row){
      this.http({
        headers:{
          'token':window.localStorage['token']
        },
        method:"put",
        url:"",
        params:{
          orderId:row.id,
        }
      }).then(response=>{
        if(response.data.code===200){
          this.getList(),
          this.$message({
            type: 'success',
            message: '发货成功'
          });
        }
        this.getList()

      })
    },
    doSearch(){
      this.http({
        headers:{
          'token':window.localStorage['token']
        },
        method:"get",
        params:{
          status:this.status
        }
      }).then(response=>{
        if(response.data.code===200){
          this.$message({
            type: 'success',
            message:'查询成功'
          })
        }
      })
    },
    changeAddress(){
      this.showDialog=true;
    },
    changeSubmit(){

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
