<template>
	<div class="bottomBar">
		<ul>
			<li>首页</li>
			<li>行程</li>
			<li>支付</li>
			<li>我的</li>
		</ul>
	</div>
</template>

<script>
	export default{
		
	}
</script>

<style lang="scss" scoped>
	.bottomBar{
		max-width: 100%;
		height: 5.1rem;
		position: fixed;
		left:0;
		bottom:0;
		right:0;
		ul{
			max-width: 100%;
			display:flex;
			li{
				flex:1;
				text-align: center;
				line-height: 5.1rem;
			}
		}
	}
</style>