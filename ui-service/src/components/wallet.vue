<template>
  <div>
    <div>
      <el-header class="store-menu">
        <el-menu
            :default-active="saler"
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
              <span v-if="!edit">{{tableData[nowRow].id}}</span>
              <el-input v-else v-model="tableData[nowRow].id"></el-input>
            </el-form-item>
            <el-form-item label="卖家名称" prop="seller">
              <span v-if="!edit">{{tableData[nowRow].seller}}</span>
              <el-input v-else v-model="tableData[nowRow].seller"></el-input>
            </el-form-item>
            <el-form-item
                label="商品图"
                prop="imgLink">
              <img :src=tableData[nowRow].imgLink alt="" style="width: 150px;height: 150px">
            </el-form-item>
            <el-form-item label="价格" prop="price">
              <span v-if="!edit">{{tableData[nowRow].price}}</span>
              <el-input v-else v-model="tableData[nowRow].price"  ></el-input>
            </el-form-item>
            <el-form-item label="订单状态" prop="status">
              <span v-if="!edit">{{tableData[nowRow].status}}</span>
              <el-input v-else v-model="tableData[nowRow].status"  ></el-input>
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
import {baseURL} from '@/http';

const commodityUrl = baseURL.commodity;
export default {
  name: "wallet",
  data() {
    return {
      money: "777",
      showDialog: false,
      showDialog2: false,
      edit: false,
      nowRow: 0,
      seq: 0,
      search: "",
      dataTotalCount: 0,      //查询条件的总数据量
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
      commodity1: {
        id: "",
        seller: "",
        name: "",
        imgLink: "",
        price: "",
        status: "",
        vendorName: "",
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
          'token': localStorage['token']
        },
        method: "get",
        url: `/commodity/lists`,
        params: {
          username: "tet",
        }
      })
          .then(response => {
            this.money = response.data.money
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
          'token': localStorage['token']
        },
        method: "get",
        //改
        url: `${commodityUrl}/commodity/lists`,
        params: {
          username: "tests",
          pagesize: this.formInline.pageSize,
          page: this.formInline.currentPage,
          seq: this.seq
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
        headers:{
          'token':localStorage['token']
        },
        method:"get",
        url:"/order/get",
        params:{
          id:row.orderId
        }


      }).then(response=>{
        if(response.data.code===200){
          this.commodity1 = response.data
        }
      })
      console.log(index, row);
    },
    handleDelete(index, row) {
      this.http({
            headers: {
              'token': 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJiYThlYmM2MC01MmQ1LTQ2NTctOTMzZi0zMWIzNGNkYjc4YTkiLCJzdWIiOiJ7XCJyb2xlXCI6XCJhZG1pblwiLFwic3VjY2Vzc1wiOlwiU1VDQ0VTU1wiLFwidXNlcm5hbWVcIjpcInhpYW9xdWFuYmluXCJ9IiwiaXNzIjoiYWRtaW4iLCJpYXQiOjE2MzUwNjA4NzcsImV4cCI6MTYzNTA2NDQ3N30.Yirgbn607G0W3cWwb74JJTZpJILlTudikQjnao1I0cc'
            },
            method: "delete",
            url: `/commodity/item/${row.id}`,
          }
      ).then(res => {
        if (res.data.code === 200) {
          this.getList();
          this.$message({
            type: 'success',
            message: '删除成功'
          });
        } else {
          this.$message({
            type: 'error',
            message: '系统异常：'
          });
        }
      })
    },
    handleEdit() {
      this.edit = true;
    },
    handleSubmit() {
      this.showDialog = false;
      this.edit = false;
      this.http({
        headers: {
          'Content-Type': 'application/json;',
          'token': 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJiYThlYmM2MC01MmQ1LTQ2NTctOTMzZi0zMWIzNGNkYjc4YTkiLCJzdWIiOiJ7XCJyb2xlXCI6XCJhZG1pblwiLFwic3VjY2Vzc1wiOlwiU1VDQ0VTU1wiLFwidXNlcm5hbWVcIjpcInhpYW9xdWFuYmluXCJ9IiwiaXNzIjoiYWRtaW4iLCJpYXQiOjE2MzUwNjA4NzcsImV4cCI6MTYzNTA2NDQ3N30.Yirgbn607G0W3cWwb74JJTZpJILlTudikQjnao1I0cc'
        },
        method: "put",
        url: `${commodityUrl}/commodity/item`,
        transformRequest: [function (data) {
          return JSON.stringify(data)
        }],
        data: {
          id: this.tableData[this.nowRow].id,
          name: this.tableData[this.nowRow].name,
          imgLink: this.tableData[this.nowRow].imgLink,
          price: this.tableData[this.nowRow].price,
          status: this.tableData[this.nowRow].status,
          vendorName: this.tableData[this.nowRow].vendorName,
        }
      })
          .then(response => {
            if (response.data.code === 201) {
              this.getList()
              this.$message({
                type: 'success',
                message: '修改成功：'
              });
            }
          })
          .catch(function (error) {
            this.$message({
              type: 'error',
              message: '系统异常：' + error
            });
          });
    },

    doSearch() {
      this.http({
            headers: {
              'token': 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI4NTY1YzkyYi04MWQyLTQzMjktOWEyZS1iZTQxYTVlYjAyMjYiLCJzdWIiOiJ7XCJyb2xlXCI6XCJidXllclwiLFwic3VjY2Vzc1wiOlwiU1VDQ0VTU1wiLFwidXNlcm5hbWVcIjpcInRlc3QwMVwifSIsImlzcyI6ImFkbWluIiwiaWF0IjoxNjM0OTY3MDc1LCJleHAiOjE2MzQ5NzA2NzV9.DvuJGR3y4ukfHdMjUD9RNCkcgu8KSamNquU_bq5DQjY'
            },
            method: "get",
            url: `${commodityUrl}/commodity/search`,
            params: {
              q: this.search,
              pagesize: this.formInline.pageSize,
              page: this.formInline.currentPage,
              seq: this.seq
            }
          }
      ).then(res => {
        if (res.data.code === 200) {
          this.tableData = res.data.data.rows;
          this.dataTotalCount = res.data.data.records;
        } else {
          this.$message({
            type: 'error',
            message: '没有找到相关商品'
          });
        }
      })
    },
    addCommodity() {
      this.showDialog2 = true;
    },
    handleAdd() {
      this.showDialog2 = false;
      this.http({
        headers: {
          'Content-Type': 'application/json;',
          'token': 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJiYThlYmM2MC01MmQ1LTQ2NTctOTMzZi0zMWIzNGNkYjc4YTkiLCJzdWIiOiJ7XCJyb2xlXCI6XCJhZG1pblwiLFwic3VjY2Vzc1wiOlwiU1VDQ0VTU1wiLFwidXNlcm5hbWVcIjpcInhpYW9xdWFuYmluXCJ9IiwiaXNzIjoiYWRtaW4iLCJpYXQiOjE2MzUwNjA4NzcsImV4cCI6MTYzNTA2NDQ3N30.Yirgbn607G0W3cWwb74JJTZpJILlTudikQjnao1I0cc'
        },
        method: "post",
        url: `${commodityUrl}/commodity/item`,
        transformRequest: [function (data) {
          return JSON.stringify(data)
        }],
        data: {
          name: this.commodity1.name,
          imgLink: this.commodity1.imgLink,
          price: this.commodity1.price,
          description: this.commodity1.description,
          inventory: this.commodity1.inventory,
          vendorName: this.commodity1.vendorName,
        }
      })
          .then(response => {
            if (response.data.code === 201) {
              this.$message({
                type: 'success',
                message: '添加成功：'
              });
            }
          })
    }
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
