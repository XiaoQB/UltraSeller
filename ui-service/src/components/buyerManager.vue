<template>
  <div>
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
          label="昵称"
          prop="name">
      </el-table-column>
      <el-table-column
          label="联系电话"
          prop="phone">
      </el-table-column>
      <el-table-column
          label="性别"
          prop="sex">
      </el-table-column>
      <el-table-column
          label="邮箱号"
          prop="email">
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
  name: "buyerManager",
  data(){
    return {
      dataTotalCount: 0,      //查询条件的总数据量
      formInline: {
        currentPage: 1,
        pageSize:10,
      },
      tableData: [],
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

    getList() {
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

  }
}
</script>

<style scoped>

</style>