<template>
	<div class="all">
		<header>
			<i class="el-icon-back fl" @click="backcar"></i>
			<h2>支付中心</h2>
		</header>
		<main>
			<p class="ts">订单已生成，请您尽快付款</p>
			<div class="money">
				<span>支付金额</span><i>{{'订单号：'+this.$route.params.id}}</i>
				<span class="total">{{this.$route.params.total}}</span>
			</div>
			<div class="money">
				<span>支付方式</span>
			</div>
			<ul class="payMode">
				<li>
					<i class="el-icon-sold-out fl"></i>
					<div class="payName fl">
						<div class="goPay" @click="payMent">
							<span>微信支付</span>
							<span class="advise">(推荐)</span>
						</div>
						<div class="payDescription">更快，更便捷支付</div>
					</div>
					<div class="fr"><i class="el-icon-arrow-right"></i></div>
				</li>
				<li>
					<i class="el-icon-sold-out fl"></i>
					<div class="payName fl">
						<div><span>支付宝</span></div></p><i></i>
						<div class="payDescription">支持大额支付</div>
					</div>
					<div class="fr"><i class="el-icon-arrow-right"></i></div>
				</li>
				<li>
					<i class="el-icon-sold-out fl"></i>
					<div class="payName fl">
						<div><span>银联在线</span></div></p><i></i>
						<div class="payDescription">支持各种储蓄卡、信用卡支付</div>
					</div>
					<div class="fr"><i class="el-icon-arrow-right"></i></div>
				</li>
				<li>
					<i class="el-icon-sold-out fl"></i>
					<div class="payName fl">
						<div><span>花呗</span></div></p><i></i>
						<div class="payDescription">这月花，下月还</div>
					</div>
					<div class="fr"><i class="el-icon-arrow-right"></i></div>
				</li>
				<li>
					<i class="el-icon-sold-out fl"></i>
					<div class="payName fl">
						<div><span>翼支付</span></div></p><i></i>
						<div class="payDescription">电信旗下支付品牌，更快更安全</div>
					</div>
					<div class="fr"><i class="el-icon-arrow-right"></i></div>
				</li>
			</ul>
			<div class="safety">
				<div class="safety_top">
					<i class="el-icon-warning"></i>
					<span>下单后请认准酒仙网外呼电话，谨防咋骗！</span>
				</div>
				<div class="safety_bottom">安全提醒：酒仙网不会以任何理由，要求您点击链接进行退款或重新付款，谨防诈骗。有关订单和售后问题，酒仙网客服仅会通过电话
				<span>tel:010-60157999、</span>
				<span>010-57835999</span>与您沟通
				</div>
			</div>
		</main>
		<footer>
            <ul>
                <li @click="goHome">
                    <img src="src/img/01.png">
                </li>
                <li>
                    <img src="src/img/02.png">
                </li>
                <li>
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
		    	
		    }
		},
		methods:{
			backcar:function(){
				this.$router.push({name:'shoppingcar'});
			},
			payMent:function(){
				var orderId = this.$route.params.id;
				this.$router.push({name:'payment',params:{id:orderId}});
			},
			gocar:function(){
				this.$router.push({name:'shoppingcar'});
			},
			goorder:function(){
				this.$router.push({name:'myorder'});
			},
			goHome:function(){
				this.$router.push({name:'homepage'});
			}
		}

	}
</script>

<style lang="scss" scoped>
	.all{
		height:100%;background:#F5F5F5;display:flex;flex-direction:column;
		header{
			line-height:1.146667rem;font-size:0.506667rem;background:#FAFAFA;text-align:center;padding-left:5%;position:relative;
			i{line-height:1.146667rem;font-size:0.66rem;position:absolute;left:3%;top:0;}
		}
		main{
			flex:1;background:#F7F7F7;
			.ts{line-height:0.953333rem;font-size:0.36rem;padding-left:5%;}
			.money{
				display:flex;justify-content:space-between;height:1.146667rem;line-height:1.146667rem;font-size:0.36rem;background:#fff;margin-bottom:0.266667rem;
				i{color:#FF515B;}
				span{width:20%;text-align:center;}
				.total{color:#FF4554;}
				.total::before{content:"￥";}
			}
			.payMode{
				h3{font-size:0.36rem;background:#fff;font-weight:normal;height:1.146667rem;line-height:1.146667rem;padding-left:5%;}
			}
			.payMode{
				background:#fff;padding:0 3%;
				li{
					height:1.3rem;border-bottom:1px solid #ddd;line-height:1.3rem;
					.el-icon-sold-out{color:#FF4554;}
					.payName{
						height:1.3rem;font-size:0.4rem;line-height:0.65rem;margin-left:3%;
						span{font-size:0.4rem;}
						.advise{color:#FF4554;}
						.payDescription{font-size:0.3rem;color:#aaa;}
					}
				}
			}
			.safety{
				.safety_top{
					font-size:0.35rem;line-height:0.85rem;padding-left:5%;background:#FFF4E2;
					.el-icon-warning{color:#FF4554;}
				}
				.safety_bottom{
					font-size:0.32rem;line-height:0.85rem;padding:0.35rem;
					span{color:#FF4554;}
				}
			}
		}
		footer{
			height:2rem;background:#fff;
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