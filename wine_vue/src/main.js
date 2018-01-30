import Vue from 'vue'
import App from './App.vue'
import Vuex from 'vuex'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import swiper from 'swiper'
import qs from 'qs'
import querystring from 'querystring'
Vue.use(Vuex)
Vue.use(ElementUI)

// 引入MintUI
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'
Vue.use(MintUI)

import axios from 'axios'
Vue.prototype.$http = axios

//使用路由
import {router} from './router/index'; 
//使用vuex通信
import store from './store/index'


//使用重置样式
import 'normalize.css'

//全局使用jquery
import jQuery from 'jquery'
window.$ = jQuery

new Vue({
  el: '#app',
  //vue的路由属性
  router,
  store,
  components: { App },
  render: h => h(App)
});








