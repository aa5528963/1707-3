<template>
	<div>
		<banner></banner>
		<ul class="bigbox">
			<li class="gty">
				<div class="showPic">
					<a href="#"><img src="../../assets/gty/gty.jpg" alt="" /></a>
				</div>
				<ul>
					<li>
						<a href="#"><img src="../../assets/gty/cjy.jpg" alt="" /></a>
					</li>
					<li>
						<a href="#"><img src="../../assets/gty/gny.jpg" alt="" /></a>
					</li>
					<li>
						<a href="#"><img src="../../assets/gty/zby.jpg" alt="" /></a>
					</li>
					<li>
						<a href="#"><img src="../../assets/gty/gat.jpg" alt="" /></a>
					</li>
				</ul>
			</li>
			<li>
				<ul class="sec">
					<li>
						<a href="#"><img src="../../assets/gty/cjy.jpg" alt="" /></a>
					</li>
					<li>
						<a href="#"><img src="../../assets/gty/gny.jpg" alt="" /></a>
					</li>
					<li>
						<a href="#"><img src="../../assets/gty/zby.jpg" alt="" /></a>
					</li>
					<li>
						<a href="#"><img src="../../assets/gty/gat.jpg" alt="" /></a>
					</li>
					<li>
						<a href="#"><img src="../../assets/gty/zby.jpg" alt="" /></a>
					</li>
					<li>
						<a href="#"><img src="../../assets/gty/gat.jpg" alt="" /></a>
					</li>
				</ul>
			</li>
			<li>
				<ul class="sec">
					<li>
						<a href="#"><img src="../../assets/qz/qz.jpg" alt="" /></a>
					</li>
					<li>
						<a href="#"><img src="../../assets/qz/pj.jpg" alt="" /></a>
					</li>
					<li>
						<a href="#"><img src="../../assets/qz/yl.jpg" alt="" /></a>
					</li>
				</ul>
			</li>
		</ul>
		<bottombar></bottombar>
	</div>
	
</template>

<script>
	import banner from '../../components/banner/banner.vue'
	import bottombar from '../../components/bottombar/bottombar.vue'

	export default {
		name:'product',
		data(){
			return {
				num : 0
			}
		},
		components :{
			banner,
			bottombar
		},
		methods : {
			
		},
		
	}
</script>

<style lang="scss" scoped>
	.bigbox{
		width:100% ;
		margin:0.5rem;
		.gty{
			display:flex;
			justify-content:space-around;
			.showPic{
				width: 33%;
				img{
					width: 100%;
				}
			}

			ul{
				flex:1;
				display: flex;
				flex-wrap: wrap;
				justify-content: space-around;
				li{
					width:49%;
					img{
						width:100%;
					}
				}
			}
		}
		.sec{
			display: flex;
			flex-wrap: wrap;
			justify-content: space-around;
			li{
				width: 33%;
				img{
					width: 100%;
				}				
			}
		}
	}
	
</style>