<template>
	<div class="all">
		<div class="shade"></div>
		<header>
			<!-- <i class="el-icon-close fl" @click="hide"></i> -->
			<div class="setting">
				<i class="el-icon-setting"></i>
				<i class="el-icon-message"></i>
			</div>
			<div class="nickname clearfix">
				<img src="src/img/touxiang.jpg" class="fl">
				<div class="fl">
					<p>还没有设置会员名</p>
					<span>酒虫会员</span>
				</div>
			</div>
		</header>
		<main>
			<div class="main-top">
				<span>我的订单</span>
				<a href="javascript:void(0);" @click="allOrder">查看全部订单 ></a>
			</div>
			<ul class="status">
				<li @click="daifu">
					<i class="el-icon-tickets"></i><br>
					<span>待付款</span>
				</li>
				<li @click="yifu">
					<i class="el-icon-tickets"></i><br>
					<span>待发货</span>
				</li>
				<li>
					<i class="el-icon-tickets"></i><br>
					<span>待收货</span>
				</li>
				<li>
					<i class="el-icon-tickets"></i><br>
					<span>待评价</span>
				</li>
			</ul>
			<div class="mypackage">
				<div class="mypackage_t">
					<span>我的钱包</span>
					<a href="javascript:void(0);">查看明细 ></a>
				</div>
				<ul class="mypackage_b">
					<li>
						<span>0.00</span><br>
						<span>账户余额</span>
					</li>
					<li>
						<span>0.00</span><br>
						<span>返现</span>
					</li>
					<li>
						<span>0</span><br>
						<span>优惠券</span>
					</li>
					<li>
						<span>0</span><br>
						<span>金币</span>
					</li>
				</ul>
			</div>
			<ul class="others">
				<li>
					<i>0</i><br>
					<span>商品收藏</span>
				</li>
				<li>
					<i>1</i><br>
					<span>流览足迹</span>
				</li>
				<li>
					<i class="el-icon-menu"></i><br>
					<span>会员频道</span>
				</li>
				<li>
					<i class="el-icon-menu"></i><br>
					<span>商品兑换</span>
				</li>
				<li>
					<i class="el-icon-menu"></i><br>
					<span>意见反馈</span>
				</li>
				<li>
					<i class="el-icon-menu"></i><br>
					<span>客服热线</span>
				</li>
				<li>
					<i class="el-icon-menu"></i><br>
					<span>招商入驻</span>
				</li>
				<li>
					<i class="el-icon-menu"></i><br>
					<span>酒快到</span>
				</li>
			</ul>
		</main>
		<footer>
            <ul>
                <li @click="goHome">
                    <img src="src/img/01.png">
                </li>
                <li @click="fenlei">
                    <img src="src/img/02.png">
                </li>
                <li @click="goHome">
                    <img src="src/img/c.png" class="pic">
                    <span class="shequ">社区</span>
                </li>
                <li @click="gocar">
                    <img src="src/img/03.png">
                </li>
                <li @click="goorder">
                    <img src="src/img/04.png">
                </li>
            </ul>
        </footer>
	</div>
</template>

<script>
	export default{
		data(){
			return{
				dataset:[],
				user:''
			}
		},
		methods:{
			allOrder:function(){
				this.$router.push({name:'allorder'});
			},
			fenlei:function(){
				this.$router.push({name:'goodslist'});
			},
			gocar:function(){
				this.$router.push({name:'shoppingcar'});
			},
			goorder:function(){
				this.$router.push({name:'allorder'});
			},
			goHome:function(){
				this.$router.push({name:'homepage'});
			},
			daifu:function(){
				this.$router.push({name:'daifu'});
			},
			yifu:function(){
				this.$router.push({name:'yifu'});
			}
		}
	}

	//localStorage.setItem("name",_username)
	//localStorage.getItem("name");
</script>

<style lang="scss" scoped>
	.all{
		display:flex;flex-direction:column;height:100%;
		height:100%;position:relative;
		header{
			height:3.3rem;background:#303038;
			.setting{
				height:1rem;position:relative;
				i{position:absolute;right:15%;top:2%;line-height:1rem;font-size:0.66rem;color:#fff;}
				i:nth-child(2){right:5%;}
			}
			.nickname{
				color:#fff;height:1.733333rem;
				img{margin-left:5%;margin-right:2%;}
				div{
					p{font-size:0.4rem;line-height:0.5rem;}
					span{font-size:0.35rem;line-height:0.4rem;}
				}
			}
		}
		main{
			flex:1; background:#ddd;overflow-x:hidden;
			.main-top{
				height:1.2rem;background:#fff;display:flex;justify-content:space-between;font-size:0.45rem;line-height:1.2rem;border-bottom:2px solid #eee;
				span{width:30%;text-align:center;}
				a{width:40%;text-align:center;color:#333;}
			}
			.status{
				display:flex;height:2.84rem;background:#fff;border-bottom:2px solid #eee;margin-bottom:0.4rem;
				li{
					flex:1;text-align:center;font-size:0.35rem;
					i{font-size:0.6rem;line-height:0.8rem;line-height:1.8rem;}
				}
			}
			.mypackage{
				height:3.2rem;background:#fff;margin-bottom:0.4rem;
				.mypackage_t{
					display:flex;justify-content:space-between;font-size:0.45rem;line-height:1.3rem;border-bottom:0.05rem solid #eee;
					span{width:30%;text-align:center;}
					a{width:40%;text-align:center;color:#333;}
				}
				.mypackage_b{
					display:flex;height:1.9rem;background:#fff;border-bottom:2px solid #eee;
					li{
						flex:1;text-align:center;font-size:0.35rem;line-height:0.92rem;
					}
				}
			}
			.others{
				display:flex;flex-wrap:wrap;height:4.08rem;background:#fff;
				li{
					flex:25%;height:2.04rem;text-align:center;font-size:0.35rem;line-height:1.02rem;
					i{font-size:0.4rem;color:#E03559;}
				}
			}
		}
		footer{
			height:2rem;
			ul{
		        display:flex;justify-content:space-around;text-align:center;height:100%;
		        li{
		            display:flex;flex-direction:column;text-align:center;padding-top:0.5rem;
		            img{width:1.2rem;height:1rem;}
		            .pic{width:0.6rem;height:0.6rem;}
		            span{font-size:0.3rem;line-height:0.6rem;}
		        }
		    }
		}
	    
	}
</style>
