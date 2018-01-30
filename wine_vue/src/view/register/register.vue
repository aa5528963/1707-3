<template>
    <div id="register">
        <mt-header title="注册" class="head">
            <router-link to="/" slot="left">
                <mt-button class="el-icon-arrow-left" @click="back">返回</mt-button>
                <mt-button></mt-button>
            </router-link>
            <mt-button slot="right" @click="login">登录</mt-button>
        </mt-header>
        <main class="main">
            <mt-field label="用户名"   :state="status" placeholder="请输入手机号" type="number" class="el-icon-mobile-phone name" maxlength="11" v-lblur>
            </mt-field>
            <mt-field label="密码" placeholder="请输入密码" type="password" :state="password" class="el-icon-sold-out password" ref="mybox">
                <mt-switch v-model="value" @click.native="show"></mt-switch>
            </mt-field>
            <mt-cell title="" class="forget"></mt-cell>
            <div class="btns">
                <mt-button type="default" class="btn" @click="register">注册</mt-button>
            </div>
            <mt-cell value="手机快捷登录" class="cellphone"></mt-cell>
        </main>
        <footer class="foot">
            <img src="../../img/bottom.jpg" height="238" width="719" alt="" class="bos"/>
        </footer>
    </div>
</template>

<script>
    import axios from 'axios';
    import { Header } from 'mint-ui';
    import { MessageBox } from  'mint-ui';
    import qs from 'qs';
    import { Indicator } from 'mint-ui';
    import http from '../../http/baseurl'
    import Vue from 'vue';
    var self;
    export default {
        data() {
            self = this;
            return {
                reg:/^(13[0-9]|14[579]|15[0-3,5-9]|17[0135678]|18[0-9])\d{8}$/,
                pass:/^[a-zA-Z]\w{5,17}$/,
                status:"",
                password:"",
                value:false,
            }
        },
        methods:{
            
            register(){
                console.log(this.username);
                var user = $('.mint-field-core').first().val();
                var password = $('.mint-field-core').last().val();
                if(this.reg.test(user) && this.pass.test(password)){
                    if(self.boon=='no'){
                    }
                    axios.post(http.url+'/register',qs.stringify({user:user,password:password}), 
                        {headers: {'Content-Type': 'application/x-www-form-urlencoded'}}
                    ).then(response => {
                        this.$router.push({name:'login'});
                    })
                }else{
                    MessageBox({
                        message: `<div class="homeTelPhone">格式不正确</div>`
                    })
                }
            },
            login(){
                this.$router.push({name:'login'})
            },
            show(){
                console.log(self.$refs.mybox.$el)
                var pass = self.$refs.mybox.$el
                var pas = pass.querySelector('.mint-field-core')
                if(self.value==false){
                    console.log(pas);
                    pas.type='text';
                }else{
                    pas.type='password';
                }
            },
            back(){
                history.back();
            }

        },
        mounted(){
            var pas = document.querySelectorAll('.mint-field-core')[1];
            pas.onblur=function(){
                var pasvalue = pas.value;
                if(self.pass.test(pasvalue)){
                    self.password='success';
                }else{
                    self.password='error';
                } 
            }
        }
    };

    Vue.directive('lblur', function(el, pra, a) {
        // console.log(el,pra,a);
        let oInput = el.querySelector('input');
        oInput.onblur = function() {
            //onblur事件连续触发
            //决方案是在窗口失去焦点的时候让文本框也失去焦点
            window.onblur=function(){
                document.getElementsByTagName('input')[0].blur();
            }
            var user = this.value;
            if(self.reg.test(user)){
                self.status='success';
                axios.get(http.url+'/register', 
                    {params:{date: user}}).then(response => {
                    if(response.data=='no'){
                        var num = 1;
                        self.boon=response.data;
                        MessageBox({
                            message: `<div class="homeTelPhone">用户已存在</div>`
                        })
                    }
                })
            }else{
                self.status='error';
            }  
        };
    })
</script>
<style lang="scss">

    #register{
     height: 100%;
     background: #F4F5F7;
}
 .head{
     line-height: 1.2rem;
     height: 1.2rem;
     font-size: 0.4rem;
}
 .main{
     .name,.password{
         height:1.7333333333333334rem;
         line-height: 1.7333333333333334rem;
         font-size: 0.4rem;
    }
     .name .mint-cell-wrapper,.password .mint-cell-wrapper,.password .mint-cell-value,.name .mint-cell-value{
         background: #fff;
    }
     .mint-field-core,.mint-cell-text{
         height: 1.0666666666666667rem;
         font-size: 0.4rem;
    }
     .password .mintui{
         margin-right: 0.18666666666666668rem;
    }
     .btns{
         text-align: center;
    }
     .btn{
         width: 90%;
         height: 1.0666666666666667rem;
         background: #ccc;
         font-size:0.4rem;
    }
     .mint-cell-value,.mint-cell-wrapper{
         font-size: 0.48rem;
         line-height: 2rem;
         background: #F4F5F7;
    }
     .forget .mint-cell-wrapper{
         height: 1.3333333333333333rem;
    }
    
}
 .mintui{
     font-size:0.3466666666666667rem;
     margin-right:0.26666666666666666rem;
}
 .mint-field-state .mintui {
     font-size: 0.4533333333333333rem;
}
 .nump{
     font-size:0.3466666666666667rem;
     text-align:center;
}
 .homeTelPhone{
     font-size:0.3466666666666667rem;
}
 footer img{
     width: 100%;
     position: absolute;
     bottom: 1.0666666666666667rem;
}
.mint-msgbox-confirm{
        font-size: 24px;
}
.mint-msgbox-title{
    font-size: 26px;
}
.mint-msgbox{
    width: 60%;
}
</style>