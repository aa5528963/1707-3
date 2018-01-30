import Vue from 'vue';
//首字母大写,实例构造函数
import VueRouter from 'vue-router';

Vue.use(VueRouter);


import loginView from '../view/login/login.vue';
import registerView from '../view/register/register.vue';
import user from '../view/user/user.vue';
import goods from '../view/goods/goods.vue';
import order from '../view/order/order.vue';
import handle from '../view/handle/handle.vue';


const router = new VueRouter({
	routes: [
		{
			path: '/',
      		redirect: '/login'
		},
		{
			path:'/login',
			component:loginView,
			name:'login'
		},
		{
			path:'/register',
			component:registerView,
			name:'register'
		},
		
		{
			path:'/'
		},
		{
			path:'*',
			redirect: '/login'
		},
		{
			path:'/user',
			component:user,
			name:'user'
		},
		{
			path:'/goods',
			component:goods,
			name:'goods'
		},
		{
			path:'/order',
			component:order,
			name:'order'
		},
		{
			path:'/handle',
			component:handle,
			name:'handle'
		}
	]
});
//本身就是实例就无需暴露对象,或者可以另外一种写法
// export {router};
export default router;

