<template> 
  <el-card class="form-container" shadow="never">
    <el-form :model="group" :rules="rules" ref="groupFrom" label-width="150px">

      <el-form-item label="活动名称：" prop="name">
        <el-input v-model="group.name"></el-input>
      </el-form-item>
      <el-form-item label="商品：" prop="goodId">
        <el-select
          v-model="group.goodId"
          @change="handleBrandChange"
          placeholder="请选择商品">
          <el-option
            v-for="item in goodsOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="开始时间：" prop="startTime">
        <el-date-picker
          class="input-width"
          v-model="group.startTime"
          value-format="yyyy-MM-dd HH:mm:ss" format="yyyy-MM-dd HH:mm:ss"
          type="datetime"
          :picker-options="pickerOptions1"
          placeholder="请选择开始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="结束时间：" prop="endTime">
        <el-date-picker
          class="input-width"
          v-model="group.endTime"
          value-format="yyyy-MM-dd HH:mm:ss" format="yyyy-MM-dd HH:mm:ss"
          type="datetime"
          :picker-options="pickerOptions1"
          placeholder="请选择结束时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="每个团所需人数：" prop="num">
        <el-input v-model="group.num"></el-input>
      </el-form-item>
      <el-form-item label="可抽中奖次数：" prop="spellingNumber">
        <el-input v-model="group.spellingNumber"></el-input>
      </el-form-item>
      <el-form-item label="最少开奖团数：" prop="collageNumber">
        <el-input v-model="group.collageNumber"></el-input>
      </el-form-item>
      <el-form-item label="抽奖金额：" prop="price">
        <el-input v-model="group.price"></el-input>
      </el-form-item>

      <el-form-item label="可抽奖次数：" prop="cishu">
        <el-input v-model="group.cishu"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="onSubmit('groupFrom')">提交</el-button>
        <el-button v-if="!isEdit" @click="resetForm('groupFrom')">重置</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>
<script>
  import {createDraw, getDraw, updateDraw} from '@/api/sms/draw'
  import SingleUpload from '@/components/Upload/singleUpload'
  import {
    fetchList
  } from '@/api/product'
  const defaultDraw={
    name: ''
  };
  export default {
    name: 'DrawDetail',
    components:{SingleUpload},
    props: {
      isEdit: {
        type: Boolean,
        default: false
      }
    },
    data() {
      return {
        //日期选择器配置
        pickerOptions1: {
          disabledDate(time) {
            return time.getTime() < Date.now();
          }
        },
        group:Object.assign({}, defaultDraw),
        goodsOptions:null,
        goodsName:'',
        originPrice:'',
        rules: {
          name: [
            {required: true, message: '请输入品牌名称', trigger: 'blur'},
            {min: 2, max: 140, message: '长度在 2 到 140 个字符', trigger: 'blur'}
          ],
          logo: [
            {required: true, message: '请输入品牌logo', trigger: 'blur'}
          ],
          sort: [
            {type: 'number', message: '排序必须为数字'}
          ],
        }
      }
    },
    created() {
      this.getGoodsList();
      if (this.isEdit) {
        getDraw(this.$route.query.id).then(response => {
          this.group = response.data;
        });
      }else{
        this.group = Object.assign({},defaultDraw);
      }
    },
    methods: {
      getGoodsList() {
        fetchList({pageNum: 1, pageSize: 1000}).then(response => {
          this.goodsOptions = [];
        let brandList = response.data.records;
        for (let i = 0; i < brandList.length; i++) {
          this.goodsOptions.push({label: brandList[i].price+','+brandList[i].name, value: brandList[i].id});
        }
      });
      },
      handleBrandChange(val) {
        let brandName = '';
        let originPrice = '';
        for (let i = 0; i < this.goodsOptions.length; i++) {
          if (this.goodsOptions[i].value === val) {
            originPrice = this.goodsOptions[i].label.split(",")[0];
            brandName = this.goodsOptions[i].label.split(",")[1];
            break;
          }
        }
        this.originPrice =originPrice;
        this.goodsName = brandName;
      },
      onSubmit(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$confirm('是否提交数据', '提示', {
              confirmButtonText: '确定',
              cancelButtonText: '取消',
              type: 'warning'
            }).then(() => {
              this.group.goodsName=this.goodsName
            this.group.originPrice=this.originPrice
              if (this.isEdit) {
                updateDraw(this.$route.query.id, this.group).then(response => {
                  if(response.code==200){
                  this.$refs[formName].resetFields();
                  this.$message({
                    message: '修改成功',
                    type: 'success',
                    duration:1000
                  });
                  this.$router.back();
                  }else{
                  this.$message({
                    message: response.msg,
                    type: 'error',
                    duration:1000
                  });
                }


                });
              } else {
                createDraw(this.group).then(response => {

                  if(response.code==200){
                  this.$refs[formName].resetFields();
                  this.group = Object.assign({},defaultDraw);
                  this.$message({
                    message: '提交成功',
                    type: 'success',
                    duration:1000
                  });
                  this.$router.back();
                }else{
                  this.$message({
                    message: response.msg,
                    type: 'error',
                    duration:1000
                  });
                }


                });
              }
            });

          } else {
            this.$message({
              message: '验证失败',
              type: 'error',
              duration:1000
            });
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
        this.group = Object.assign({},defaultDraw);
      }
    }
  }
</script>
<style>
</style>


