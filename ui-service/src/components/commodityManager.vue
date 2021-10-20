<template>
  <div>
    <el-button type="primary" icon="el-icon-search">Search</el-button>
    <el-table
        :data="tableData"
        border
        stripe
        style="width: 100%">
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
          prop="invntory">
      </el-table-column>
      <el-table-column
          label="审核时间"
          prop="vendorname">
      </el-table-column>
      <el-table-column
          label="Operations">
        <template slot-scope="scope">
          <el-button
              size="mini"
              @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
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
export default {
  name: "commodityManager",
  data(){
    return {
      dataTotalCount: 0,      //查询条件的总数据量
      formInline: {
        currentPage: 1,
        pageSize:10,
      },
      tableData: [
        {
          id:"1",
          name:"sss",
          imgLink:"../assets/left-pic.jpeg",
          price:"ass",
          description:"sdc",
          inventory:"asadfa",
          vendorName:"asd"

        }

      ],
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
      this.axios({
        headers:{
          'Content-Type': 'application/json;',
        },
        method:"get",
        url:"/commidity/lists",
        transformRequest:[function (data){
          return JSON.stringify(data)
        }],
        data:{
          role:"admin",
          name:"admin",
          ps:this.formInline.pageSize,
          page:this.formInline.currentPage
        }
      })
          .then(function (response) {
            that.tableData = response.data.data.items;
            that.dataTotalCount = response.data.data.total;
          })
          .catch(function (error) {
            that.$message({
              type: 'error',
              message: '系统异常：'+error
            });
          });
    },
    handleEdit(index, row) {
      console.log(index, row);
    },
    handleDelete(index, row) {
      console.log(index, row);
    }

  }
}
</script>

<style scoped>

</style>