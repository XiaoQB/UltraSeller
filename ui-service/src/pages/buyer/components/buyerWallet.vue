<template>
  <div id="buyerWallet" class="buyerWallet">
    <el-main>
      <el-descriptions title="钱包信息" column="2">
        <el-descriptions-item label="钱包余额"
          >{{ money }} RMB</el-descriptions-item
        >
        <el-descriptions-item class="payment" label="总价"
          >{{ payment }} RMB</el-descriptions-item
        >
      </el-descriptions>
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
        <el-table-column label="订单编号" prop="id"> </el-table-column>
        <el-table-column label="商品名称" prop="name">
          <template slot-scope="scope">
            <el-input
              placeholder="请输入内容"
              v-show="scope.row.show"
              v-model="scope.row.name"
            ></el-input>
            <span v-show="!scope.row.show">{{ scope.row.name }}</span>
          </template>
        </el-table-column>
        <el-table-column label="图片" prop="imgLink">
          <template slot-scope="scope">
            <el-popover placement="top-start" title="" trigger="hover">
              <img
                :src="scope.row.imgLink"
                alt=""
                style="width: 150px;height: 150px"
              />
              <img
                slot="reference"
                :src="scope.row.imgLink"
                style="width: 100px;height: 100px"
              />
            </el-popover>
          </template>
        </el-table-column>
        <el-table-column label="价格" prop="price"> </el-table-column>
        <el-table-column label="收货地址" prop="address"> </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <div v-if="scope.row.status !== '已完成'">
              <el-button size="mini" @click="returnBack(scope.row)"
                >退货</el-button
              >
            </div>
          </template>
        </el-table-column>
      </el-table>
    </el-main>
  </div>
</template>

<script>
import { baseURL } from "@/http";

const commodityUrl = baseURL;
export default {
  name: "wallet",
  data() {
    return {
      money: 200,
      payment: 0,
    };
  },

  methods: {
    getMoney() {
      this.http({
        headers: {
          token: localStorage["token"],
        },
        method: "get",
        url: `${commodityUrl}/wallet/user`,
        params: {
          username: localStorage.getItem("user_id"),
        },
      })
        .then((response) => {
          this.money = response.data.money;
        })
        .catch(function(error) {
          this.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
    },

    handleDelete() {},
    handleEdit() {
      this.edit = true;
    },
    handleSubmit() {},

    doSearch() {
      this.http({
        headers: {
          token:
            "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI4NTY1YzkyYi04MWQyLTQzMjktOWEyZS1iZTQxYTVlYjAyMjYiLCJzdWIiOiJ7XCJyb2xlXCI6XCJidXllclwiLFwic3VjY2Vzc1wiOlwiU1VDQ0VTU1wiLFwidXNlcm5hbWVcIjpcInRlc3QwMVwifSIsImlzcyI6ImFkbWluIiwiaWF0IjoxNjM0OTY3MDc1LCJleHAiOjE2MzQ5NzA2NzV9.DvuJGR3y4ukfHdMjUD9RNCkcgu8KSamNquU_bq5DQjY",
        },
        method: "get",
        url: `${commodityUrl}/commodity/search`,
        params: {
          q: this.search,
          pagesize: this.formInline.pageSize,
          page: this.formInline.currentPage,
          seq: this.seq,
        },
      }).then((res) => {
        if (res.data.code === 200) {
          this.tableData = res.data.data.rows;
          this.dataTotalCount = res.data.data.records;
        } else {
          this.$message({
            type: "error",
            message: "没有找到相关商品",
          });
        }
      });
    },
  },
};
</script>

<style scoped>
</style>
