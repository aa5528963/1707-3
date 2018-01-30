<template>
    <div>
        <datagrid api="http://10.3.136.74:88/fenye" :title="title" :head='head' :status2="status2" :limit="6" :data="9" api3='http://10.3.136.74:88/checkUser1' api5='http://10.3.136.74:88/delUser'></datagrid>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">会员信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">用户名</label>
                            <input type="email" class="form-control" id="exampleInputEmail1">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">密码</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
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
                title:'会员信息',
                head:['会员编号','用户名','密码','注册时间'],
                status2:1,
                
            }
        },
        components:{
            datagrid
        }

    }
</script>
<style>

</style>