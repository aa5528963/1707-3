<template>
	<div class="all">
		<header>
			<i class="el-icon-back" @click="back"></i>
			<h2>购物车</h2>
			<!-- <span class="edit">编辑</span> -->
			<i class="el-icon-menu edit"></i>
		</header>
		<div class="ad">
			<i class="el-icon-info"></i>
			<p>自营商品实付满100元免运费,偏远地区满500元免运费</p>
			<i class="el-icon-close" @click="closeAd"></i>
		</div>
		<main>
			<div class="carlist">
				<h3><i class="el-icon-info"></i>买酒轩官方品牌旗舰店</h3>
				<ul class="productList">
					<li v-for="(item, index) in datacar" :key="item.id">
						<div class="check">
							<input type="checkbox" checked="checked" @click="cancleCheck(index,$event)" class="checkme">
						</div>
						<div><img :src="item.imgurl"></div>
						<div>
							<h4>{{item.name}}</h4>
							<div class="price">{{item.price}}</div>
							<div class="num">
								<span class="sub fl" @click="btnSub(index,item.price,$event)">-</span>
								<input type="text" v-model="item.num" class="nb fl">
								<span class="add" @click="btnAdd(index,item.price,$event)">+</span>
							</div>
						</div>
						<div class="delete" @click="deleteGoods(item.id,index,$event)"><span>删除</span></div>
					</li>
				</ul>
			</div>
			<div class="guess_like">
				<div class="guess_like_title">
					<h3><i class="el-icon-goods"></i>你可能会喜欢</h3>
				</div>
				<ul class="guess_like_list">
					<li v-for="item in dataset">
						<img :src="item.imgurl" @click="goDetails(item.id)">
						<h3>{{item.name}}</h3>
						<p class="price">{{item.nprice}}</p>
					</li>
				</ul>
			</div>
		</main>
		<footer>
			<div class="footer-l fl">
				<input type="checkbox" id="ckeckAll" checked="checked" @click="checkAll"><span>全选</span>
			</div>
			<div class="footer-c fl">
				<div class="heji">合计：<span class="heji_num" v-html="length+' 件'"></span></div>
				<div class="zonge">总额：<span class="zonge_num" v-html="total"></span></div>
			</div>
			<div class="footer-r fr">
				<!-- <button disabled="disabled">去结算</button> -->
				<button @click='btnPay' class="jiesuan">去结算</button>
				<!-- <router-link :to="{name:'shoppingpay',params:{total:total}}" class="button" @click='btnPay'>去结算</router-link> -->
			</div>
		</footer>
	</div>
</template>

<script>
	import axios from 'axios';
	import http from '../../http/baseurl';
	export default{
		data(){
		    return {
		    	checked: true,
		    	dataset:[],
		    	datacar:[],
		    	length:'',
		    	total:'',
		    }
		},
		methods:{
			closeAd:function(e){
				e.target.parentNode.style.display="none";
			},
			// btnclick:function(){
			// 	this.$router.push({name:'shoppingpay'});
			// },
			btnSub:function(idx,price,e){
				var nb = e.path[1].childNodes[2];
				if(nb.value == 0){
					return;
				}
				nb.value --;
				this.datacar[idx].num--;
				this.total -= 1*price;
			},
			btnAdd:function(idx,price,e){
				// console.log(price)
				// console.log(e,e.path[1].childNodes[2])
				var nb = e.path[1].childNodes[2];
				this.datacar[idx].num++;
				nb.value ++;
				this.total += 1*price;

				// console.log((nb.value - 1)*price)
				// console.log(e.target.prevElementSibling);
				// e.target.prevElementSibling.value += 1;
				// console.log(((e.target).closest('.num')))
				// this.number +=1;
			},
			deleteGoods:function(id,idx,e){
				axios.get(
                http.url+'/shan',{
                params:{id:id}
	            }).then(res=>{
	                if(res.status){
	                	// console.log(res);
	                	e.target.closest('li').remove();
						this.total -= this.datacar[idx].price*this.datacar[idx].num;
						this.length--;
	                }
	            });
			},
			// checkGoods:function(index,price){
			// 	console.log(index,price);
			// 	// var checked = 1;
			// 	// if(checked){

			// 	// }
			// },
			//--------------修改input全选 单选--------------
			checkAll:function(e){
				//console.log($('.checkme'));
				$('.checkme').prop('checked',e.target.checked)
				$('.checkme').checked = e.target.checked;
				if(e.target.checked == false){
					this.length = 0;
					this.total = 0;
					$('.jiesuan').css('background','#ddd');
					$('.jiesuan').css('color','#000');
					$('.jiesuan').text('没有选择商品');
				}else{
					$('.jiesuan').css('background','#FC595A');
					$('.jiesuan').css('color','#fff');
					$('.jiesuan').text('去结算');
					axios.get(
		                http.url+'/carlist'
		            ).then(res=>{
		                // console.log(res)
		                // console.log(res.data.data.results);
		                var _result = res.data.data.results;
		                var _tot = 0;
		                for(var i=0;i<_result.length;i++){
		                	_tot += _result[i].price*_result[i].num;
		                }
		                // console.log(_tot)
		                this.datacar = _result;
		                this.length = _result.length;
		                this.total = _tot;
		            });
				}
			},
			cancleCheck:function(idx,e){
				console.log(idx,e.target);
				//console.log($('.checkme').length)
				$('.checkme').on('click',function(){
					var $checked = $('.checkme').filter(':checked');
					$('#checkAll1').prop('checked',$checked.length == $('.checkme').length);
				})
				$.each($('.checkme'),function(i,val){
					//console.log(i,val;
					if($('.checkme')[i].checked == false){
						$('#checkAll').checked = false;
					}
				})

				if(e.target.checked == false){
					this.total -= this.datacar[idx].price*this.datacar[idx].num;
					this.length--;
				}else{
					this.total += this.datacar[idx].price*this.datacar[idx].num;
					this.length++;
				}
			},
			goDetails:function(_id){
				// console.log(_id);
				location.href = "#/details?id="+_id;
			},
			//--------------修改input全选 单选--------------
			btnPay:function(e){
				// console.log(JSON.stringify(this.datacar));
				if(this.total == 0){
					return;
				}
				axios.get(http.url+'/orderin',{
					params:{order:JSON.stringify(this.datacar),total:this.total}

				}).then(res=>{
					console.log(res);
					console.log(res.data.data.results.insertId)
					var orderId = res.data.data.results.insertId;
					// console.log(this.datacar)
					this.$router.push({name:'shoppingpay',params:{total:this.total,id:orderId}});
				})
				//跳转到支付页面
				// this.$router.push({name:'shoppingpay',params:{total:this.total}});
			},
			back:function(){
				this.$router.push({name:'goodslist'});
			}
		},
       	beforeMount:function(){
			axios.get(
                http.url+'/carlist'
            ).then(res=>{
                // console.log(res)
                // console.log(res.data.data.results);
                var _result = res.data.data.results;
                var _tot = 0;

                for(var i=0;i<_result.length;i++){
                	_tot += _result[i].price*_result[i].num;
                }

                // console.log(_tot)
                this.datacar = _result;
                this.length = _result.length;
                this.total = _tot;
            });
		},
		mounted: function(){
            axios.get(
                http.url+'/list1'
            ).then(res=>{
                // this.dataset = res.data
                // console.log(res)
                var result = (res.data.data.results).splice(0,10);
                // console.log(result);
                this.dataset = result;
            })
       	}
	}
</script>

<style lang="scss" scoped>
	.all{
		height:100%;display:flex;flex-direction:column;
		header{
			display:flex;justify-content: space-between;line-height:1.146667rem;font-size:0.506667rem;background:#FAFAFA;
			.el-icon-back{line-height:1.146667rem;width:100px;text-align:center;font-size:0.66rem;}
			.edit{font-size:0.6rem;line-height:1.146667rem;margin-right:0.666667rem;}
		}
		.ad{
			display:flex;justify-content:space-around;height:0.666667rem;background:#EC595C;line-height:0.666667rem;color:#fff;
			p{font-size:0.333333rem;height:0.666667rem;line-height:0.666667rem;}
			i{font-size:0.32rem;line-height:0.666667rem;}
		}
		main{
			flex:1;overflow-x:hidden;background:#F4F4F4;margin-top:1%;
			.carlist{
				background:#fff;
				h3{
					height:1.12rem;line-height:1.12rem;font-size:0.346667rem;padding-left:5%;border-bottom:1px solid #ddd;
					i{margin-right:2%;}
				}
				ul{
					min-height:2rem;
					li{
						display:flex;justify-content:space-around;height:2.8rem;border-top:0.013333rem solid #ddd;border-bottom:0.013333rem solid #ddd;margin-bottom:0.15rem;font-size:0.5rem;
						.check{
							width:0.9rem;line-height:2.8rem;text-align:center;
							input{width:0.3rem;height:0.3rem;}
						}
						img{height:2.666667rem;}
						h4{font-size:0.35rem;line-height:0.45rem;}
						.price{font-size:0.35rem;line-height:0.8rem;color:#ED625F;}
						.price::before{content:"￥";}
						.num{
							margin-top:5%;
							input{width:30%;border:1px solid #ddd;text-align:center;}
							span{padding:0 5%;}
							.add{margin-left:-2%;}
						}
						.delete{
							width:20%;text-align:center;line-height:1.4rem;font-size:0.4rem;padding-top:0.8rem;
						}
					}
				}
			}
			.guess_like{
				.guess_like_title{
					height:1.146667rem;background:#F4F5F7 url(../../img/guess.jpg) repeat-x 0 center;
					h3{width:30%;height:100%;font-size:0.4rem;line-height:1.146667rem;text-align:center;margin:0 auto;background:#F4F5F7;}
				}
				.guess_like_list{
					display:flex;flex-wrap:wrap;overflow:hidden;
					li{
						width:49.5%;height:6.533333rem;background:#fff;margin-right:1%;margin-bottom:1%;font-size:0.266667rem;
						img{width:100%;}
						h3{padding-left:5%;}
						.price{padding-left:5%;margin-top:5%;color:#FF4554;}
						.price::before{content:"￥";}
					}
					li:nth-child(2n+2){margin-right:0;}
					li:nth-last-child(1){margin-bottom:0;}
					li:nth-last-child(2){margin-bottom:0;}
				}
			}
		}
		footer{
			height:1.28rem;border-top:1px solid #ddd;
			.footer-l{
				width:20%;margin-left:2.5%;font-size:0.386667rem;padding-top:0.4rem;line-height:1.28re;
				input{width:0.3rem;height:0.3rem;margin-right:5%;}
			}
			.footer-c{
				.heji,.zonge{height:0.62rem;line-height:0.62rem;font-weight:bold;}
				.heji{font-size:0.386667rem;}
				.zonge{
					font-size:0.38rem;
					.zonge_num{font-size:0.35rem;color:#FC595A;}
					.zonge_num::before{content:"￥";}
				}
			}
			.footer-r{
				width:28%;font-size:0.366667rem;line-height:1.266667rem;text-align:center;
				button{display:inline-block;width:100%;height:1.26rem;background:#FC595A;color:#fff;border:0 none;}
			}
		}
	}
</style>