<template>
  <div>
    <div>

      <el-descriptions title="钱包信息">
        <el-descriptions-item label="钱包余额">{{money}}</el-descriptions-item>
        <el-descriptions-item label="余额宝">888</el-descriptions-item>
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

        //这里如何修改？
        <span slot="footer" class="dialog-footer">
          ` <el-button @click="handleEdit(nowRow)">编辑</el-button>
            <el-button type="primary" @click="handleSubmit()">提交</el-button>
        </span>
      </el-dialog>
    </div>

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
          {{(formInline.currentPage-1)*formInline.pageSize + scope.$index + 1}}
        </template>
      </el-table-column>
      <el-table-column
          label="订单编号"
          prop="id">
      </el-table-column>

      //这里为啥不一样？
      <el-table-column
          label="卖家名称"
          prop="name">
        <template slot-scope="scope">
          <el-input placeholder="请输入内容" v-show="scope.row.show" v-model="scope.row.name"></el-input>
          <span v-show="!scope.row.show">{{scope.row.name}}</span>
        </template>
      </el-table-column>
      <el-table-column
          label="商品图"
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
          label="状态"
          prop="status">
      </el-table-column>

      //需要什么操作，如何修改？
      <el-table-column
          label="操作">
        <template slot-scope="scope">
          <el-button
              size="mini"
              @click="getDetail(scope.$index, scope.row)">详情</el-button>
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
  </div>
</template>

<script>
import {baseURL} from '@/http';
const commodityUrl = baseURL.commodity;
export default {
  name: "wallet",
  data(){
    return {
      money:"777",
      showDialog:false,
      showDialog2:false,
      edit:false,
      nowRow:0,
      seq:0,
      search:"",
      dataTotalCount: 0,      //查询条件的总数据量
      formInline: {
        currentPage: 1,
        pageSize:10,
      },
      tableData: [
        {
          id:"20210101001",
          seller:"达利园面包旗舰店",
          imgLink:"https://ts3.cn.mm.bing.net/th/id/OIP-C.305fYj0cWoTv_Q8TIbJ02wHaHG?w=196&h=188&c=7&r=0&o=5&dpr=2&pid=1.7",
          price:"10",
          status:"已完成",
          vendorName:"test01",
        },
        {
          id:"20210101002",
          seller:"茅台旗舰店",
          imgLink:"https://ts1.cn.mm.bing.net/th/id/OIP-C.PWh-k1csn9MRuq9-kqf0wwHaLG?w=196&h=293&c=7&r=0&o=5&dpr=2&pid=1.7",
          price:"100",
          status:"已完成",
          vendorName:"test01",
        },
        {
          id:"20210101003",
          seller:"心相印抽纸旗舰店",
          imgLink:"https://ts2.cn.mm.bing.net/th/id/OIP-C.3yAPWpweG_grlE-hx0GSbQHaE7?w=255&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
          price:"10",
          status:"已完成",
          vendorName:"test01",
        },
        {
          id:"20210101004",
          seller:"农夫山泉旗舰店",
          imgLink:"https://ts3.cn.mm.bing.net/th/id/OIP-C.fIfwcxCc6sjAUWxifyiJQAHaHa?w=205&h=205&c=7&r=0&o=5&dpr=2&pid=1.7",
          price:"2",
          status:"已完成",
          vendorName:"test01",
        },


      ],
      commodity1: {
        id:"",
        seller:"",
        name:"",
        imgLink:"",
        price:"",
        status:"",
        vendorName:"",
      }
    }
  },

  //需要哪些methods
  methods:{
    //分页 初始页currentPage、初始每页数据数pagesize和数据testpage--->控制每页几条
    handleSizeChange: function(size) {
      this.formInline.pageSize = size;
      this.getList();
    },

    // 控制页面的切换
    handleCurrentChange: function(currentpage) {
      this.formInline.currentPage = currentpage;
      this.getList();
    },
    getMoney(){
      this.http({
        headers:{
          'token':localStorage['token']
        },
        method:"get",
        //改
        url:`${commodityUrl}/commodity/lists`,
        params:{
          username:"tet",
        }
      })
          .then(response=> {
            this.money =  response.data.money
          })
          .catch(function (error) {
            this.$message({
              type: 'error',
              message: '系统异常：'+error
            });
          });

    },


    getList() {
      var that = this;
      this.http({
        headers:{
          'token':localStorage['token']
        },
        method:"get",
        //改
        url:`${commodityUrl}/commodity/lists`,
        params:{
          username:"tests",
          pagesize:this.formInline.pageSize,
          page:this.formInline.currentPage,
          seq:this.seq
        }
      })
          .then(response=> {
            that.tableData = response.data.rows;
            that.dataTotalCount = response.data.records;
          })
          .catch(function (error) {
            that.$message({
              type: 'error',
              message: '系统异常：'+error
            });
          });
    },
    getDetail(index, row) {
      this.showDialog=true;
      this.nowRow=index;
      console.log(index, row);
    },
    handleDelete(index, row) {
      this.http({
            headers:{
              'token':'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJiYThlYmM2MC01MmQ1LTQ2NTctOTMzZi0zMWIzNGNkYjc4YTkiLCJzdWIiOiJ7XCJyb2xlXCI6XCJhZG1pblwiLFwic3VjY2Vzc1wiOlwiU1VDQ0VTU1wiLFwidXNlcm5hbWVcIjpcInhpYW9xdWFuYmluXCJ9IiwiaXNzIjoiYWRtaW4iLCJpYXQiOjE2MzUwNjA4NzcsImV4cCI6MTYzNTA2NDQ3N30.Yirgbn607G0W3cWwb74JJTZpJILlTudikQjnao1I0cc'
            },
            method:"delete",
            url:`${commodityUrl}/commodity/item/${row.id}`,
          }
      ).then(res=>{
        if(res.data.code===200){
          this.getList();
          this.$message({
            type: 'success',
            message: '删除成功'
          });
        }else{
          this.$message({
            type: 'error',
            message: '系统异常：'
          });
        }
      })
    },
    handleEdit(){
      this.edit=true;
    },
    handleSubmit(){
      this.showDialog=false;
      this.edit=false;
      this.http({
        headers:{
          'Content-Type': 'application/json;',
          'token':'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJiYThlYmM2MC01MmQ1LTQ2NTctOTMzZi0zMWIzNGNkYjc4YTkiLCJzdWIiOiJ7XCJyb2xlXCI6XCJhZG1pblwiLFwic3VjY2Vzc1wiOlwiU1VDQ0VTU1wiLFwidXNlcm5hbWVcIjpcInhpYW9xdWFuYmluXCJ9IiwiaXNzIjoiYWRtaW4iLCJpYXQiOjE2MzUwNjA4NzcsImV4cCI6MTYzNTA2NDQ3N30.Yirgbn607G0W3cWwb74JJTZpJILlTudikQjnao1I0cc'
        },
        method:"put",
        url:`${commodityUrl}/commodity/item`,
        transformRequest:[function (data){
          return JSON.stringify(data)
        }],
        data:{
          id:this.tableData[this.nowRow].id,
          name:this.tableData[this.nowRow].name,
          imgLink:this.tableData[this.nowRow].imgLink,
          price:this.tableData[this.nowRow].price,
          status:this.tableData[this.nowRow].status,
          vendorName:this.tableData[this.nowRow].vendorName,
        }
      })
          .then(response=> {
            if(response.data.code===201){
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
              message: '系统异常：'+error
            });
          });
    },



    doSearch(){
      this.http({
            headers:{
              'token':'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI4NTY1YzkyYi04MWQyLTQzMjktOWEyZS1iZTQxYTVlYjAyMjYiLCJzdWIiOiJ7XCJyb2xlXCI6XCJidXllclwiLFwic3VjY2Vzc1wiOlwiU1VDQ0VTU1wiLFwidXNlcm5hbWVcIjpcInRlc3QwMVwifSIsImlzcyI6ImFkbWluIiwiaWF0IjoxNjM0OTY3MDc1LCJleHAiOjE2MzQ5NzA2NzV9.DvuJGR3y4ukfHdMjUD9RNCkcgu8KSamNquU_bq5DQjY'
            },
            method:"get",
            url:`${commodityUrl}/commodity/search`,
            params:{
              q:this.search,
              pagesize:this.formInline.pageSize,
              page:this.formInline.currentPage,
              seq:this.seq
            }
          }

      ).then(res=>{
        if(res.data.code===200){
          this.tableData=res.data.data.rows;
          this.dataTotalCount = res.data.data.records;
        }else{
          this.$message({
            type: 'error',
            message: '没有找到相关商品'
          });
        }
      })
    },
    addCommodity(){
      this.showDialog2=true;
    },
    handleAdd(){
      this.showDialog2=false;
      this.http({
        headers:{
          'Content-Type': 'application/json;',
          'token':'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJiYThlYmM2MC01MmQ1LTQ2NTctOTMzZi0zMWIzNGNkYjc4YTkiLCJzdWIiOiJ7XCJyb2xlXCI6XCJhZG1pblwiLFwic3VjY2Vzc1wiOlwiU1VDQ0VTU1wiLFwidXNlcm5hbWVcIjpcInhpYW9xdWFuYmluXCJ9IiwiaXNzIjoiYWRtaW4iLCJpYXQiOjE2MzUwNjA4NzcsImV4cCI6MTYzNTA2NDQ3N30.Yirgbn607G0W3cWwb74JJTZpJILlTudikQjnao1I0cc'
        },
        method:"post",
        url:`${commodityUrl}/commodity/item`,
        transformRequest:[function (data){
          return JSON.stringify(data)
        }],
        data:{
          name:this.commodity1.name,
          imgLink:this.commodity1.imgLink,
          price:this.commodity1.price,
          description:this.commodity1.description,
          inventory:this.commodity1.inventory,
          vendorName:this.commodity1.vendorName,
        }
      })
          .then(response=> {
            if(response.data.code===201){
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
  float:right
}
</style>