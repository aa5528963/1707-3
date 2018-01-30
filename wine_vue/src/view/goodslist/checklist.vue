<template>
    <div class="big">
         <div class="title">搜索结果
             <div class="lefta"  @click="gohomepage">＜</div>
             <div class="righta">≡</div>
         </div>
         <div class="two"><img src="../../img/goodslist.png" alt="" /></div>
         <ul class="productList">
                    <li v-for="(item, index) in dataset" :key="item.id" @click='turnTo(dataset[index].id)'>
                        
                        <div class="img"><img :src="item.imgurl"></div>
                        <div class="jiuname">
                            <p class="jiuname2">{{item.name}}</p>
                            <span class="xianshi">限时抢购</span>
                            <p class="price">{{'￥'+item.oprice+'.00'}}</p>
                            
                        </div>
                       
                    </li>
        </ul>
    </div>
</template>

<script>
    import axios from 'axios'
    import http from '../../http/baseurl';
    export default{
        data(){
            return {
                
                dataset:[]
               
            }
        },
      methods:{//在页面加载的时候就会条用这个方法，和html中的window.load...有点像
           turnTo:function(productID){
              // this.$router.push({name:'details',
              // params:{productID:productID}});
               //alert(dataset[idx])
           // console.log(productID)
            location.href = "#/details?id="+productID;

           },
            gohomepage:function(){
              
            location.href = "#/homepage";

           }
        },
        mounted: function(){
            var name = decodeURI(location.hash.split('=')[1]);
            

            
            axios.get(
                http.url+'/list2',{params:{name:name}}

            ).then(res=>{
                this.dataset = res.data
                 //console.log(res)
                var result = (res.data.data.results).splice(0,18);
                 //console.log(result);
                this.dataset = result;
            })
       }
       
          
       
    }
</script>

<style lang="scss" scoped>
   .big{display:flex;flex-direction:column;height:100%;
        .title{color:white;background:red;text-align:center;font-size:0.6rem;line-height: 1rem;height:1rem;position:relative;
                .lefta{position:absolute;left:0.4rem;top:0;font-size:0.9rem;}
                .righta{position:absolute;right:0.5rem;top:0;font-size:0.9rem;}
         }
       .two{height:1rem;
            img{width:100%;}
       }
       .productList{overflow-x:hidden;flex:1;
             li{height:3.5rem;border-bottom:1px solid #ccc;
                .img{width:50%;float:left;height:100%;
                     img{width:70%}
                }
                .jiuname{width:50%;float:left;height:100%;
                        .jiuname2{font-size:0.4rem;}
                        .xianshi{background:orange;font-size:0.4rem;}
                        .price{color:red;font-size:0.5rem;}
                }
                
                  
               
             } 
                  
       }

       
   }
  
   
  
</style>