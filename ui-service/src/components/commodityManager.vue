<template>
  <div>
    <div class="search-bar">
      <el-input
        placeholder="请输入搜索商品的名称"
        v-model="search"
        style="width:400px"
      ></el-input>
      <el-button
        @click="doSearch(search)"
        type="primary"
        icon="el-icon-search"
        align="right"
        style="margin-left: 10px"
        >搜索商品</el-button
      >
      <el-button
        type="primary"
        class="buttonadd"
        @click="showAddCommodity = true"
        round
        style="width:100px;"
        >添加商品</el-button
      >
      <el-dialog title="商品详情" :visible.sync="showDetail" width="45%">
        <el-form
          ref="commodityDetail"
          :model="commodityDetail"
          label-width="100px"
        >
          <el-form-item label="编号" prop="id">
            <span v-if="!edit">{{ commodityDetail.id }}</span>
            <el-input v-else v-model="commodityDetail.id"></el-input>
          </el-form-item>
          <el-form-item label="商品名称" prop="name">
            <span v-if="!edit">{{ commodityDetail.name }}</span>
            <el-input v-else v-model="commodityDetail.name"></el-input>
          </el-form-item>
          <el-form-item label="图片" prop="imgLink">
            <img
              :src="commodityDetail.imgLink"
              style="width: 250px;height: 250px"
              class="item-image"
            />
          </el-form-item>
          <el-form-item label="价格" prop="price">
            <span v-if="!edit">{{ commodityDetail.price }}</span>
            <el-input v-else v-model="commodityDetail.price"></el-input>
          </el-form-item>
          <el-form-item label="商品描述" prop="description">
            <span v-if="!edit">{{ commodityDetail.description }}</span>
            <el-input v-else v-model="commodityDetail.description"></el-input>
          </el-form-item>
          <el-form-item label="库存" prop="inventory">
            <span v-if="!edit">{{ commodityDetail.inventory }}</span>
            <el-input v-else v-model="commodityDetail.inventory"></el-input>
          </el-form-item>
          <el-form-item label="所有者名字" prop="vendorName">
            <span v-if="!edit">{{ commodityDetail.vendorName }}</span>
            <el-input v-else v-model="commodityDetail.vendorName"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          ` <el-button @click="edit = true">编辑</el-button>
          <el-button type="primary" @click="handleSubmit(commodityDetail)"
            >提交</el-button
          >
        </span>
      </el-dialog>
      <el-dialog title="添加商品" :visible.sync="showAddCommodity" width="45%">
        <el-form ref="commodity" :model="commodity" label-width="100px">
          <el-form-item label="商品名称" prop="name">
            <el-input v-model="commodity.name"></el-input>
          </el-form-item>
          <el-form-item label="图片" prop="imgLink">
            <el-upload
              class="upload-demo"
              action="https://jsonplaceholder.typicode.com/posts/"
              :before-upload="beforeAvatarUpload"
              :http-request="handleUpload"
            >
              <el-button size="small" type="primary">点击上传</el-button>
              <div slot="tip" class="el-upload__tip">
                jpg/png 文件大小小于500kb
              </div>
            </el-upload>
          </el-form-item>
          <el-form-item label="价格" prop="price">
            <el-input v-model="commodity.price"></el-input>
          </el-form-item>
          <el-form-item label="商品描述" prop="description">
            <el-input v-model="commodity.description"></el-input>
          </el-form-item>
          <el-form-item label="库存" prop="inventory">
            <el-input v-model="commodity.inventory"></el-input>
          </el-form-item>
          <el-form-item label="所有者名字" prop="vendorName">
            <el-input v-model="commodity.vendorName"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button type="primary" @click="showAddCommodity = false"
            >取消</el-button
          >
          <el-button type="primary" @click="handleAdd()">提交</el-button>
        </span>
      </el-dialog>
    </div>
    <div class="admin-commodity-table">
      <el-table :data="tableData" style="margin-top: 20px" border>
        <el-table-column label="编号" type="index"></el-table-column>
        <el-table-column prop="id" label="商品编号"></el-table-column>
        <el-table-column prop="name" label="商品名称"></el-table-column>
        <el-table-column label="商品图片">
          <template prop="imgLink" slot-scope="scope">
            <img
              :src="scope.row.imgLink"
              class="item-image"
              style="width: 150px;height: 150px"
            />
          </template>
        </el-table-column>
        <el-table-column prop="description" label="商品描述"></el-table-column>
        <el-table-column prop="price" label="商品价格"></el-table-column>
        <el-table-column prop="vendorId" label="卖家ID"></el-table-column>
        <el-table-column prop="vendorName" label="卖家"></el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button @click="getDetail(scope.row)">详情</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
import { getFileNameUUID, put } from "../services/alioss";

export default {
  name: "commodityManager",
  data() {
    return {
      showDetail: false,
      showAddCommodity: false,
      edit: false,
      nowRow: 0,
      seq: 0,
      search: "",
      currentPage: 1,
      pageSize: 10,
      tableData: [],
      commodityDetail: {
        id: "",
        name: "",
        imgLink: "",
        price: "",
        description: "",
        inventory: "",
        vendorName: "",
      },
      commodity: {
        id: "",
        name: "",
        imgLink: "",
        price: "",
        description: "",
        inventory: "",
        vendorName: "",
      },
      salerList: {},
      uploadPic: "",
    };
  },
  mounted() {
    this.getList();
  },
  methods: {
    getList() {
      this.http({
        headers: {
          token: sessionStorage.getItem("token"),
          role: "admin",
        },
        method: "GET",
        url: `/api/commodity/listall`,
        params: {
          pagesize: this.pageSize,
          page: this.currentPage,
          seq: this.seq,
        },
      })
        .then((response) => {
          this.$message({
            type: "success",
            message: "获取列表成功",
          });
          this.tableData = response.data.data.rows;
        })
        .catch((error) => {
          this.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
    },
    getDetail(data) {
      this.showDetail = true;
      this.commodityDetail = data;
    },
    handleDelete(o, index) {
      console.log(o.id);
      this.http({
        headers: {
          token: sessionStorage["token"],
          role: "admin",
        },
        method: "delete",
        url: `/api/commodity/item/${this.commodityDetail.id}`,
      }).then((res) => {
        if (res.data.code === 200) {
          this.getList();
          this.$message({
            type: "success",
            message: "删除成功：",
          });
        } else {
          this.$message({
            type: "error",
            message: "系统异常：",
          });
        }
      });
      console.log(index, o);
    },
    handleSubmit(data) {
      this.$message({
        type: "success",
        message: data,
      });
      this.edit = false;
      this.http({
        headers: {
          token: sessionStorage.getItem("token"),
          role: sessionStorage.getItem("user_role"),
        },
        method: "put",
        url: `/api/commodity/item`,
        data: {
          id: data.id,
          name: data.name,
          imgLink: data.imgLink,
          price: data.price,
          description: data.description,
          inventory: data.inventory,
        },
      })
        .then((response) => {
          if (response.data.code === 200) {
            this.$message({
              type: "success",
              message: "修改成功!",
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
    doSearch(search) {
      this.http({
        headers: {
          token: sessionStorage["token"],
        },
        method: "get",
        url: `/api/commodity/search`,
        params: {
          q: search,
          pagesize: this.pageSize,
          page: this.currentPage,
          seq: this.seq,
        },
      })
        .then((res) => {
          if (res.data.code === 200) {
            this.commodityList = res.data.data.rows;
          }
        })
        .catch(function(error) {
          this.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
    },
    handleAdd() {
      this.showAddCommodity = false;
      this.http({
        headers: {
          "Content-Type": "application/json;",
          token: sessionStorage["token"],
          role: sessionStorage["user_role"],
        },
        method: "post",
        url: `/api/commodity/item`,
        transformRequest: [
          function(data) {
            return JSON.stringify(data);
          },
        ],
        data: {
          name: this.commodity.name,
          imgLink: this.uploadPic,
          price: this.commodity.price,
          description: this.commodity.description,
          inventory: this.commodity.inventory,
          vendorName: this.commodity.vendorName,
        },
      })
        .then((response) => {
          if (response.data.data.code === 200) {
            this.$message({
              type: "success",
              message: "添加成功：",
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
    handleUpload(option) {
      // 生成的文件名称
      let objName = getFileNameUUID();

      // 调用 ali-oss 中的方法
      put(`${objName}`, option.file).then((res) => {
        this.uploadPic = res.url;
        console.log(+res.url);
      });
    },
    beforeAvatarUpload(file) {
      const isJPEG = file.name.split(".")[1] === "jpeg";
      const isJPG = file.name.split(".")[1] === "jpg";
      const isPNG = file.name.split(".")[1] === "png";
      const isLt500K = file.size / 1024 / 500 < 2;
      if (!isJPG && !isJPEG && !isPNG) {
        this.$message.error("上传图片只能是 JPEG/JPG/PNG 格式!");
      }
      if (!isLt500K) {
        this.$message.error("单张图片大小不能超过 500KB!");
      }

      return (isJPEG || isJPG || isPNG) && isLt500K;
    },
  },
};
</script>

<style scoped>
.buttonadd {
  color: #fff;
  background-color: #409eff;
  border-color: #409eff;
  float: right;
}
</style>
