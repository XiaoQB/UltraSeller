<template>
  <div>
    <el-dialog title="卖家详情" :visible.sync="showDialog" width="45%">
      <el-form ref="tableData" :model="tableData[nowRow]" label-width="100px">
        <el-form-item label="昵称" prop="userName">
          <span v-if="!edit">{{ tableData[nowRow].userName }}</span>
          <el-input v-else v-model="tableData[nowRow].userName"></el-input>
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <span v-if="!edit">{{ tableData[nowRow].phone }}</span>
          <el-input v-else v-model="tableData[nowRow].phone"></el-input>
        </el-form-item>
        <el-form-item label="邮箱号" prop="email">
          <span v-if="!edit">{{ tableData[nowRow].email }}</span>
          <el-input v-else v-model="tableData[nowRow].email"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
          ` <el-button @click="handleEdit(nowRow)">编辑</el-button>
            <el-button type="primary" @click="handleSubmit()">提交</el-button>
        </span>
    </el-dialog>
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
          {{ (formInline.currentPage - 1) * formInline.pageSize + scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column
          label="id"
          prop="id">
      </el-table-column>
      <el-table-column
          label="昵称"
          prop="userName">
      </el-table-column>
      <el-table-column
          label="联系电话"
          prop="phone">
      </el-table-column>
      <el-table-column
          label="邮箱号"
          prop="email">
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
  </div>
</template>

<script>
import {baseURL} from "@/http";

const userUrl = baseURL.user;
export default {
  name: "sellerManager",
  data() {
    return {
      showDialog: false,
      edit: false,
      nowRow: 0,
      dataTotalCount: 0,      //查询条件的总数据量
      formInline: {
        currentPage: 1,
        pageSize: 10,
      },
      tableData: [],
    }
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

    getList(data) {
      if (data) {
        this.formInline.info = data.info;
        this.formInline.pType = data.pType;
        this.formInline.floor = data.floor;
      }
      var that = this;
      this.http({
        headers: {

          "Authorization": localStorage['token']
        },
        method: "get",
        url: `${userUrl}/user/info`,
        params: {
          role: "saler",
          num: this.formInline.pageSize,
          page: this.formInline.currentPage
        }
      })
          .then(response => {

            console.log(response.data.data)
            if (response.data.code === 200) {
              this.tableData = response.data.data;
              that.dataTotalCount = response.data.size;
            }
            if (response.data.code === 200) {
              that.$message({
                type: 'success',
                message: '刷新列表成功'
              });
              that.tableData = response.data.data.userList;
              that.dataTotalCount = response.data.data.num;

            }
          })
          .catch(function (error) {
            that.$message({
              type: 'error',
              message: '系统异常：' + error
            });
          });
    },
    getDetail(index, row) {
      this.showDialog = true;
      this.nowRow = index;
      console.log(index, row);
    },
    handleDelete(index, row) {
      this.http({
            headers: {
              'Content-Type': 'application/json;',
              'Authorization': localStorage['token']
            },
            method: "delete",
            url: `${userUrl}/user/delete`,
            transformRequest: [function (data) {
              return JSON.stringify(data)
            }],
            data: {
              id: this.tableData[index].id,

              role: "saler",
              userName: this.tableData[index].name,

            }
          }
      ).then(res => {
        if (res.data.code === 200) {
          this.$message({
            type: 'success',
            message: '删除成功：'
          });
          this.getList();
        } else {
          this.$message({
            type: 'error',
            message: '系统异常：'
          });
        }
      })

      console.log(index, row);

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
          'Authorization': localStorage['token']
        },
        method: "put",
        url: `${userUrl}/user/modify`,
        transformRequest: [function (data) {
          return JSON.stringify(data)
        }],
        data: {
          id: this.tableData[this.nowRow].id,
          userName: this.tableData[this.nowRow].name,
          role: "saler",
          phone: this.tableData[this.nowRow].phone,
          email: this.tableData[this.nowRow].email,
        }
      })
          .then(response => {
            if (response.data.code === 200) {
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

    }


  }
}
</script>

<style scoped>

</style>
