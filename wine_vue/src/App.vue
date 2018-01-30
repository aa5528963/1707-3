<template>
  <div id="app">
    <router-view></router-view>
   
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
    }
  }
}
</script>

<style lang="scss">

html {
  font-size: 10px;
}
html,body,#app{
  height:100%;
}

*{
  margin: 0;
  padding: 0;
}

li {
  list-style: none;
}

a {
  text-decoration: none;
}

.fl{
    float:left;
}

.fr{
    float:right;  
}

.clearfix:after{
    content:"";
    display:blcok;
    height:0;
    clear:both;
    overflow:hidden;
    visibility:hidden;
    zoom:1;
}

*{box-sizing:border-box;padding: 0;margin: 0;}
</style>
