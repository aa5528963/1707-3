import Vue from 'vue';
//首字母大写,实例构造函数
import VueRouter from 'vue-router';

Vue.use(VueRouter);


import loginView from '../view/login/login.vue';
import registerView from '../view/register/register.vue';
import productView from '../view/product/product.vue';
import detailsView from '../view/details/details.vue';
import goodslistView from '../view/goodslist/goodslist.vue';

import homepageView from '../view/homepage/homepage.vue';
import bannerView from '../components/banner/banner.vue';
import checklistView from '../view/goodslist/checklist.vue';
import shoppingcarView from '../view/shoppingcar/shoppingcar.vue';
import shoppingpayView from '../view/shoppingpay/shoppingpay.vue';
import paymentView from '../view/payment/payment.vue';
import myorderView from '../view/myorder/myorder.vue';
import allorderView from '../view/allorder/allorder.vue';
import daifuView from '../view/daifu/daifu.vue';
import yifuView from '../view/yifu/yifu.vue';




const router = new VueRouter({
	routes: [
		{
			path: '/',
      		redirect: '/login'
		},
		{
			path: '/banner',
      		component:bannerView,
			name:'banner'
		},
		{
			path:'/login',
			component:loginView,
			name:'login'
		},
		{
			path:'/checklist',
			component:checklistView,
			name:'checklist'
		},
		{
			path:'/details',
			component:detailsView,
			name:'details'
		},
		{
			path:'/goodslist',
			component:goodslistView,
			name:'goodslist'
		},
		{
			path:'/register',
			component:registerView,
			name:'register'
		},
		{
			path:'/product',
			component:productView,
			name:'product'
		},
		{
			path:'/homepage',
			component:homepageView,
			name:'homepage'
		},
		{
			path:'*',
			redirect: '/login'
		},
		{
			path:'/shoppingcar',
			component:shoppingcarView,
			name:'shoppingcar'
		},
		{
			path:'/shoppingpay',
			component:shoppingpayView,
			name:'shoppingpay'
		},
		{
			path:'/payment',
			component:paymentView,
			name:'payment'
		},
		{
			path:'/myorder',
			component:myorderView,
			name:'myorder'
		},
		{
			path:'/allorder',
			component:allorderView,
			name:'allorder'
		},
		{
			path:'/daifu',
			component:daifuView,
			name:'daifu'
		},
		{
			path:'/yifu',
			component:yifuView,
			name:'yifu'
		}
	]
});
//本身就是实例就无需暴露对象,或者可以另外一种写法
export {router};

