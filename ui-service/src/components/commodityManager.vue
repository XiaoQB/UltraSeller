<template>
  <div>
    <div>
      <el-input placeholder="请输入搜索商品的名称" v-model="search" style="width:200px;"></el-input>
      <el-button @click="doSearch(search)" type="primary" icon="el-icon-search" align="right" >搜索商品</el-button>
      <el-button type="primary" class = "buttonadd" @click="addCommodity" round style="width:100px;">添加商品</el-button>
      <el-dialog title="商品详情" :visible.sync="showDialog" width="45%">
        <el-form ref="tableData" :model="tableData[nowRow]"  label-width="100px">
          <el-form-item label="编号" prop="id">
            <span v-if="!edit">{{tableData[nowRow].id}}</span>
            <el-input v-else v-model="tableData[nowRow].id"></el-input>
          </el-form-item>
          <el-form-item label="商品名称" prop="name">
            <span v-if="!edit">{{tableData[nowRow].name}}</span>
            <el-input v-else v-model="tableData[nowRow].name"></el-input>
          </el-form-item>
          <el-form-item
              label="图片"
              prop="imgLink">
            <img :src=tableData[nowRow].imgLink alt="" style="width: 150px;height: 150px">
          </el-form-item>
          <el-form-item label="价格" prop="price">
            <span v-if="!edit">{{tableData[nowRow].price}}</span>
            <el-input v-else v-model="tableData[nowRow].price"  ></el-input>
          </el-form-item>
          <el-form-item label="商品描述" prop="description">
            <span v-if="!edit">{{tableData[nowRow].description}}</span>
            <el-input  v-else v-model="tableData[nowRow].description" ></el-input>
          </el-form-item>
          <el-form-item label="库存" prop="inventory">
            <span v-if="!edit">{{tableData[nowRow].inventory}}</span>
            <el-input v-else v-model="tableData[nowRow].inventory" ></el-input>
          </el-form-item>
          <el-form-item label="所有者名字" prop="vendorName">
            <span v-if="!edit">{{tableData[nowRow].vendorName}}</span>
            <el-input v-else v-model="tableData[nowRow].vendorName"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          ` <el-button @click="handleEdit(nowRow)">编辑</el-button>
            <el-button type="primary" @click="handleSubmit()">提交</el-button>
        </span>
      </el-dialog>
      <el-dialog title="添加商品" :visible.sync="showDialog2" width="45%">
        <el-form ref="commodity1" :model="commodity1"  label-width="100px">
          <el-form-item label="商品名称" prop="name">
            <el-input  v-model="commodity1.name"></el-input>
          </el-form-item>
          <el-form-item placeholder="目前只支持输入图片链接"
              label="图片"
              prop="imgLink">
            <el-input  v-model="commodity1.imgLink"></el-input>
          </el-form-item>
          <el-form-item label="价格" prop="price">
            <el-input  v-model="commodity1.price"  ></el-input>
          </el-form-item>
          <el-form-item label="商品描述" prop="description">
            <el-input   v-model="commodity1.description" ></el-input>
          </el-form-item>
          <el-form-item label="库存" prop="inventory">
            <el-input  v-model="commodity1.inventory" ></el-input>
          </el-form-item>
          <el-form-item label="所有者名字" prop="vendorName">
            <el-input v-model="commodity1.vendorName"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
            <el-button type="primary" @click="handleAdd()">提交</el-button>
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
          label="商品编号"
          prop="id">
      </el-table-column>
      <el-table-column
          label="商品名称"
          prop="name">
        <template slot-scope="scope">
          <el-input placeholder="请输入内容" v-show="scope.row.show" v-model="scope.row.name"></el-input>
          <span v-show="!scope.row.show">{{scope.row.name}}</span>
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
              @click="getDetail(scope.$index, scope.row)">详情</el-button>
          <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination background
                   layout="total, prev, pager, next, sizes,jumper"
                   :page-sizes="[6, 12, 18]"
                   :page-size="formInline.pageSize"
                   :total="dataTotalCount"
                   @size-change="handleSizeChange"
                   @current-change="handleCurrentChange">
    </el-pagination>
  </div>
</template>

<script>
import {baseURL} from "@/http";
const commodityUrl = baseURL.commodity;

const userUrl = baseURL.user

export default {
  name: "commodityManager",
  data(){
    return {
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
          name:"面包",
          imgLink:"https://ts3.cn.mm.bing.net/th/id/OIP-C.305fYj0cWoTv_Q8TIbJ02wHaHG?w=196&h=188&c=7&r=0&o=5&dpr=2&pid=1.7",
          price:"10",
          description:"好吃",
          inventory:"10",
          vendorName:"test01",
        },
        {
          id:"20210101002",
          name:"白酒",
          imgLink:"https://ts1.cn.mm.bing.net/th/id/OIP-C.PWh-k1csn9MRuq9-kqf0wwHaLG?w=196&h=293&c=7&r=0&o=5&dpr=2&pid=1.7",
          price:"100",
          description:"一喝就倒",
          inventory:"10",
          vendorName:"test01",
        },
        {
          id:"20210101003",
          name:"卫生纸",
          imgLink:"https://ts2.cn.mm.bing.net/th/id/OIP-C.3yAPWpweG_grlE-hx0GSbQHaE7?w=255&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
          price:"10",
          description:"可以擦皮皮",
          inventory:"10",
          vendorName:"test01",
        },
        {
          id:"20210101004",
          name:"矿泉水",
          imgLink:"https://ts3.cn.mm.bing.net/th/id/OIP-C.fIfwcxCc6sjAUWxifyiJQAHaHa?w=205&h=205&c=7&r=0&o=5&dpr=2&pid=1.7",
          price:"2",
          description:"没有虫卵的农夫山泉",
          inventory:"25",
          vendorName:"test01",
        },


      ],
      commodity1: {
        name:"",
        imgLink:"",
        price:"",
        description:"",
        inventory:"",
        vendorName:"",

      },
      salerList:{

      }
    }
  },
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

    getList(data) {
      if(data){
        this.formInline.info = data.info;
        this.formInline.pType = data.pType;
        this.formInline.floor = data.floor;
      }

      var that = this;
      this.http({
        headers:{
          'token':localStorage['token']
        },
        method:"get",
        url:`${commodityUrl}/commodity/lists`,
        params:{
          username:"tet",
          pagesize:this.formInline.pageSize,
          page:this.formInline.currentPage,
          seq:this.seq
        }
      })
          .then(response=> {
            that.$message({
              type: 'success',
              message: '获取列表成功'
            });
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
              'token':localStorage['token']
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
    getSalerList(){
      var that = this;
      this.http({
        headers:{
          'Authorization':localStorage['token']
        },
        method:"get",
        url:`${userUrl}/user/info`,
        params:{
          role:"saler",
          num:this.formInline.pageSize,
          page:this.formInline.currentPage
        }
      })
          .then( response=> {
            if(response.data.code === 200) {
              that.salerList = response.data.data.userList;
            }
          })
          .catch(function (error) {
            that.$message({
              type: 'error',
              message: '获取卖家信息：'+error
            });
          });
    },

    handleSubmit(){
      this.showDialog=false;
      this.edit=false;
      this.http({
        headers:{
          'Content-Type': 'application/json;',
          'token':localStorage['token']
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
          description:this.tableData[this.nowRow].description,
          inventory:this.tableData[this.nowRow].inventory,
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



    doSearch(search){
      this.http({
        headers:{
          'token':localStorage['token']
        },
        method:"get",
        url:`${commodityUrl}/commodity/search`,
        params:{
          q:search,
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
          'token':localStorage['token']
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