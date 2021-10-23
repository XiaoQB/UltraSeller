<template>
  <div>
    <div>
      <el-input placeholder="请输入搜索商品的名称" v-model="search" style="width:200px;"></el-input>
      <el-button @click="doSearch()" type="primary" icon="el-icon-search" align="right" >搜索商品</el-button>
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
        <el-form ref="tableData" :model="commodity"  label-width="100px">
          <el-form-item label="商品名称" prop="name">
            <el-input  v-model="commodity.name"></el-input>
          </el-form-item>
          <el-form-item placeholder="目前只支持输入图片链接"
              label="图片"
              prop="imgLink">
            <el-input  v-model="commodity.imgLink"></el-input>
          </el-form-item>
          <el-form-item label="价格" prop="price">

            <el-input  v-model="commodity.price"  ></el-input>
          </el-form-item>
          <el-form-item label="商品描述" prop="description">
            <el-input   v-model="commodity.description" ></el-input>
          </el-form-item>
          <el-form-item label="库存" prop="inventory">
            <el-input  v-model="commodity.inventory" ></el-input>
          </el-form-item>
          <el-form-item label="所有者名字" prop="vendorName">
            <el-input v-model="commodity.vendorName"></el-input>
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
                   :page-sizes="[5, 10, 15]"
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
          id:"1",
          name:"vhjl",
          imgLink:"https://uploadfile.bizhizu.cn/up/77/22/d9/7722d9f3dca875a7bfdee20adba5e8cc.jpg.source.jpg",
          price:"ass",
          description:"sdc",
          inventory:"asadfa",
          vendorName:"asd",

        }
      ],
      commodity: {
        id:"",
        name:"",
        imgLink:"",
        price:"",
        description:"",
        inventory:"",
        vendorName:"",

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
        url:`${commodityUrl}/commidity/list`,
        params:{
          username:"admin",
          pagesize:this.formInline.pageSize,
          page:this.formInline.currentPage,
          seq:this.seq
        }
      })
          .then(response=> {
            that.tableData = response.data.commodity;
            that.dataTotalCount = response.data.data.total;
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
            url:`${commodityUrl}/commidity/item`,
            params:{
             id:row.id
            }
          }

      ).then(res=>{
        if(res.data.code()===200){
         this.getList();
        }else{
          this.$message({
            type: 'error',
            message: '系统异常：'
          });
        }
      })

      console.log(index, row);

    },
    handleEdit(){
      this.edit=true;
      console("ddd");
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
        url:`${commodityUrl}/commidity/item`,
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
              if(response.data.data.code===200){
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

      console("submit");
    },



    doSearch(){
      this.http({
        headers:{
          'token':localStorage['token']
        },
        method:"get",
        url:`${commodityUrl}/commidity`,
        params:{
          q:this.search,
          pagesize:this.formInline.pageSize,
          page:this.formInline.currentPage,
          seq:this.seq
        }
          }

      ).then(res=>{
        if(res.data.code()===200){
          this.tableData=res.data.rows;
          this.dataTotalCount = res.data.records;
        }else{
          this.$message({
            type: 'error',
            message: '系统异常：'
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
        method:"put",
        url:`${commodityUrl}/commidity/add`,
        transformRequest:[function (data){
          return JSON.stringify(data)
        }],
        data:{
          name:this.commodity.name,
          imgLink:this.commodity.imgLink,
          price:this.commodity.price,
          description:this.commodity.description,
          inventory:this.this.commodity.inventory,
          vendorName:this.commodity.vendorName,
        }
      })
          .then(response=> {
            if(response.data.data.code===200){
              this.$message({
                type: 'success',
                message: '添加成功：'
              });
            }
          })
          .catch(function (error) {
            this.$message({
              type: 'error',
              message: '系统异常：'+error
            });
          });
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