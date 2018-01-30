<template>
	<div>
		<h2>这是一个datagrid</h2>
	</div>
</template>

<script>

	
	export default {
		//数据组件
		name:'datagridComponent',
		data(){
			return {
				dataset:[]
			}
		},
		mounted(){
			console.log($('body'));
		}
	}
	
	
</script>