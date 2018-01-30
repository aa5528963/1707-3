<template>
	<div class="big" >
         <div class="title" >商品详情
             <div class="lefta" @click="tiaozhuan">＜</div>
             <div class="righta">≡</div>
         </div>
         <div class="two"><img src="../../img/goodslist.png" alt="" /></div>
         <div class="productList">
                <div class="shangpin">
                   <img :src="img" alt="" />
                   
                </div>
                <p class="name">{{name}}</p>
                <p class="duomai">多买多得<span>空</span>限量抢购</p>
                <p class="price">{{'￥'+price+'.00'}}</p>
                <p class="lingjuan">领卷 <span>满799减60</span><span>满499减35</span><span>满299减20</span></p>
                <p class="jinbi">金币 <span class="white">傻逼</span>赠送<span class="red">94</span>个金币</p>
                <div class="num">
                    <span class="shuliang">数量</span>
                    <span class="sub fl" @click="btnSub">-</span>
                    <input type="text"  v-model="num" />
                    
                    <span class="add" @click="btnAdd">+</span>
                </div>
                <p class="song">送至<span>空</span>广东省<span>空</span>广州市<span>空</span>天河区</p>
                <p class="song">提示<span>空</span>此商品不能使用优惠券</p>
                <p class="ping">商品评价<span class="xiao">(27373人评价)</span><span class="kong">(27373人评价wqfq)</span>好评度<span class="red">97%</span></p>
                <ul class="pingjia">
                    <li>
                    <p><span class="red">★★★★★</span><span class="kong">空hongfhqwhfqiewhfqqfwep</span>2018-01-19 </p>
                    <p>挺好喝，千杯不倒</p>
                    <img src="../../img/1.jpg" alt="" />
                       
                    </li>
                    <li>
                    <p><span class="red">★★★★★</span><span class="kong">空hongfhqwhfqiewhfqqfwep</span>2018-01-18 </p>
                    <p>很好……………包装给力，送货快</p>
                    <img src="../../img/2.jpg" alt="" />
                       
                    </li>
                    <li>
                    <p><span class="red">★★★★★</span><span class="kong">空hongfhqwhfqiewhfqqfwep</span>2018-01-13 </p>
                    <p>一直看特曲，基本作为赠品出现</p>
                    <img src="../../img/3.jpg" alt="" />
                       
                    </li>
                    <li>
                    <p><span class="red">★★★★★</span><span class="kong">qewqcewqcwqcwqqqqqqq</span>2018-01-10 </p>
                    <p>朋友都说好喝，我就试试，果然不错</p>
                    <img src="../../img/4.jpg" alt="" />
                       
                    </li>
                    <li>
                    <p><span class="red">★★★★★</span><span class="kong">空hongfhqwhfqiewhfqqfwep</span>2018-01-09 </p>
                    <p>味道特浓，特有劲，给你点个赞！</p>
                    <img src="../../img/5.jpg" alt="" />
                       
                    </li>
                    

               </ul>
               <p class="tishi">温馨提示</p>
               <p class="tishi2"><span class="kong" >空空</span>

根据新修订的《商标法》及国家工商总局最新文件要求，2014年5月1日之后不得将“驰名商标”字样用于商品宣传，酒仙网依法对商品图片中含“驰名商标”字样做马赛克处理；同时，涉及厂家正在按照新规定逐步更换包装，在此期间，我们将对新旧包装货品随机发货，请以实际收到的货物为准。给您带来的不便，敬请谅解。</p>
                <img src="../../img/data1.png" alt="" class="img3"/>
                <img src="../../img/data2.png" alt=""  class="img3"/>

         </div>
         
          <footer>
            <ul>
                <li>
                    <img src="src/img/01.png"  @click="gohomepage">
                </li>
                <li>
                    <img src="src/img/02.png" >
                  
                </li>
                <li class="gocar">
                    <img src="src/img/03.png" @click="gocar">
                    <div>{{num2}}</div>
                </li>
               
                <li  class="jiaru" @click="go"
                >
                   加入购物车 
                </li>
                <li class="liji" @click="gologin">立即购买</li>
            </ul>
            <div class="yin">加入购物车成功</div>
        </footer>

        
    </div>
</template>

<script>
    import axios from 'axios'
    import http from '../../http/baseurl';
	export default{
		data(){
            return {
                
                dataset:[],
                img:'',
                name:'',
                price:'',
                num:1,
                id:'',
                num2:0

            }
        },
       methods: {
             tiaozhuan:function(){
                
                 this.$router.push({name:'goodslist'});
                
            },
            
            btnSub:function(){
               
                if(this.num == 0){
                    return;
                }
                
                this.num--;
                
            },
            btnAdd:function(){
            this.num++;
           
            },
            go:function(){
             axios.get(http.url+'/car',{params:{goid:this.id,goprice:this.price,qty:this.num,goname:this.name,goimg:this.img}}
                ).then(res=>{
                 //   console.log(res)
               });
            
            this.num2++;
           
            
            },
            gologin:function(){
              
           
             this.$router.push({name:'login'});
           },
           gocar:function(){
              
                this.$router.push({name:'shoppingcar'});
                

           },
           gohomepage:function(){
              
            
             this.$router.push({name:'homepage'});
           }
           
        

               
        },
        beforeMount:function(){
              
        
        var self=this
        var attr = location.hash.split("=");
         console.log(location.hash)//得到#/details?id=1
        console.log(attr)//得到["#/details?id", "1"]
             var id = attr[1];
              //console.log(id);
             axios.get(http.url+'/de',{params:{id:id}}
            ).then(res=>{
              //  console.log(res)
                //console.log(res.data.data.results[0])
                var aa=res.data.data.results[0];


               self.img=aa.imgurl;
               self.name=aa.name;
               self.price=aa.oprice;
               self.id=aa.id;
               
              

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
       .productList{overflow-x:hidden;flex:1;font-size:0.4rem;
             .shangpin{position:relative;height:8rem;
                img{width:80%;position:absolute;left:10%;}

            }
            .name{line-height:0.8rem;}
            .duomai{color:red;
                    span{opacity:0;}
            }
            .price{color:red;line-height:0.8rem;font-weight:bold;}
            .lingjuan{line-height:1rem;border-top:0.2rem solid #F0F0E1;border-bottom:0.2rem solid #F0F0E1;
            span{background:#FF7373;margin-left:0.4rem;}
            }
            .jinbi{line-height:1rem;border-bottom:0.2rem solid #F0F0E1;
                .white{color:white;}
                .red{color:red;}
            }
           .num{position:relative;height:0.8rem;
                        input{width:10%;border:1px solid #ddd;text-align:center;position:absolute;left:2.5rem;}
                        .shuliang{position:absolute;left:0;}
                        .sub{position:absolute;left:1.5rem;}
                        span{padding:0 5%;}
                        .add{margin-left:-2%;position:absolute;left:3.5rem;}


             }
             .song{line-height:0.6rem;
                            span{opacity:0;}
                        }
           .ping{line-height:0.6rem;background:orange;
              .xiao{font-size:0.35rem;}
              .kong{opacity:0;}
              .red{color:red;}
           }
           .pingjia{ font-size:0.36rem;
                li{border-bottom:0.02rem solid #ccc;}
                .red{color:red;}
                .kong{opacity:0;}
               img{width:25%;}
           }
           .tishi{line-height:1rem;background:#ccc;
                .kong{opacity:0;}
           }
            .tishi2{font-size:0.33rem;
                .kong{opacity:0;}
           }
           .img3{width:100%;}


 
            
                  
       }
     
     footer{position:relative;height:1.05rem;border-top:0.03rem solid #ccc;
            ul{
                display:flex;justify-content:space-around;text-align:center;height:100%;
                li{display:flex;flex-direction:column;text-align:center;width:20%;
                    img{width:1.2rem;}
                   
                }
                .gocar{position:relative;
                        div{position:absolute;left:0.8rem;top:0.1rem;font-size:0.35rem;background:red;width:0.6rem;height:0.4rem;border-radius:40%;color:white;}

                }
                .jiaru{font-size:0.4rem;background:red;line-height:1rem;color:white;;margin:0;}
                .liji{font-size:0.4rem;background:#3C3F51;line-height:1rem;color:white;margin:0;}
            }
            .yin{position:absolute;left:50%;top:-1.2rem;width:4rem;height:0.8rem;border-radius:0.4rem;margin-left:-2rem;background:#FFDFBF;font-size:0.4rem;text-align:center;line-height:0.8rem;color:black;display:none;}
        }
       
   }
</style>