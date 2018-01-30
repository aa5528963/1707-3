<template>
	<div class="all">
		<div class="shade"></div>
		<header>
			<!-- <i class="el-icon-close fl"></i> -->
			<h2>微信支付</h2>
		</header>
		<div class="hint" v-show="type">
			<h4>支付确认</h4>
			<p>1.您已选择微信付款方式，请在微信内完成支付，请点击“付款”按钮完成支付;</p>
			<p>2.如果您还未安装微信6.02及以上版本客户端，请点击“取消”，并安装完成后再去支付</p>
			<div class="btn">
				<span @click="payNone">取消</span>
				<span @click="payDone">付款</span>
			</div>
		</div>
		<div class="paySuccess" v-show="show">
			<p>付款成功</p>
			<span>2s后为您条转到个人订单</span>
		</div>
	</div>
</template>

<script>
	import axios from 'axios';
	import http from '../../http/baseurl';
	export default{
		data(){
			return{
				show:false,
				type:true
			}
		},
		methods:{
			payDone:function(){
				console.log(this.$route.params.id);
				var orderId = this.$route.params.id;
				axios.get(http.url+'/change',{
					params:{id:orderId}
				}).then(res=>{
					console.log(res);
					if(res.data.status){
						this.type = false;
						setTimeout(()=>{
							this.show = true;
						},1000)
						//----------请求购物车那边删除购物车里面的商品-------------------
						axios.get(
			                http.url+'/cardelete'
			            ).then(res=>{
			                // console.log(res);
			            })
						//------------请求购物车那边删除购物车里面的商品----------------
						setTimeout(()=>{
							this.$router.push({name:'myorder'});
						},2000)
					}
				})


			// alert('支付完成');
			// this.status = false
			//点击付款时  判断付款状态   如果付款状态为1，表示付款成功，跳转页面
			},
			payNone:function(){
				this.$router.push({name:'shoppingcar'});
			}
		}
	}

	// console.log($('.clickMe').text());

</script>

<style lang="scss" scoped>
	.all{
		height:100%;position:relative;
		header{
			line-height:1.146667rem;font-size:0.506667rem;background:#FAFAFA;text-align:center;
			/*i{line-height:1.146667rem;font-size:0.66rem;margin-left:5%;}*/
			h2{tetx-align:center;}
		}
		.shade{position:absolute;letf:0;top:0;width:100%;height:100%;background:rgba(0,0,0,.6);z-index:1;}
		.hint{
			width:70%;height:30%;background:#fff;border-radius:5%;z-index:20;position:absolute;left:50%;top:40%;transform:translate(-50%,-40%);
			h4{font-size:0.6rem;line-height:1.5rem;text-align:center;color:#E56270;}
			p{font-size:0.36rem;padding:0 3%;margin-bottom:0.3rem;}
			.btn{
				height:1rem;border-top:1px solid #ccc;line-height:0.8rem;
				span{display:inline-block;width:45%;padding:3% 0;font-size:0.48rem;text-align:center;}
				span:nth-child(1){border-right:1px solid #ddd;}
				span:nth-child(2){color:#E56270;}
			}
		}
		.paySuccess{
			width:70%;height:20%;background:#fff;border-radius:5%;z-index:20;position:absolute;left:50%;top:40%;transform:translate(-50%,-40%);
			p{font-size:0.8rem;text-align:center;line-height:2rem;}
			span{display:block;width:100%;font-size:0.45rem;text-align:center;}
		}
	}
</style>
