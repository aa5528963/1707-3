<template>
	<div class="bigPage">
		<div class="loginPage" style="height:280px;">
		  	<div class="form-group">
		    	<label for="exampleInputEmail1">用户名</label>
		    	<input type="email" class="form-control usernameLo" id="exampleInputEmail1" placeholder="请输入用户名" @blur="loginYz()">
		    	<i id="username_zt"></i>
		    	<p class="username_ts"></p>
		  	</div>
		  	<div class="form-group">
			    <label for="exampleInputPassword1">密码</label>
			    <input type="password" class="form-control passwordLo" id="exampleInputPassword1" placeholder="请输入密码">
			    <i id="password_zt"></i>
			    <p class="password_ts"></p>
		  	</div>
		  	<button type="submit" class="btn btn-default btn-primary" @click="passwordYz()">登录</button>
		  	<router-link to="/register" class="register_btn">点击注册</router-link>
		  	
		</div>
	</div>
</template>

<script>
	import axios from 'axios';
	import http from '../../http/baseurl';
	import datagrid from '../../components/datagrid/datagrid.vue'
	//这个是组件的格式,可以这样,进行了封装,一般export default输出的是一个函数,在vue文件里输出的是一个模块vue-loader
	export default {
		components:{
			datagrid
		},
		methods:{
			//登录验证用户名是否存在
			loginYz(){
				var _username=$('.usernameLo').val();
				//console.log($('.usernameLo').val());
				if(_username != ''){
					axios.get(http.url+'/loginView',{params:{username:_username}}).then(res => {
		            	if(res.data == 'yes'){
		            		//$('.username_zt')[0].className = '';

		            		$('#username_zt')[0].className = 'el-icon-circle-check';
		            		$('.username_ts').text('');

		            	}else{
		            		//$('.username_zt')[0].className = '';

		            		$('#username_zt')[0].className = 'el-icon-circle-close';
		            		$('.username_ts').text('* 请输入正确的用户名');
		            		//$('.username_zt').addClass('el-icon-circle-close');
		            	}
		                console.log(res);
		            })
		        }else{
		            $('.username_ts').text('');
		            $('#username_zt')[0].className = '';
		            $('.username_ts').text('* 用户名不能为空');
		            $('#username_zt')[0].className = 'el-icon-circle-close';

		        }
	            
			},
			//验证用户名与密码是否匹配
			passwordYz(){
				var _username = $('.usernameLo').val();
				var _password = $('.passwordLo').val();
				var xx=$('#username_zt')[0].className;
				//console.log(_username,_password,xx);
				if(_username !=''){
					axios.get(http.url+'/loginGo',{params:{username:_username,password:_password}}).then(res => {
						if(res.data.data.results.length != 0){
							var passWord = res.data.data.results[0].pass_word;
							console.log(passWord);
							if(_password == ''){

								$('.password_ts').text('* 密码不能为空');
		            			$('#password_zt')[0].className = 'el-icon-circle-close';

							}else if(xx == 'el-icon-circle-check' && _password == passWord){
								console.log('登录成功');
								this.$router.push({name:'handle'});

								//<a href='#/handle'></a>
							}else{
								$('.password_ts').text('* 请输入正确的密码');
		            			$('#password_zt')[0].className = 'el-icon-circle-close';
								
							}
						}
						
						console.log(res);
					})
					}else{
		            	$('.username_ts').text('* 用户名不能为空');
					}
				
			}
		},
	}
	
</script>
<style lang="scss">
	.el-header {
	   background-color: #B3C0D1;
	   color: #333;
	    ine-height: 60px;
	}
	  
	.el-aside {
	   color: #333;
	}
	.loginPage{
		margin:0 auto;
		width:500px;
		height:300px;
		padding:50px;
		border:1px solid #ccc;
		background-color:#fff;
		background:rgba(255,255,255,0.6);
	}
	.bigPage{
		width:100%;
		height:600px;
		padding-top:100px;
		background:url('../../img/bg.jpg') no-repeat;
		background-size:100% 600px;
	}
	.btn-primary{
		margin-top:15px;
		margin-left:165px;
	}
	.register_btn{
		display:inline-block;
		font-size:16px;
		vertical-align:bottom;
		padding-left:10px;
	}
	.el-icon-circle-close{    
		color: red;
	    position: absolute;
	    top: 35px;
	    right: 7px;
    }

    .el-icon-circle-check{
    	color: #58bc58;
	    position: absolute;
	    top: 35px;
	    right: 7px;
    }

    .form-group{
    	position:relative;
    }
    .username_ts{
    	color:red;
    }
    .password_ts{
    	color:red;
    }

</style>
