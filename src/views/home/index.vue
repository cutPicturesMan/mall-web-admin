<template>
    <section class="data_section" ref="data_section">
        <a :href="github" target="_blank">
            <el-row :gutter="20">
                <el-col :span="6">
                    <div class="total-frame">
                        <svg-icon icon-class="order" class="total-icon">
                        </svg-icon>
                        <div class="total-title">今日下单</div>
                        <div class="total-value">123</div>
                    </div>
                </el-col>
                <el-col :span="6">
                    <div class="total-frame">
                        <svg-icon icon-class="total-today" class="total-icon">
                        </svg-icon>
                        <div class="total-title">今日销售总额</div>
                        <div class="total-value">￥456</div>
                    </div>
                </el-col>
                <el-col :span="6">
                    <div class="total-frame">
                        <svg-icon icon-class="total-yesterday" class="total-icon">
                        </svg-icon>
                        <div class="total-title">昨日销售总额</div>
                        <div class="total-value">￥111</div>
                    </div>
                </el-col>
                <el-col :span="6">
                    <div class="total-frame">
                        <svg-icon icon-class="total-week" class="total-icon">
                        </svg-icon>
                        <div class="total-title">近7天销售总额</div>
                        <div class="total-value">￥222</div>
                    </div>
                </el-col>
            </el-row>
        </a>
        <el-row :gutter="10" class="row_list order_list">
            <el-col :span="7">
                <log-list></log-list>
            </el-col>
            <el-col :span="17">
                <bar-chart type="barChart"></bar-chart>
            </el-col>
        </el-row>
        <el-row :gutter="10" class="row_list order_list">
            <el-col :span="7">
                <pie-chart type="ordertype"></pie-chart>
            </el-col>
            <el-col :span="10">
                <line-chart></line-chart>
            </el-col>
            <el-col :span="7">
                <radar-chart></radar-chart>
            </el-col>
        </el-row>
        <el-row :gutter="10" class="row_list">
            <el-col :span="11">
                <sales-table></sales-table>
            </el-col>
            <el-col :span="7">
                <comment-list></comment-list>
            </el-col>
            <el-col :span="6">
                <card-list></card-list>
            </el-col>
        </el-row>

    </section>
</template>

<script>
    import echarts from 'echarts'
    import salesTable from "./components/salesTable";  // 销售数据表格
    import commentList from "./components/commentList";  // 用户评论列表
    import cardList from "./components/cardList";  // card列表
    import logList from "./components/logList";  // 日志列表
    import barChart from '@/components/echarts/barChart' // 用户投资类型 柱状图
    import pieChart from '@/components/echarts/pieChart' // 用户投资类型 饼状图
    import radarChart from '@/components/echarts/radarChart' // 用户投资类型 雷达图
    import lineChart from '@/components/echarts/lineChart' // 用户投资类型 折线图
    import { github } from "@/utils/env";

    export default {
        data(){
            return {
                github:github
            }
        },
        components: {
            salesTable,
            commentList,
            cardList,
            logList,
            barChart,
            pieChart,
            radarChart,
            lineChart
        },
        created(){
        },
        mounted(){
        },
        methods: {
        }
    }
</script>

<style lang="less" scoped>
    .total-frame {
        border: 1px solid #DCDFE6;
        padding: 20px;
        height: 100px;
    }

    .total-icon {
        913656
        color: #409EFF;
        width: 60px;
        height: 60px;
    }

    .total-title {
        position: relative;
        font-size: 16px;
        color: #909399;
        left: 70px;
        top: -35px;
    }

    .total-value {
        position: relative;
        font-size: 18px;
        color: #606266;
        left: 70px;
        top: -25px;
    }
    .data_section{
        margin: 20px;
        border-radius: 2px;
        .row_list{
            margin-bottom: 20px;
            .row_base{
                padding: 10px;
                box-sizing: border-box;
                background: #fff;
                border-radius: 6px;
                height: 120px;
            }
        }
        .order_list{
            .orderArea{
                width: 100%;
                height: 300px;
                background: #fff !important;
                border-radius: 6px;
                box-sizing: border-box;
                padding: 10px;
                padding-top: 40px;
                overflow: hidden;
            }
            .orderbarArea{
                height: 370px;
            }
        }
        .data_list{
            text-align: center;
            font-size: 14px;
            border-radius: 6px;
            padding: 10px;
            color:#fff;
            height: 80px;
            .leftItem{
                align-items: start;
                justify-content: space-between;
                text-align: left;
            }
            .rightItem{
                width:62px;

                align-items: center;
                justify-content: center;
                .svg-icon{
                    font-size: 30px;
                }
            }
            .number{
                font-size: 22px;
                font-weight: bold;
                .perTitle{
                    font-size: 13px;
                    margin-left: 5px;
                }
            }
        }
        .pay{
            .leftItem{
                justify-content: space-around;
            }
        }

    }

</style>
