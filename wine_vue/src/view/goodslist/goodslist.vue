<template>
	<div class="big">
         <div class="title"  @click="daoding">
             <div class="lefta"  @click.stop="gohomepage">＜</div>
            <div v-text='jiu'></div>
             <div class="righta">≡</div>
         </div>
         <div class="two">
         <ul>
         <li>综合</li>
         <li>数量</li>
         <li>价格<span class="red shang" @click="shang">↑</span><span class="red xia" @click="xia">↓</span></li>
         <li>卐</li>
         </ul>
         </div>
         <ul class="productList">
                    <li v-for="(item, index) in dataset" :key="item.id" @click='turnTo(dataset[index].id)'>
                        
                        <div class="img"><img :src="item.imgurl"></div>
                        <div class="jiuname">
                            <p class="jiuname2">{{item.name}}</p>
                            <span class="xianshi">限时抢购</span>
                            <p class="price">{{'￥'+item.nprice+'.00'}}</p>
                            
                            
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
                
                dataset:[],
                jiu:'白酒馆'
               
            }

        },
      methods:{
           turnTo:function(productID){
              // this.$router.push({name:'details',
              // params:{productID:productID}});
               //alert(dataset[idx])
           // console.log(productID)
            location.href = "#/details?id="+productID;

           },
            gohomepage:function(){
              
             this.$router.push({name:'homepage'});

           },
           daoding:function(){
           var ul=$('.productList')
            ul.animate({scrollTop:0}, 500);
           
      
            console.log(ul)
           },
           shang:function(){
             axios.get(
                http.url+'/sortgoods',{params:{way:'asc'}}

            ).then(res=>{

               
                this.dataset = res.data
                 console.log(res)
                var result = (res.data.data.results).splice(0,18);
                 console.log(result);
                this.dataset = result;
            })
           },
           xia:function(){
              axios.get(
                http.url+'/sortgoods',{params:{way:'desc'}}

            ).then(res=>{

               
                this.dataset = res.data
                 console.log(res)
                var result = (res.data.data.results).splice(0,18);
                 console.log(result);
                this.dataset = result;
            })
           }

        },
        mounted: function(){
            axios.get(
                http.url+'/list1'
            ).then(res=>{

                this.dataset = res.data
                 console.log(res)
                var results = res.data.data.results
                var resultwhite = results.filter(function(item){
                  return item.title=="白酒"
                })
                var resultputao = results.filter(function(item){
                  return item.title=="葡萄酒"
                })
                var resultyang = results.filter(function(item){
                  return item.title=="洋酒"
                })
                

                 
                var attr = location.hash.split("=");
                console.log(attr);
                var jiuname = attr[1];
                console.log(jiuname)
                if(jiuname =='white'){
                this.dataset = resultwhite;
                this.jiu='白酒馆';
                }else if(jiuname =='putao'){
                this.dataset = resultputao;
                 this.jiu='葡萄酒馆';
                }else if(jiuname =='yang'){
                this.dataset = resultyang;
                 this.jiu='洋酒馆';
                }
                else {
                this.dataset = resultyang;
                 this.jiu='洋酒馆';
                }
                
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
       .two{height:0.9rem;border-bottom:0.03rem solid #ccc;
          li{list-style:none;float:left;font-size:0.5rem;width:25%;text-align: center;line-height:0.9rem;
            .red{color:red;padding:0 0.1rem;}
          }
       }
       .productList{overflow-x:hidden;flex:1;
             li{height:3.5rem;border-bottom:0.03rem solid #ccc;
                .img{width:50%;float:left;height:100%;
                     img{height:3.4rem;}
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