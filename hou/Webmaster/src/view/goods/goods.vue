<template>
    <div>
        <datagrid api="http://localhost:88/shu" :title="title" :head="head" :limit="6" api1='http://localhost:88/check1' api2='http://localhost:88/check' :data="11" api3="http://localhost:88/del" api5="http://localhost:88/del" api7="http://localhost:88/check2" :status1="1"></datagrid>
        
        
    </div>
</template>
<script>
    import datagrid from "../../components/datagrid/datagrid.vue";
    import http from '../../http/baseurl';
    export default{
        data(){
            return {
                title:'商品信息管理',
                dataset: [{"id":"01","name":'ll',"password":'123'},{"id":"01","name":'ll',"password":'123'}],
                head:['商品id','商品名称','原价','现价','种类','库存']

            }
        },
        components:{
            datagrid
        }
    }
</script>
<style lang="scss" scoped>
    .modal-title{text-align:center;font-weight:bold;}
</style>