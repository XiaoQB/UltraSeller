<template>
  <div>
    <el-dialog title="买家详情" :visible.sync="showDialog" width="45%">
      <el-form ref="tableData" :model="detailData" label-width="100px">
        <el-form-item label="用户ID" prop="id">
          <span>{{ detailData.id }}</span>
        </el-form-item>
        <el-form-item label="昵称" prop="userName">
          <span v-if="!edit">{{ detailData.userName }}</span>
          <el-input v-else v-model="detailData.userName"></el-input>
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <span v-if="!edit">{{ detailData.phone }}</span>
          <el-input v-else v-model="detailData.phone"></el-input>
        </el-form-item>
        <el-form-item label="邮箱号" prop="email">
          <span v-if="!edit">{{ detailData.email }}</span>
          <el-input v-else v-model="detailData.email"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        ` <el-button @click="edit = true">编辑</el-button>
        <el-button type="primary" @click="handleSubmit()">提交</el-button>
      </span>
    </el-dialog>
    <el-table :data="tableData" border stripe style="width: 100%">
      <el-table-column label="序号" align="center" width="70px">
        <template slot-scope="scope">
          {{
            (formInline.currentPage - 1) * formInline.pageSize +
              scope.$index +
              1
          }}
        </template>
      </el-table-column>
      <el-table-column label="id" prop="id"> </el-table-column>
      <el-table-column label="昵称" prop="userName"> </el-table-column>
      <el-table-column label="联系电话" prop="phone"> </el-table-column>
      <el-table-column label="邮箱号" prop="email"> </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button size="mini" @click="getDetail(scope.row)"
            >详情
          </el-button>
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.row.userName)"
            >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- <el-pagination
      background
      layout="total, prev, pager, next, sizes,jumper"
      :page-sizes="[5, 10, 15]"
      :page-size="formInline.pageSize"
      :total="dataTotalCount"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
    >
    </el-pagination> -->
  </div>
</template>

<script>
export default {
  name: "buyerManager",
  data() {
    return {
      showDialog: false,
      edit: false,
      nowRow: 0,
      dataTotalCount: 0, //查询条件的总数据量
      formInline: {
        currentPage: 1,
        pageSize: 10,
      },
      tableData: [],
      detailData: {
        id: "",
        userName: "",
        phone: "",
        email: "",
      },
    };
  },
  methods: {
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
      this.http({
        headers: {
          Authorization: localStorage.getItem("token"),
        },
        method: "get",
        url: `/api/user/info`,
        params: {
          role: "buyer",
          num: this.formInline.pageSize,
          page: this.formInline.currentPage,
        },
      })
        .then((response) => {
          console.log(response.data.data);
          if (response.data.code === 200) {
            that.$message({
              type: "success",
              message: "获得列表成功",
            });
            this.tableData = response.data.data.userList;
            that.dataTotalCount = response.data.data.num;
          }
        })
        .catch((error) => {
          that.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
    },
    getDetail(data) {
      this.showDialog = true;
      this.detailData.id = data.id;
      this.detailData.userName = data.userName;
      this.detailData.phone = data.phone;
      this.detailData.email = data.email;
    },
    handleDelete(name) {
      this.http({
        headers: {
          token: localStorage.getItem("token"),
          role: "buyer",
        },
        method: "delete",
        url: `/api/user/delete`,
        data: {
          userName: name,
          role: "buyer",
        },
      }).then((res) => {
        if (res.data.code === 200) {
          this.$message({
            type: "success",
            message: "删除成功：",
          });
          this.getList();
        } else {
          this.$message({
            type: "error",
            message: "系统异常：",
          });
        }
      });
    },
    handleSubmit() {
      this.showDialog = false;
      this.edit = false;
      this.http({
        headers: {
          "Content-Type": "application/json;",
          Authorization: localStorage.getItem("token"),
          role: "admin",
        },
        method: "put",
        url: `/api/user/modify`,
        data: {
          id: this.detailData.id,
          userName: this.detailData.userName,
          role: "buyer",
        },
      })
        .then((response) => {
          if (response.data.code === 200) {
            this.$message({
              type: "success",
              message: "修改成功：",
            });
          }
        })
        .catch(function(error) {
          this.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
    },
  },
};
</script>

<style scoped></style>
