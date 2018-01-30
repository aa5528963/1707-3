<template>
    <div>
        <datagrid api="http://10.3.136.74:88/orderPage" :title="title" :head='head' :filter="filter" :limit="5" :data="9" :status2="status2" api5="http://10.3.136.74:88/delOrder" :status3="status3" api6="http://10.3.136.74:88/serachOrder"></datagrid>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">订单信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">商品编号</label>
                            <input type="email" class="form-control" id="exampleInputEmail1">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">商品名称</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">商品原价</label>
                            <input type="email" class="form-control" id="exampleInputEmail1">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">商品折后价</label>
                            <input type="email" class="form-control" id="exampleInputEmail1">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">商品总价</label>
                            <input type="email" class="form-control" id="exampleInputEmail1">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">商品支付状态</label>
                            <input type="email" class="form-control" id="exampleInputEmail1">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">提交更改</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import datagrid from '../../components/datagrid/datagrid.vue';
    export default{
        data(){
            return {
                title:'订单信息管理',
                head:['订单编号','商品','商品总价','支付状态','订单时间'],
                status3:1,
            }
        },
        components:{
            datagrid
        }
    }

</script>
<style>
    .modal-body{
        padding:10px 70px;
    }

</style>