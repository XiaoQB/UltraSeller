<template>
  <div class="login" clearfix>
    <div class="login-wrap">
      <el-row type="flex" justify="center">
        <el-form
          ref="loginForm"
          :model="user"
          status-icon
          label-width="80px"
          style="height: 800px"
        >
          <h3>请管理员登录</h3>
          <hr />
          <el-form-item prop="username" label="用户名">
            <el-input
              v-model="user.username"
              placeholder="请输入用户名"
              prefix-icon
            ></el-input>
          </el-form-item>
          <el-form-item id="password" prop="password" label="密码">
            <el-input
              v-model="user.password"
              show-password
              placeholder="请输入密码"
            ></el-input>
          </el-form-item>
          <el-form-item>
            <el-button
              class="button1"
              type="primary"
              @click="doLogin()"
              style="border-bottom: 200px; margin-top: 20px"
              >登 录</el-button
            >
          </el-form-item>
        </el-form>
      </el-row>
      <el-dialog title="注册信息" :visible.sync="registervisible" width="30%">
        <el-form
          ref="register"
          :model="register"
          :rules="rules"
          label-width="80px"
        >
          <el-form-item label="身份" prop="identity">
            <el-radio v-model="register.identity" label="1">买家</el-radio>
            <el-radio v-model="register.identity" label="2">卖家</el-radio>
          </el-form-item>
          <el-form-item label="账户名" prop="name">
            <el-input v-model="register.name"></el-input>
          </el-form-item>
          <el-form-item label="手机号码" prop="number">
            <el-input v-model="register.number"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="pwd">
            <el-input v-model="register.pwd" show-password></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="checkPwd">
            <el-input v-model="register.checkPwd" show-password></el-input>
          </el-form-item>
          <el-form-item label="性别" prop="sex">
            <el-radio v-model="register.sex" label="1">女</el-radio>
            <el-radio v-model="register.sex" label="2">男</el-radio>
          </el-form-item>
          <el-form-item label="邮箱号" prop="email">
            <el-input v-model="register.email"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          ` <el-button @click="resetForm('register')">取 消</el-button>
          <el-button type="primary" @click="doRegister()">确 定</el-button>
        </span>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import http from "@/http";

export default {
  name: "adminLogin",
  data() {
    var validatePass = (rule, value, callback) => {
      setTimeout(() => {
        if (value === "") {
          callback(new Error("请输入密码"));
        } else {
          if (this.register.checkPwd !== "") {
            this.$refs.register.validateField("checkPwd");
          }
          callback();
        }
      }, 1000);
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入确认密码"));
      } else if (value !== this.register.pwd) {
        callback(new Error("两次密码不一致!"));
      } else {
        callback();
      }
    };
    return {
      registervisible: false,
      user: {
        username: "",
        password: "",
        role: "",
      },
      register: {
        identity: "",
        name: "",
        number: "",
        pwd: "",
        checkPwd: "",
        sex: "",
        email: "",
      },

      rules: {
        identity: [
          { required: true, message: "请确认注册身份", trigger: "blur" },
        ],
        name: [
          { required: true, message: "请输入账号", trigger: "blur" },
          {
            min: 1,
            max: 20,
            message: "账号名不能超过20个字符",
            trigger: "blur",
          },
        ],
        number: [
          { required: true, message: "请输入手机号", trigger: "blur" },
          { incr: 11, message: "输入正确的手机号", trigger: "blur" },
        ],
        pwd: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { validator: validatePass, trigger: "blur" },
        ],
        checkPwd: [{ validator: validatePass2, trigger: "blur" }],
      },
    };
  },
  created() {},
  methods: {
    doLogin() {
      if (!this.user.username) {
        this.$message.error("请输入用户名！");
        return;
      } else if (!this.user.password) {
        this.$message.error("请输入密码！");
        return;
      } else {
        this.$router.push({ name: "admin" });
        http
          .get(`/api/user/login`, {
            params: {
              userName: this.user.username,
              password: this.user.password,
              role: "admin",
            },
          })
          .then((res) => {
            if (res.data.code === 200) {
              window.sessionStorage["token"] = res.data.data.token;
              window.sessionStorage["user_id"] = res.data.data.userId;
              window.sessionStorage["user_name"] = "admin";
              window.sessionStorage["user_role"] = "admin";
              this.$router.push({
                name: "admin",
              });
            }
          });
      }
    },

    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.resetForm("register");
        } else {
          this.$message({
            type: "warning",
            message: "请检查信息后重新提交",
          });
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
      this.registervisible = false;
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.login {
  width: 100%;
  height: 100%;
  background: url("../assets/bg.jpeg") no-repeat;
  background-size: cover;
  overflow: hidden;
  opacity: 30;
}

.login-wrap {
  background: rgb(255, 255, 255);
  background-size: cover;
  width: 400px;
  height: 350px;
  margin: 215px auto;
  overflow: hidden;
  padding-top: 10px;
  line-height: 40px;
  opacity: 30;
}

#password {
  margin-bottom: 5px;
}

h3 {
  color: #0babeab8;
  font-size: 24px;
}

hr {
  background-color: #444;
  margin: 20px auto;
}

a {
  text-decoration: none;
  color: #aaa;
  font-size: 15px;
}

a:hover {
  color: coral;
}

.button1 {
  width: 50%;
  margin-left: -100px;
  margin-bottom: auto;
}

.button2 {
  width: 50%;
  margin-left: 100px;
}
</style>
