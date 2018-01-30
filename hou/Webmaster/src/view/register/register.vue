<template>
    <div class="bigPage">
        <div class="registerPage">
        <el-form :model="ruleForm2" status-icon :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm">
            <div class="el-form-item el-form-item--feedback">
                <label for="username" class="el-form-item__label" style="width: 100px;">用户名</label>
                <div class="el-form-item__content" style="margin-left: 100px;">
                    <div class="usernameBe el-input">
                        <input autocomplete="off" type="text" rows="2" validateevent="true" class="el-input__inner usernameRs" @blur="registerYz()">
                        <i id="username_yz"></i>
                    </div>
                    <div class="el-form-item__error username_ts"></div>
                </div>
            </div>
            <div class="el-form-item el-form-item--feedback">
                <label for="password" class="el-form-item__label" style="width: 100px;">密码</label>
                <div class="el-form-item__content" style="margin-left: 100px;">
                    <div class="passwordBe el-input">
                        <input autocomplete="off" type="password" rows="2" validateevent="true" class="el-input__inner passwordRs" @blur="registerPw()">
                        <i id="password_yz"></i>
                    </div>
                    <div class="el-form-item__error password_ts"></div>
                </div>
            </div>
            <div class="el-form-item el-form-item--feedback">
                <label for="repassword" class="el-form-item__label" style="width: 100px;">确认密码</label>
                <div class="el-form-item__content" style="margin-left: 100px;">
                    <div class="repasswordBe el-input">
                        <input autocomplete="off" type="password" rows="2" validateevent="true" class="el-input__inner repasswordRs" @blur="registerRpw()">
                        <i id="repassword_yz"></i>
                    </div>
                    <div class="el-form-item__error repassword_ts"></div>
                </div>
            </div>
        <el-form-item>
        <el-button type="primary" @click="loginBtn()">注册</el-button>
            
            <router-link to="/login" class="loginBtn">点击登录</router-link>
        </el-form-item>
        </el-form>
        </div>
    </div>
</template>
<script>
    import axios from 'axios';
    import http from '../../http/baseurl';

  export default {
    data() {
        return {
            
        }
    },
    methods: {
        //用户名注册验证
        registerYz(){
            var _username = $('.usernameRs').val();
            console.log($('.usernameRs').val());
            if(_username != ''){
                axios.get('http://10.3.136.74:88/registerbehind',{params:{username:$('.usernameRs').val()}}).then(res => {
                    if(res.data.data.results.length == 0){
                        $('.username_ts')[0].style.color = '#58bc58';
                        $('#username_yz')[0].className = 'el-icon-circle-check';
                        $('.username_ts').text('用户名可用');
                    }else{
                        $('.username_ts')[0].style.color = 'red';
                        $('#username_yz')[0].className = 'el-icon-circle-close';
                        $('.username_ts').text('用户名已注册');
                    }
                    //console.log(res);
                })
            }else{
                $('.username_ts')[0].style.color = 'red';
                $('.username_ts').text('用户名不能为空');
                $('#username_yz')[0].className = 'el-icon-circle-close';
            }
            
        }, 
        //密码非空
        registerPw(){
            var _password = $('.passwordRs').val();
            console.log(_password);
            if(_password == ''){
                $('.password_ts')[0].style.color = 'red';

                $('.password_ts').text('密码不能为空');
                $('#password_yz')[0].className = 'el-icon-circle-close';
            }else{
                $('#password_yz')[0].className = 'el-icon-circle-check';
                $('.password_ts')[0].style.color = '#58bc58';
                $('.password_ts').text('密码可用');
            }
        },
        //两次密码一致
        registerRpw(){
            var _password = $('.passwordRs').val();
            var _repassword = $('.repasswordRs').val();

            console.log(_password,_repassword);
            if(_password == _repassword && _repassword != ''){
                $('#repassword_yz')[0].className = 'el-icon-circle-check';
                $('.repassword_ts')[0].style.color = '#58bc58';
                $('.repassword_ts').text('密码一致');
            }else{
                $('.repassword_ts')[0].style.color = 'red';
                $('#repassword_yz')[0].className = 'el-icon-circle-close';
                $('.repassword_ts').text('两次密码不一致'); 
            }
        },
        //登录认证
        loginBtn(){
            var _username = $('.usernameRs').val();
            var _password = $('.passwordRs').val();
            var _repassword = $('.repasswordRs').val();
            if(_username != ''){
                axios.get(http.url+'registerbehind',{params:{username:$('.usernameRs').val()}}).then(res => {
                //console.log(res);
                console.log(res.data.data.results.length);
                    if(res.data.data.results.length == 0){
                        if(_password == _repassword){
                            //写入数据库
                            axios.get(http.url+'registerin',{params:{username:_username,password:_password}}).then(respone=>{  
                                
                                location.href = '#/login';
                                //console.log(respone);
                            })
                        }else{
                            $('.repassword_ts')[0].style.color = 'red';
                            $('#repassword_yz')[0].className = 'el-icon-circle-close';
                            $('.repassword_ts').text('两次密码不一致'); 
                        }
                    }else if(res.data.data.results.length == 1){
                        //刷新页面
                        location.href = '#/register';
                    }
                    
                })
            }
            
        }
    }
  }
</script>
<style>
    .bigPage{
        width:100%;
        height:600px;
        padding-top:100px;
        background:url('../../img/bg.jpg') no-repeat;
        background-size:100% 600px;
    }
    .registerPage{
        margin:0 auto;
        width:500px;
        height:330px;
        padding:50px;
        border:1px solid #ccc;
        background-color:#fff;
        background:rgba(255,255,255,0.6);
    }
    .loginBtn{
        padding-left:15px;
    }
    .usernameRs{
        position:relative;
    }
    .el-icon-circle-close{
        position:absolute;
        color:red;
        top: 14px;
        right: 7px;
    }
    .el-icon-circle-check{
        position:absolute;
        color:#58bc58;
        top: 14px;
        right: 7px;
    }
</style>