<template>
  <div id="messageCenter">
    <div class="head">
      <span style="float: left; font-size: 25px; margin: 20px">
        排序:
        <el-radio-group v-model="reverse" style="margin-left: 10px">
          <el-radio :label="false" border size="medium">最新更新</el-radio>
          <el-radio :label="true" border size="medium">最早更新</el-radio>
        </el-radio-group>
      </span>
      <span style="float: right; font-size: 25px; margin: 20px">
        今天日期: {{ curretDate }}
      </span>
    </div>
    <el-timeline :reverse="reverse">
      <el-timeline-item
        timestamp="2018/4/12"
        placement="top"
        size="large"
        style="float: left"
        v-for="(item, index) in mock"
        :key="index"
      >
        <el-badge value="new" style="width: 600px; font-size: 20px">
          <el-card @click="readMessage">
            <div slot="header" style="margin-bottom: 20px">
              <span style="float: left">更新 Github 模板</span>
              <span style="float: right">时间: 2018/4/12</span>
            </div>
            <div>王小虎 提交于 2018/4/12 20:46</div>
            <div>王小虎 提交于 2018/4/12 20:46</div>
          </el-card>
        </el-badge>
      </el-timeline-item>
    </el-timeline>
  </div>
</template>

<script>
export default {
  name: "messageCenter",
  data() {
    return {
      curretDate: "",
      lastMonth: "",
      reverse: true, // 时间排序，true是最新
      AlreadyRead: false, // 已读或未读
      countNotRead: 0, //未读的数量
      mock: [],
    };
  },
  mounted() {
    this.getCurretDate();
  },
  methods: {
    getCurretDate() {
      var nowDate = new Date();
      let date = {
        year: nowDate.getFullYear(),
        month: nowDate.getMonth() + 1,
        day: nowDate.getDate(),
      };
      this.curretDate = date.year + "/" + date.month + "/" + date.day;
    },
  },
};
</script>

<style scoped>
.messageCenter {
  width: 100%;
}
.head {
  width: 100%;
  height: 80px;
}
</style>
