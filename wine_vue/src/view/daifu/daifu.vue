<template>
	<div class="all">
		<header>
			<i class="el-icon-back fl" @click="backTo"></i>
			<h2>待付款</h2>
		</header>
		<main>
			<div class="allOrder">
				<ul v-for="(itm,index) in orderList">
                    <h3>{{'订单编号：'+itm.orderId}}</h3>
					<li v-for="(val,key) in itm">
						<img :src="val.imgurl" class="fl">
						<h4 class="fl">{{val.name}}</h4><br>
						<div class="price">{{val.price}}<span>{{' &times; '+val.num}}</span></div>
					</li>
					<!--<span @click="goPay(itm.orderId,$event)" class="goPay">去付款</span>-->
					<router-link :to="{name:'shoppingpay',params:{id:itm.orderId,total:itm.orderTotal}}" class="goPay">去付款</router-link>
					<p>{{'总价：'+itm.orderTotal}}<span class="delete" @click="deleteOrder(itm.orderId,$event)">删除</span></p>
				</ul>
			</div>
		</main>
		<footer>
			<!-- <h2>继续购物</h2> -->
			<router-link :to="{name:'homepage'}" class="h2">继续购物</router-link>
			<!-- <router-link :to="{name:'shoppingpay',params:{total:total}}" class="button" @click='btnPay'>去结算</router-link> -->
		</footer>
	</div>
</template>

<script>
	// import $ from 'jquery'
	import axios from 'axios'
    import http from '../../http/baseurl'
	export default{
		data(){
			return{
                orderList:[]
			}
		},
		methods:{
			//goPay:function(id,e){
				//console.log(id,e);
				//this.$router.push({name:'shoppingpay'});
			//},
			deleteOrder:function(id,e){
				// console.log(id);
				axios.get(http.url+'/orderdel',{
					params:{id:id}
				}).then(res=>{
					// console.log(res);
					
					axios.get(
		                http.url+'/gettype0',{
		                	params:{type:0}
		                }).then(res=>{
		                if(res.status){
			                var _res = res.data.data.results;
			                var goodsList = [];
			                for(var i = 0;i<_res.length;i++){
			                    goodsList.push(_res[i].goods);
			                }
			                // goodsList[1] = '[' + goodsList[1];
			                console.log(goodsList);

			                for(var j=0;j<goodsList.length;j++){
			                    console.log(_res[j].total);
			                    goodsList[j] = JSON.parse(goodsList[j]);
			                    goodsList[j].orderId = _res[j].id;
			                    goodsList[j].orderTotal = _res[j].total;
			                    console.log(goodsList[j]);
			                }
			                this.orderList = goodsList;
		                }
		            })
				})
			},
			backTo:function(){
				this.$router.push({name:'myorder'})
			}
		},
		beforeMount:function(){
           axios.get(http.url+'/gettype0',{
           	  params:{type:0}
           }).then(res=>{
               // console.log(res);
               var _res = res.data.data.results;
                this.dataset = _res;
                var goodsList = [];
                for(var i = 0;i<_res.length;i++){
                    goodsList.push(_res[i].goods);
                }
                // goodsList[1] = '[' + goodsList[1];
                console.log(goodsList);

                for(var j=0;j<goodsList.length;j++){
                    console.log(_res[j].total);
                    goodsList[j] = JSON.parse(goodsList[j]);
                    goodsList[j].orderId = _res[j].id;
                    goodsList[j].orderTotal = _res[j].total;
                    console.log(goodsList[j]);
                }
                this.orderList = goodsList;
            })
       	}
	}

</script>

<style lang="scss" scoped>
	.all{
		display:flex;flex-direction:column;height:100%;
		header{
			line-height:1.146667rem;font-size:0.506667rem;background:#FAFAFA;text-align:center;padding-left:5%;position:relative;
			i{line-height:1.146667rem;font-size:0.66rem;position:absolute;left:3%;top:0;}
		}
		main{
			flex:1;overflow-x:hidden;background:#ddd;
			.allOrder{
				background:#ddd;
				ul{
					border-bottom:1px solid #ddd;background:#fff;margin-bottom:0.5rem;padding:0 0.5rem;
					h3{
						font-size:0.4rem;border-bottom:1px solid #ddd;line-height:0.8rem;
						span{color:#f00;}
					}
					li{
						height:3.5rem;padding-top:0.2rem;border-bottom:1px solid #ddd;
						h4{width:55%;font-size:0.4rem;}
						img{height:3rem;margin-right:5%;}
						h4{font-size:0.35rem;line-height:0.6rem;}
						.price{
							font-size:0.35rem;line-height:2rem;color:#f00;
						}
						.price::before{content:"￥"}
					}
					.goPay{font-size:0.43rem;margin-left:76%;font-weight:bold;line-height:1rem;color:#f00;}
					p{
						font-size:0.4rem;color:#f00;line-height:0.8rem;font-weight:bold;border-top:1px solid #ddd;
						.delete{color:#000;margin-left:57%;}
					}
				}
				ul:last-child{margin-bottom:0;}
			}
		}
		footer{
			line-height:1.146667rem;font-size:0.506667rem;background:#eee;text-align:center;
			.h2{font-size:0.6rem;text-align:center;color:#000;font-weight:bold;}
		}
	}
</style>