<template>
  <div class="saler">
    <el-header class="store-menu">
      <el-menu
        mode="horizontal"
        @select="handleSelect('seler')"
        background-color="#545c64"
        text-color="#fff"
        active-text-color="#ffd04b"
      >
        <el-menu-item index="saler"
          ><router-link class="a" to="/saler">
            商品信息
          </router-link></el-menu-item
        >
        <el-menu-item index="salerOrder">
          <router-link class="a" to="/salerOrder">
            订单信息
          </router-link>
        </el-menu-item>
        <el-menu-item index="wallet"
          ><router-link class="a" to="/wallet">
            钱包
          </router-link></el-menu-item
        >
        <el-menu-item index="message">
          <router-link class="a" to="message">
            消息
          </router-link>
        </el-menu-item>
        <el-menu-item index="to-login" style="float: right">
          <el-col :span="12">
            <div class="user-image">
              <router-link class="a" to="/login">
                退出
              </router-link>
              <el-avatar :size="50">
                <img
                  src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"
                />
              </el-avatar>
            </div>
          </el-col>
        </el-menu-item>
      </el-menu>
    </el-header>
    <el-header style="width: 30%; height: 30%; margin: auto">
      <img class="logo" src="@/assets/store_logo.png" />
    </el-header>
    <el-main>
      <el-input
        class="input"
        placeholder="请输入商品"
        v-model="search"
        clearable
      >
      </el-input>
      <el-button
        @click="doSearch()"
        :disabled="search === '' || search === null"
        type="primary"
        icon="el-icon-search"
        align="right"
        >搜索商品</el-button
      ><el-button
        @click="getList()"
        type="primary"
        align="right"
        style="margin-left: 10px"
        >重置/刷新</el-button
      >
      <el-button
        type="primary"
        class="buttonadd"
        @click="addCommodity()"
        round
        style="width:100px;"
        >添加商品</el-button
      >
      <div class="goods">
        <el-row>
          <el-col :span="4" v-for="(o, index) in commodityList" :key="index">
            <el-card class="card" shadow="hover">
              <img
                :src="o.imgLink"
                style="width: 250px;height: 250px"
                class="item-image"
              />
              <el-descriptions title="商品信息" :column="1">
                <el-descriptions-item label="名字">{{
                  o.name
                }}</el-descriptions-item>
                <el-descriptions-item label="描述">
                  <el-tag size="small">{{ o.description }}</el-tag>
                </el-descriptions-item>
                <el-descriptions-item label="价格">{{
                  o.price
                }}</el-descriptions-item>
              </el-descriptions>
              <div style="padding: 5px">
                <div class="bottom clearfix">
                  <el-button size="mini" @click="getDetail(o, index)"
                    >详情
                  </el-button>
                  <el-button
                    size="mini"
                    type="danger"
                    @click="handleDelete(o, index)"
                    >删除
                  </el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
        <el-pagination
          background
          layout="total, prev, pager, next, sizes,jumper"
          :page-sizes="[5, 10, 15]"
          :page-size="this.formInline.pageSize"
          :total="this.dataTotalCount"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        >
        </el-pagination>
      </div>
    </el-main>
    <el-footer>
      <div class="customer-service"></div>
    </el-footer>
    <el-dialog title="商品详情" :visible.sync="showDialog" width="45%">
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
            alt=""
            style="width: 150px;height: 150px"
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
        ` <el-button @click="handleEdit(index)">编辑</el-button>
        <el-button type="primary" @click="handleSubmit()">提交</el-button>
      </span>
    </el-dialog>
    <el-dialog title="添加商品" :visible.sync="showDialog2" width="45%">
      <el-form ref="commodityList" :model="commodity" label-width="100px">
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
          <el-input v-model="userName"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="handleAdd()">提交</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { put, getFileNameUUID } from "../../../services/alioss";

export default {
  name: "saler",

  data() {
    return {
      userName: window.sessionStorage["user_name"],
      showDialog2: false,
      showDialog: false,
      edit: false,
      index: 0,
      salerPage: "saler",
      input: "",
      commodityList: [],
      commodity: {
        id: "",
        name: "",
        imgLink: "",
        price: "",
        description: "",
        inventory: "",
        vendorName: "",
      },
      commodityDetail: {
        id: "",
        name: "",
        imgLink: "",
        price: "",
        description: "",
        inventory: "",
        vendorName: "",
      },
      dataTotalCount: 0, //查询条件的总数据量
      formInline: {
        currentPage: 1,
        pageSize: 10,
      },
      seq: 0,
      search: "",
      uploadPic: "",
    };
  },
  mounted() {
    this.getList();
  },

  methods: {
    handleSizeChange: function(size) {
      this.formInline.pageSize = size;
      if(this.q != null){
        this.doSearch()
      }else{
        this.getList()
      }

    },

    // 控制页面的切换
    handleCurrentChange: function(currentpage) {
      this.formInline.currentPage = currentpage;
      if(this.q != null){
        this.doSearch()
      }else{
        this.getList()
      }
    },
    handleSelect(key) {
      this.salerPage = key;
    },

    UserImageHandler() {
      return true;
    },

    getList() {
      this.http({
        headers: {
          token: sessionStorage["token"],
          role: sessionStorage["user_role"],
        },
        method: "get",
        url: `/api/commodity/lists`,
        params: {
          username: sessionStorage["user_name"],
          pagesize: this.formInline.pageSize,
          page: this.formInline.currentPage,
          seq: this.seq,
        },
      })
        .then((response) => {
          if (response.data.code === 200) {
            this.commodityList = response.data.data.rows;
            this.dataTotalCount = response.data.data.records;
          }
        })
        .catch(function(error) {
          this.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
      this.search = "";
    },

    getDetail(o, index) {
      this.showDialog = true;
      this.index = index;
      this.commodityDetail = o;
    },

    handleDelete(o, index) {
      console.log(o.id);
      this.http({
        headers: {
          token: sessionStorage["token"],
          role: sessionStorage["user_role"],
        },
        method: "delete",
        url: `/api/commodity/item/${o.id}`,
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

    handleEdit() {
      this.edit = true;
    },

    handleSubmit() {
      this.showDialog = false;
      this.edit = false;
      this.http({
        headers: {
          "Content-Type": "application/json;",
          token: sessionStorage["token"],
          role: sessionStorage["user_role"],
        },
        method: "put",
        url: `/api/commodity/item`,
        transformRequest: [
          function(data) {
            return JSON.stringify(data);
          },
        ],
        data: {
          id: this.commodityList[this.index].id,
          name: this.commodityList[this.index].name,
          imgLink: this.commodityList[this.index].imgLink,
          price: this.commodityList[this.index].price,
          description: this.commodityList[this.index].description,
          inventory: this.commodityList[this.index].inventory,
          vendorName: this.commodityList[this.index].vendorName,
        },
      })
        .then((response) => {
          if (response.data.data.code === 200) {
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

    doSearch() {
      this.http({
        headers: {
          token: sessionStorage["token"],
          role: sessionStorage["user_role"],
        },
        method: "get",
        url: `/api/commodity/search`,
        params: {
          q: this.search,
          pagesize: this.formInline.pageSize,
          page: this.formInline.currentPage,
          seq: this.seq,
        },
      })
        .then((res) => {
          if (res.data.code === 200) {
            this.commodityList = res.data.data.rows;
            this.dataTotalCount = res.data.data.records;
          }
        })
        .catch(function(error) {
          this.$message({
            type: "error",
            message: "系统异常：" + error,
          });
        });
    },
    addCommodity() {
      this.showDialog2 = true;
      console.log("1234567896543111313")
    },
    handleAdd() {
      this.showDialog2 = false;
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
          vendorName: sessionStorage["user_name"],
          vendorId:sessionStorage["user_id"]
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

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.user-image {
  margin-right: 20px;
}

.input {
  width: 60%;
  display: inline-block;
}

.logo {
  width: 100%;
  height: 100%;
}

.goods {
  width: 100%;
  height: 100%;
  margin-top: 50px;
  display: grid;
  /*  声明列的宽度  */
  grid-template-columns: repeat(5, 20%);
  /*  声明行的高度  */
  grid-template-rows: 550px;
}

.item-image {
  width: 100%;
  display: block;
}
.a {
  text-decoration: none;
}
</style>
