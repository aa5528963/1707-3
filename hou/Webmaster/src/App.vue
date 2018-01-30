<template>
  <div id="app">
    <div class="head">
      <span class="title"><img src="./img/logo.png"/>{{msg}}</span>
      
    </div>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      msg: '酒仙网后台管理系统',
    }
  }

}
</script>

<style lang="scss">

html {
  font-size: 10px;
}

ul, li, a, h2 {
  margin: 0;
  padding: 0;
}

li {
  list-style: none;
}

a {
  text-decoration: none;
}
img{
  height:40px;
}
.head{

  color:#FFBB44;
  padding-left:30px;
  letter-spacing:3px;
  font-family:"STCaiyun",Georgia,Serif;
  border-bottom:2px solid #ccc;
  height:70px;
  font-size:28px;
  text-align:center;
  line-height: 70px;
  background-color:#2D2D2D;
  .exit{
    display:inline-block;
    float:right;
    height:70px;
    margin-right: 10px;
    font-size:16px;
  }
  a{
    display:inline-block;
    color:#fff;
    float:right;
    font-size:16px;

  }
  a:hover{color:red;}
}

</style>
