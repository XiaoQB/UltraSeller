<template>
  <div>
    <el-input
        class="input"
        placeholder="请输入商品"
        v-model="search"
        clearable
    >
    </el-input>
    <el-button
        @click="doSearch()"
        type="primary"
        icon="el-icon-search"
        align="right"
    >搜索商品</el-button
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
        <el-col
            :span="4"
            v-for="(o, index) in commodityList"
            :key="o"
        >
          <el-card class="card"  shadow="hover">
            <img
                :src="o.imgLink"
                style="width: 250px;height: 250px"
                class="item-image"
            />
            <el-descriptions title="商品信息" :column="1">
              <el-descriptions-item label="名字">{{o.name }}</el-descriptions-item>
              <el-descriptions-item label="描述">
                <el-tag size="small">{{ o.description }}</el-tag>
              </el-descriptions-item>
              <el-descriptions-item label="价格">{{o.price }}</el-descriptions-item>
            </el-descriptions>
            <div style="padding: 5px">
              <div class="bottom clearfix">
                <!-- <time class="time">{{ currentDate }}</time> -->
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
    <el-dialog title="商品详情" :visible.sync="showDialog" width="45%">
      <el-form
          ref="commodityList"
          :model="commodityList[index]"
          label-width="100px"
      >
        <el-form-item label="编号" prop="id">
          <span v-if="!edit">{{ commodityList[index].id }}</span>
          <el-input v-else v-model="commodityList[index].id"></el-input>
        </el-form-item>
        <el-form-item label="商品名称" prop="name">
          <span v-if="!edit">{{ commodityList[index].name }}</span>
          <el-input v-else v-model="commodityList[index].name"></el-input>
        </el-form-item>
        <el-form-item label="图片" prop="imgLink">
          <img
              :src="commodityList[index].imgLink"
              alt=""
              style="width: 150px;height: 150px"
          />
        </el-form-item>
        <el-form-item label="价格" prop="price">
          <span v-if="!edit">{{ commodityList[index].price }}</span>
          <el-input v-else v-model="commodityList[index].price"></el-input>
        </el-form-item>
        <el-form-item label="商品描述" prop="description">
          <span v-if="!edit">{{ commodityList[index].description }}</span>
          <el-input
              v-else
              v-model="commodityList[index].description"
          ></el-input>
        </el-form-item>
        <el-form-item label="库存" prop="inventory">
          <span v-if="!edit">{{ commodityList[index].inventory }}</span>
          <el-input v-else v-model="commodityList[index].inventory"></el-input>
        </el-form-item>
        <el-form-item label="所有者名字" prop="vendorName">
          <span v-if="!edit">{{ commodityList[index].vendorName }}</span>
          <el-input v-else v-model="commodityList[index].vendorName"></el-input>
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
        <el-form-item
            label="图片"
            prop="imgLink"
        >
          <el-upload
              class="upload-demo"
              action="https://jsonplaceholder.typicode.com/posts/"
              :before-upload = 'beforeAvatarUpload'
              :http-request = 'handleUpload'>
            <el-button size="small" type="primary">点击上传</el-button>
            <div slot="tip" class="el-upload__tip">jpg/png 文件大小小于500kb</div>
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
import {getFileNameUUID, put} from "../services/alioss";

export default {
  name: "commodityManager",
  data() {
    return {
      userName:window.localStorage['user_name'],
      showDialog2: false,
      showDialog: false,
      edit: false,
      index: 0,
      salerPage: "saler",
      input: "",
      commodityList: [{
        imgLink: "http://ultra-seller.oss-cn-shanghai.aliyuncs.com/images/aaaaaa1637115988644_a5e08860",

      }
      ],
      commodity: {
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
      seq:0,
      search:"",
      uploadPic:"",
    };
  },
  methods: {
    handleSizeChange: function (size) {
      this.formInline.pageSize = size;
      this.getList();
    },

    // 控制页面的切换
    handleCurrentChange: function(currentpage) {
      this.formInline.currentPage = currentpage;
      this.getList();
    },
    handleSelect(key) {
      this.salerPage = key;
    },

    UserImageHandler() {
      return true;
    },

    getList() {
      console.log(localStorage['token'])
      this.http({
        headers: {
          'token': localStorage['token'],
          'role':localStorage['user_role'],
        },
        method: "get",
        url: `/api/commodity/lists`,
        params: {
          username:localStorage['user_name'] ,
          pagesize: this.formInline.pageSize,
          page: this.formInline.currentPage,
          seq: this.seq,
        }
      })
          .then(response=>{
            if(response.data.code===200){
              this.commodityList = response.data.data.rows;
              this.dataTotalCount = response.data.data.records;
            }

          })
          .catch(function (error) {
            this.$message({
              type: 'error',
              message: '系统异常：' + error
            });
          });
    },

    getDetail(o, index) {
      this.showDialog = true;
      this.index = index;
      console.log(o, index);
    },

    handleDelete(o, index) {
      console.log(o.id)
      this.http({
            headers: {
              'token': localStorage['token'],
              'role':localStorage['user_role']
            },
            method: "delete",
            url: `/api/commodity/item/${o.id}`,
          }
      ).then(res => {
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
          token: localStorage["token"],
          'role':localStorage['user_role']
        },
        method: "put",
        url: `/api/commodity/item`,
        transformRequest: [function (data) {
          return JSON.stringify(data)
        }],

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
              'token': localStorage['token'],
              'role':localStorage['user_role']
            },
            method: "get",
            url: `/api/commodity/search`,
            params: {
              q: this.search,
              pagesize: this.formInline.pageSize,
              page: this.formInline.currentPage,
              seq: this.seq
            }
          }
      ).then(res => {
        if (res.data.code === 200) {
          this.commodityList = res.data.data.rows;
          this.dataTotalCount = res.data.data.records;
        }
      }).catch(function(error) {
        this.$message({
          type: "error",
          message: "系统异常：" + error,
        });
      });
    },
    addCommodity() {
      this.showDialog2 = true;
    },
    handleAdd() {
      this.showDialog2 = false;
      this.http({
        headers: {
          "Content-Type": "application/json;",
          'token': localStorage["token"],
          'role':localStorage['user_role']
        },
        method: "post",
        url: `/api/commodity/item`,
        transformRequest: [function (data) {
          return JSON.stringify(data)
        }],

        data: {
          name: this.commodity.name,
          imgLink: this.uploadPic,
          price: this.commodity.price,
          description: this.commodity.description,
          inventory: this.commodity.inventory,
          vendorName: localStorage["user_name"],
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
      let objName = getFileNameUUID()

      // 调用 ali-oss 中的方法
      put(`${objName}`, option.file).then(res => {
        this.uploadPic=res.url
      })
    },


    beforeAvatarUpload (file) {
      const isJPEG = file.name.split('.')[1] === 'jpeg';
      const isJPG = file.name.split('.')[1] === 'jpg';
      const isPNG = file.name.split('.')[1] === 'png';
      const isLt500K = file.size / 1024 / 500 < 2;
      if (!isJPG && !isJPEG && !isPNG) {
        this.$message.error('上传图片只能是 JPEG/JPG/PNG 格式!');
      }
      if (!isLt500K) {
        this.$message.error('单张图片大小不能超过 500KB!');
      }

      return (isJPEG || isJPG || isPNG) && isLt500K;
    }

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
