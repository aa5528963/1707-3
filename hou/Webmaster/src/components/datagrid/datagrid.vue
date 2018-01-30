<template>
    <div>
        <el-container style="height: 570px; border: 1px solid #eee">
            <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
                <el-menu :default-openeds="['1', '4']">
                    <el-submenu index="1">
                        <template slot="title"><i class="el-icon-message"></i>前台操作</template>
                        <el-menu-item-group>
                            <el-menu-item index="1-1">POS收银</el-menu-item>
                            <el-menu-item index="1-2" class="user"><router-link to="/user">会员管理</router-link></el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                    <el-submenu index="2">
                        <template slot="title"><i class="el-icon-menu"></i>仓储管理</template>
                        <el-menu-item-group>
                        <el-menu-item index="2-1"><router-link to="/goods">商品管理</router-link></el-menu-item>
                        <el-menu-item index="2-2"><router-link to="/order">订单管理</router-link></el-menu-item>
                            <el-menu-item index="2-3" >进货管理</el-menu-item>
                            <el-menu-item index="2-3">资金账户</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                    <el-submenu index="3">
                        <template slot="title"><i class="el-icon-news"></i>员工管理</template>
                        <el-menu-item-group>
                            <el-menu-item index="3-1">工作人员管理</el-menu-item>
                            <el-menu-item index="3-2">优惠计次设置</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                    <el-submenu index="4">
                        <template slot="title"><i class="el-icon-setting"></i>系统设置</template>
                        <el-menu-item-group>
                            <el-menu-item index="3-1">设置系统颜色</el-menu-item>
                            <el-menu-item index="3-2">音量设置</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                </el-menu>
            </el-aside>
            <el-container>
                <el-main>
                    <div class="center_t">
                        <h1 class="title">{{title}}</h1>
                    </div>
                    <div class="check">
                        <button class="btn btn-primary btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="line-height: 1;padding: 6px 12px;font-size: 14px;display:inline-block" @click="add">上架新商品</button>
                        <select name="" id="sel" v-model="sel" class="form-control">
                            <option value="商品种类" v-show="status1">商品种类</option>
                            <option value="商品id" v-show="status1">商品id</option>
                            <option value="商品名称" v-show="status1">商品名称</option>
                            <option value="用户名" v-show="status2">用户名</option>
                            <option value="订单编号" v-show="status3">订单编号</option>
                            
                        </select>
                        
                        <input type="text" v-model="checker" class="form-control serachPut" style="height: 33px;"/>
                        <button @click="check" class="btn btn-info serachBtn">搜索</button>
                    </div>
                    <table class="table table-hover"> 
                        <thead>
                            <tr style="font-weight:bold;font-size:20px;text-align:center;">
                                <td  v-for="(value,key) in head">{{value}}</td>
                                <td>操作</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(obj,index) in dataset" :key="index" style="font-size:14px;text-align:center;">
                                <td v-for="(vlaue,index) in obj" :id='index'>{{vlaue}}</td>

                                <td>
                                    <button class="btn btn-primary btn-primary btn-lg" data-toggle="modal" data-target="#changeModal" style="line-height: 1;padding: 6px 12px;font-size: 14px;" v-show="status1">编辑</button>

                                    <button class="btn btn-danger"  style="line-height: 1;" @click="del" :title="obj.id" v-show="status1">下架商品</button>
                                    <button class="btn btn-danger"  style="line-height: 1;" @click="del" :title="obj.id" v-show="status2 || status3">删除</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <ul class="page1" style="padding-left:380px" @click="fen"> 
                        <li v-for="(value, index) in data" style="float:left;padding:5px 10px;border:1px solid #ccc;">{{index+1}}</li>
                    </ul>
                </el-main>
            </el-container>
        </el-container>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">添加商品信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">商品编号</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" v-model="goodnum">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">商品名称</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" v-model="name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">种类</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" v-model="cad">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">价格</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" v-model="price">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">库存</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" v-model="rpt">
                        </div>
                      
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" @click="appen">提交更改</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">添加商品信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">商品编号</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" v-model="goodnum">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">商品名称</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" v-model="name">
                        </div>
                         <div class="form-group">
                            <label for="exampleInputPassword1">种类</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" v-model="cad">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">价格</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" v-model="price">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">库存</label>
                            <input type="text" class="form-control" id="exampleInputPassword1" v-model="rpt">
                        </div>
                      
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" @click="add">提交更改</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';
    import qs from 'qs';
    import http from '../../http/baseurl';

    //这个是组件的格式,可以这样,进行了封装,一般export default输出的是一个函数,在vue文件里输出的是一个模块vue-loader
    export default {
        data(){
            return {
                dataset: [],
               
                page:1,
                
                goodnum:'',
                name:'',
                cad:'',
                price:'',
                rpt:'',
                checker:'',
                sel:''


            }
        },
        props: ['api','title','head','limit','api1','api2','data','status1','status2','api3','api4','api5','addgoods_status','status3','api6','api7'],
        beforeMount(){
            axios.get(this.api,{params:{page: this.page,limit: this.limit || 10}}).then(res => {
                //console.log(res);
                this.dataset = res.data.data.results;
                //console.log(this.dataset);

            })

            
        },
        beforeDestroy(){
            var payType = document.querySelectorAll('#type');
            for(var i=0;i<payType.length;i++){
                if(payType[i].innerText == '1'){
                    payType[i].innerText = '已支付';
                    payType[i].style.color = '#58bc58';
                }else if(payType[i].innerText == '0'){
                    payType[i].innerText = '未支付';
                    payType[i].style.color = 'red';
                }
                console.log(payType[i].innerText);
            };
        },
        updated(){
            var payType = document.querySelectorAll('#type');
            for(var i=0;i<payType.length;i++){
                if(payType[i].innerText == '1'){
                    payType[i].innerText = '已支付';
                    payType[i].style.color = '#58bc58';
                }else{
                    payType[i].innerText = '未支付';
                    payType[i].style.color = 'red';
                }
                console.log(payType[i].innerText);
            };
            var payGoods = document.querySelectorAll('#goods');
            var orderArr = [];
            var goodsText = [];
            var goodsList_c = [];
            //获取每个订单内容及数量
            for(var j=0;j<payGoods.length;j++){

                orderArr.push(JSON.parse(payGoods[j].innerText));
            };
            for(var n=0;n<orderArr.length;n++){
                var str = '';
                
                for(var m=0;m<orderArr[n].length;m++){
                    var sstr = '';
                    var goodsName = orderArr[n][m].name;
                    var goodsNum = orderArr[n][m].num;
                    var sstr = goodsName+'*'+goodsNum;
                    //console.log(sstr);
                    str = str + ',' +sstr;
                    //console.log(str);
                }
                
                goodsText.push(str);
            }
            for(var r = 0 ; r < goodsText.length; r++){
                goodsList_c.push(goodsText[r].slice(1));

            };
            //console.log(goodsList_c);
            for(var q = 0 ; q < goodsList_c.length ; q++){
               
                payGoods[q].innerText = goodsList_c[q];
 
            }
            
        },
        methods: {
            fen: function(e){
                var target = e.target;
                console.log(666);

                if(target.tagName.toLowerCase() === "li"){
                    console.log(666);
                    this.page = target.innerText*1;
                    if(this.sel === '商品种类'){
                        axios.get(this.api2,{params:{title:this.checker,page: this.page,limit: this.    limit}}).then(res => {
                            this.dataset = res.data.data.results;
            
                        })
                    }else if(this.sel === '商品id'){
                        axios.get(this.api1,{params:{id:this.checker}}).then(res => {
                            this.dataset = res.data.data.results;
                           
                            
            
                        })
                    }else if(this.sel === '用户名'){
                        axios.get(this.api3,{params:{username:this.checker}}).then(res => {
                            this.dataset = res.data.data.results;
                        })
                    }else if(this.sel === '订单编号'){
                        axios.get(this.api6,{params:{id:this.checker}}).then(res => {
                            this.dataset = res.data.data.results;
                        })
                    }else if(this.sel === '商品名称'){
                        console.log(666)
    
                        axios.get(this.api7,{params:{name:this.checker,page: this.page,limit: this. limit}}).then(res => {
                            this.dataset = res.data.data.results;
                        })
                    }else if(this.sel === ''){
                        this.Data();
                    } 
                   
                }
            },
            del:function(e){
                    var target = e.target;
                   
                    var _id = target.getAttribute('title');
                    console.log(_id);

                    axios.post(this.api5,
                    qs.stringify({id:_id}), 
                    {headers: {'Content-Type': 'application/x-www-form-urlencoded'}}
                ).then(res=>{
                    console.log(res);

                     this.Data();
                })

                     
                   

            },
            appen:function(){
                console.log(666);
                console.log(this.cad);
                console.log(this.name);
               var params = {
                    name:this.name,
                    id:this.goodnum,
                    price:this.price,
                    rpt:this.rpt,
                    title:this.cad
                    
                }

                axios.post(http.url+'/int',
                    qs.stringify(params), 
                    {headers: {'Content-Type': 'application/x-www-form-urlencoded'}}
                ).then(res=>{
                    console.log(res);
                    this.Data();

                })
            },
            check:function(){
                console.log(666);
                if(this.sel === '商品种类'){
                    axios.get(this.api2,{params:{title:this.checker,page: this.page,limit: this.limit}}).then(res => {
                        
                        this.dataset = res.data.data.results;

        
                    })
                }else if(this.sel === '商品id'){
                    axios.get(this.api1,{params:{id:this.checker}}).then(res => {
                        this.dataset = res.data.data.results;
                       
                        
        
                    })
                }else if(this.sel === '用户名'){
                    axios.get(this.api3,{params:{username:this.checker}}).then(res => {
                        this.dataset = res.data.data.results;
                    })
                }else if(this.sel === '订单编号'){
                    axios.get(this.api6,{params:{id:this.checker}}).then(res => {
                        this.dataset = res.data.data.results;
                    })
                }else if(this.sel === '商品名称'){
                    console.log(666)

                    axios.get(this.api7,{params:{name:this.checker,page: this.page,limit: this.limit}}).then(res => {
                        this.dataset = res.data.data.results;
                    })
                } 
            },

            add:function(){
                var params = {
                    name:this.name,
                    id:this.goodnum,
                    price:this.price,
                    rpt:this.rpt,
                    title:this.cad

                    
                }

                axios.post(http.url+'/add',
                    qs.stringify(params), 
                    {headers: {'Content-Type': 'application/x-www-form-urlencoded'}}
                ).then(res=>{
                    console.log(res);
                    this.Data();
        
                })

                

            },

            Data:function(){
                axios.get(this.api,{params:{page: this.page,limit: this.limit || 10}}).then(res => {
                        console.log(res);
                        this.dataset = res.data.data.results;
                        console.log(this.dataset);
        
                    })
            }


        }
    
    }
    
</script>
<style lang="scss" scoped>
    .el-header {
       background-color: #B3C0D1;
       color: #333;
        line-height: 60px;
    }
      
    .el-aside {
       color: #333;
     }
    .title{text-align:center;font-size:26px;font-weight:bold;letter-spacing:3px;}
    .center_t{border-bottom:2px solid #ccc;}
    .check{margin:30px 0 30px 0;
        #sel{
            height: 33px;
            width: 130px;
            margin-left: 500px;
            display: inline-block;

        }

        input{
            height: 30px;
            width: 180px;
        }
    }
    #goods{
        width:445px;
        
    }
    .serachBtn{
        width: 60px;
        height: 33px;
        vertical-align: top;
    }
    .serachPut{
        height: 30px;
        width: 180px;
        display: inline-block;
        vertical-align: top;
    }
</style>