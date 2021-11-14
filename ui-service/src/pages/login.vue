<template>
  <div class="login" clearfix>
    <el-main style="margin-top: 50px">
      <img
        class="logo"
        src="@/assets/store_logo.png"
        style="width: 30%; height: 30%; margin: auto"
      />
      <div class="login-wrap">
        <el-row type="flex" justify="center">
          <el-form
            ref="loginForm"
            :model="user"
            status-icon
            label-width="80px"
            style="height: 800px"
          >
            <h3>请您登录</h3>
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
            <el-form-item label="角色" prop="role">
              <el-radio v-model="user.role" label="buyer">买家</el-radio>
              <el-radio v-model="user.role" label="saler">卖家</el-radio>
            </el-form-item>
            <el-form-item>
              <el-button
                class="button1"
                type="primary"
                @click="doLogin()"
                style="border-bottom: 200px"
                >登 录</el-button
              >
              <el-button
                class="button2"
                type="primary"
                @click="registervisible = true"
                >注 册</el-button
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
              <el-radio v-model="register.identity" label="buyer"
                >买家</el-radio
              >
              <el-radio v-model="register.identity" label="saler"
                >卖家</el-radio
              >
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
    </el-main>
  </div>
</template>

<script>
export default {
  name: "login",
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
      } else if (
        this.user.role === null ||
        this.user.role === "" ||
        this.user.role === undefined
      ) {
        this.$message.error("请选择角色！");
      } else if (this.user.role === "saler") {
        this.http
          .get(`/user/login`, {
            headers: {
              "Access-Control-Allow-Origin": "*",
            },
            params: {
              userName: this.user.username,
              password: this.user.password,
              role: this.user.role,
            },
          })
          .then((res) => {
            if (res.data.code === 200 && this.user.role === "saler") {
              window.localStorage["token"] = res.data.data.token;
              window.localStorage["user_id"] = this.user.username;
              window.localStorage["id"] = res.data.data.userId;
              window.localStorage["role"] = this.user.role;
              this.$router.push({ name: "app", path: "/storePage" });
            } else {
              alert("您输入的用户名或密码错误！");
            }
          });
      } else if (this.user.role === "buyer") {
        this.http
          .get(`/user/login`, {
            params: {
              userName: this.user.username,
              password: this.user.password,
              role: this.user.role,
            },
          })
          .then((res) => {
            if (res.data.status === 200) {
              window.localStorage["token"] = JSON.stringify(res.data["token"]);
              window.localStorage["user_id"] = this.user.username;
              this.$router.push({
                name: "app",
                query: {
                  userName: this.user.username,
                  token: res.data["token"],
                  role: this.user.role,
                },
              });
            } else {
              this.$message.error("您输入的用户名或密码错误！");
              alert("您输入的用户名或密码错误！");
            }
          });
        // window.localStorage["token"] =
        //   "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJhMTY2ZWQyYy1lMWYwLTQ4MTgtOTcyYi1iNzA4ZDVlMzQxZGUiLCJzdWIiOiJ7XCJyb2xlXCI6XCJidXllclwiLFwic3VjY2Vzc1wiOlwiU1VDQ0VTU1wiLFwidXNlcm5hbWVcIjpcInRlc3QwMVwifSIsImlzcyI6ImFkbWluIiwiaWF0IjoxNjM0OTk1NjQzLCJleHAiOjE2MzQ5OTkyNDN9.uubRdqHfSK3EA23d2STScP-_gZgCZ48oxJwOeXoxSVM";
        // window.localStorage["user_id"] = "temple";
        // this.$router.push({
        //   name: "app",
        //   path: "/storePage",
        // });
      }
    },
    doRegister() {
      this.submitForm("register");
      this.http({
        headers: {
          "Content-Type": "application/json;",
        },
        method: "post",

        url: `/user/register`,
        transformRequest: [
          function(data) {
            return JSON.stringify(data);
          },
        ],

        data: {
          role: this.register.identity,
          userName: this.register.name,
          password: this.register.pwd,
          phone: this.register.number,
        },
      }).then((res) => {
        if (res.data.code === 200) {
          console.log("注册成功");
          this.$message({
            type: "success",
            message: "恭喜你，注册成功，已经成为我们XX商城的一员啦！！！",
          });
        } else if (res.data.code === 402) {
          this.$message({
            type: "info",
            message: "注册失败，该账号已经被注册",
          });
        } else {
          this.$message({
            type: "info",
            message: "不好意思，网络好像出现问题了呢，请您重新注册",
          });
        }
      });
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
.logo {
  width: 30%; 
  height: 30%; 
  margin: auto;
}
.login {
  width: 100%;
  height: 100%;
  background: url("../assets/left-pic.jpeg") no-repeat;
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
  margin-top: 20px;
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
