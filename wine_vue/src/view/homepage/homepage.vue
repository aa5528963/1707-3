<template>
    <div class="all">
        <p class="el-icon-upload2"></p>
        <header>
            <p>
            target
                <i class="el-icon-printer"></i>
                <span @click="register">注册</span>
            </p>
            <el-input class="input" id="input" placeholder="请输入内容" prefix-icon="el-icon-search" clearable v-model="text" @input="blurs" >
            </el-input>
            <div id="search" >
            </div>
            <p>
                <i class="el-icon-message"></i>
                <span>消息</span>
            </p>
        </header>  
        <main>
            <mt-swipe :auto="4000" class="banner" @click.native="evt($event)">
                <mt-swipe-item>
                    <img src="../../img/banner01.jpg" alt="" data-guid="g01"/>
                </mt-swipe-item>
                <mt-swipe-item>
                    <img src="../../img/banner02.jpg" alt="" data-guid="g02"/>
                </mt-swipe-item>
                <mt-swipe-item>
                    <img src="../../img/banner03.jpg" alt="" data-guid="g03"/>
                </mt-swipe-item>
                <mt-swipe-item>
                    <img src="../../img/banner04.jpg" alt="" data-guid="g04"/>
                </mt-swipe-item>
            </mt-swipe>
            <div class="logo" @click="evt($event)">
                <img src="../../img/logo1.jpg" alt="" class="a" data-guid="g01"/>
                <img src="../../img/logo2.jpg" alt="" class="b" data-guid="g02"/>
                <img src="../../img/logo3.jpg" alt="" class="c" data-guid="g03"/>
                <img src="../../img/logo4.jpg" alt="" data-guid="g04"/>
                <img src="../../img/logo5.jpg" alt="" data-guid="g01"/>
                <img src="../../img/logo6.jpg" alt="" data-guid="g02"/>
                <img src="../../img/logo7.jpg" alt="" data-guid="g03"/>
                <img src="../../img/logo8.jpg" alt="" data-guid="g04"/>
                <img src="../../img/logo9.jpg" alt="" data-guid="g01"/>
                <img src="../../img/logo10.jpg" alt="" data-guid="g02"/>
            </div>
            <img src="../../img/bimg.jpg" class="bigimg" alt="" />
            <div class="title">
                <img src="../../img/title.jpg"alt="" />
                <p>
                    <mt-swipe :show-indicators="false">
                        <mt-swipe-item>年货主会场 9.9元秒6瓶美酒</mt-swipe-item>
                        <mt-swipe-item>APP首单满一百100送100活动规则点击...</mt-swipe-item>
                        <mt-swipe-item>白洒全场五折起买得多送得多...</mt-swipe-item>
                    </mt-swipe>
                </p>
            </div>
            <mt-header title="" class="time">
                <router-link to="/" slot="left">
                    <mt-button>掌上秒拍</mt-button>
                </router-link>
                <mt-button  slot="right">
                    <span>更多决口等你来</span>
                    <span class="el-icon-arrow-right"></span>
                </mt-button>
            </mt-header>
            <ul class="first" @click="target($event)">
                <li v-for="item in list" :key="item.id" :data-id="item.id">
                    <img :src="item.imgurl" alt="" />
                    <span>{{item.name}} ￥{{item.nprice}} {{item.title}}</span>
                </li>
            </ul>
            <mt-swipe :show-indicators="false" class="bigban" @click.native="evt($event)">
                <mt-swipe-item>
                    <img src="../../img/a1.jpg" alt="" data-guid='g01'/>
                </mt-swipe-item>
                <mt-swipe-item>
                    <img src="../../img/a2.jpg" alt="" data-guid='g02'/>
                </mt-swipe-item>
                <mt-swipe-item>
                    <img src="../../img/a3.jpg" alt="" data-guid='g03'/>
                </mt-swipe-item>
            </mt-swipe>
            <div class="firstTitle" @click="evt($event)">
                <img src="../../img/title01.jpg" alt="" data-guid='g01'/>
                <img src="../../img/ping01.jpg" alt="" class="ping" data-guid='g02'/>
                <img src="../../img/ping02.jpg" alt="" class="ping" data-guid='g03'/>
                <img src="../../img/ping03.jpg" alt="" class="ping01" data-guid='g04'/>
                <img src="../../img/ping04.jpg" alt="" class="ping01" data-guid='g01'/>
                <img src="../../img/ping05.jpg" alt="" class="ping01" data-guid='g02'/>
            </div>
            <ul class="logos" @click="evt($event)">
                <li v-for="(item,index) in logo">
                    <img :src="item.img" alt="" :data-guid="`g0${index}`"/>
                </li>
            </ul>
            <div class="b01">
                <img src="../../img/title02.jpg" alt="" class="title02"/>
                <img src="../../img/b01.jpg" alt="" class="b02"/>
                <img src="../../img/b02.jpg" alt="" class="b02"/>
                <img src="../../img/b03.jpg" alt="" class="b02"/>
            </div>
            <mt-swipe :show-indicators="false" class="bigban">
                <mt-swipe-item>
                    <img src="../../img/g01.jpg" alt="" />
                </mt-swipe-item>
                <mt-swipe-item>
                    <img src="../../img/g02.jpg" alt="" />
                </mt-swipe-item>
                <mt-swipe-item>
                    <img src="../../img/g03.jpg" alt="" />
                </mt-swipe-item>
                <mt-swipe-item>
                    <img src="../../img/g04.jpg" alt="" />
                </mt-swipe-item>
                <mt-swipe-item>
                    <img src="../../img/g05.jpg" alt="" />
                </mt-swipe-item>
                <mt-swipe-item>
                    <img src="../../img/g06.jpg" alt="" />
                </mt-swipe-item>
            </mt-swipe>
            <img src="../../img/title03.jpg" alt="" class="title03"/>
            <dl class="goods" @click="target($event)">
                <dt v-for="item in datalist" :key="item.id" :data-id="item.id">
                    <img :src="item.imgurl" alt="" />
                    <span>{{item.name}} ￥{{item.nprice}} {{item.title}}</span>
                </dt>
            </dl>
            <dl class="goods" @click="target($event)"
                v-infinite-scroll="loadMore"
                infinite-scroll-disabled="loading"
                infinite-scroll-distance="10">
                <dt v-for="item in lists" :key="item.id" :data-id="item.id">
                    <img :src="item.imgurl" alt="" />
                    <span>{{item.name}} {{item.nprice}} {{item.title}}</span>
                </dt>
            </dl>
        </main>
        <footer>
            <ul>
                <li>
                    <img src="../../img/01.png" height="58" width="70" alt="" class="img homepage"/>
                </li>
                <li @click="goFenlei">
                    <img src="../../img/02.png" height="58" width="70" alt="" class="img"/>
                </li>
                <li>
                    <img src="../../img/c.png" height="58" width="70" alt="" />
                </li>
                <li @click="goCar">
                    <img src="../../img/03.png" height="58" width="70" alt="" class="img"/>
                </li>
                <li @click="goMy">
                    <img src="../../img/04.png" height="58" width="70" alt="" class="img"/>
                </li>
            </ul>
        </footer>
    </div>
</template>
<script>
    import { Header } from 'mint-ui';
    import axios from 'axios';
    import http from '../../http/baseurl';
    var times;
    import a from '../../img/logos01.jpg';
    import b from '../../img/logos02.jpg';
    import c from '../../img/logos03.jpg';
    import d from '../../img/logos04.jpg';
    import e from '../../img/logos05.jpg';
    import f from '../../img/logos06.jpg';
    import g from '../../img/logos07.jpg';
    import h from '../../img/logos08.jpg';
    import i from '../../img/logos09.jpg';
    import j from '../../img/logos10.jpg';
    import k from '../../img/logos12.jpg';
    import l from '../../img/logos13.jpg';
    import m from '../../img/logos14.jpg';
    
    import { InfiniteScroll } from 'mint-ui';
    import { Indicator } from 'mint-ui';
    export default {
            name: 'homepage',
            data() {
                return {
                    text:'',
                    result:null,
                    sear:null,
                    data:[],
                    datalist:[],
                    list:[],
                    lists:[],
                    logo:[{img:a},{img:b},{img:c},{img:d},{img:e},{img:f},{img:g},{img:h},{img:i},{img:j},{img:k},{img:l},{img:m}],
                    scrool:''
                }
            },
            methods:{
                // details(){
                //     var targetid=event.path[0].parentNode.getAttribute('data-id');
                //     console.log(targetid);

                // },
                target(event){
                    // details
                    var id = event.path[0].parentNode.getAttribute('data-id');
                    console.log(666);
                    // this.$router.push({name:'details',params:{id:id}})
                    location.href='#/details?id='+id;
                },

                evt(event){
                    //获取点击对象   
                    // console.log(event.path[0].getAttribute('data-guid'));
                    var id=event.path[0].getAttribute('data-guid');
                    if(id=='g01'||id=='g04'||id=='g07'){
                        location.href='#/goodslist?name=white';
                        // this.$router.push({name:'goodslist'});
                    }else if(id=='g02'||id=='g05'||id=='g08'){
                        location.href='#/goodslist?name=putao';
                        // this.$router.push({name:'goodslistputao'});
                    }else if(id=='g03'||id=='g06'||id=='g09'){
                        location.href='#/goodslist?name=yang';
                        // this.$router.push({name:'goodslistred'});
                    }
                    
                },
                
                blurs(){
                    this.result = this.text;
                    this.sear = document.querySelector('#search');
                    var div =document.createElement('div');
                    this.sear.style.display='block';
                    axios.get(http.url+'/data', 
                        {params:{data: this.result}}).then(response => {
                        var date = response.data.data.results;
                        this.search = date;
                        this.sear.innerText='';
                        console.log(this.search[0])
                        if(this.search[0]!=undefined){
                             var a = this.search[0].title;
                                var p = document.createElement('p')
                                p.innerText=a;
                                div.appendChild(p);
                               
                                p.classList.add("pp");
                            for(var i=0;i<4;i++){
                                var a = this.search[i].name;
                                var p = document.createElement('p')
                                p.innerText=a;
                                div.appendChild(p);
                               
                                p.classList.add("pp");
                                
                                
                            }
                            this.sear.appendChild(div);
                            console.log($('#search'))
                            $('#search').on('click','.pp',function(){
                                console.log($(this))
                                 var name = $(this).text();

                                 console.log(name)
                                 location.href=`#/checklist?name=${name}`
                               
                            })
                        }else{
                            var p =document.createElement('p');
                            p.innerText='没有找到对应的内容'
                            this.sear.appendChild(p);
                            console.log(666);
                        }

                    })
                },
                
                goFenlei:function(){
                    this.$router.push({name:'goodslist'});
                },
                goCar:function(){
                    this.$router.push({name:'shoppingcar'});
                },
                 goMy:function(){
                    this.$router.push({name:'myorder'});
                },
                register(){
                    this.$router.push({name:'register'});
                },
                loadMore() {
                    this.loading = true;
                    let num = 10;
                    let number='';
                    let add=setTimeout(() => {
                        let last = this.lists[this.lists.length - 1];
                        for (let i = 1; i <= 10; i++) {
                            num+=1
                            number=num+10
                            axios.get(http.url+'/list1').then(response => {
                                // console.log(response.data.data.results);
                                this.data=response.data.data.results
                                this.lists = this.data.splice(num,number);
                            });
                            this.lists.push(last + i);
                            if(last>=this.lists.length){
                                setInterval(add);
                            }
                        }
                        this.loading = false;
                    }, 2500);
                }
            },
            mounted:function(){
                axios.get(http.url+'/list1').then(response => {
                    this.data=response.data.data.results
                    this.list = this.data.splice(0,5);
                    this.lists = this.data.splice(0,6);
                    this.datalist = this.data.splice(0,10);
                    console.log(this.datalist);
                });
                var span = $('.mint-header-title');
                var end=Date.parse("2018/1/28/10:04")
                var timers=setInterval(timer,1000);
                function timer(){
                    var time=new Date;
                    var now=time.getTime();
                    var offset=Math.floor((end-now)/1000)

                    var seconds=Math.floor(offset%60);
                    seconds=(seconds<10? '0' : '')+seconds;

                    var minutes=Math.floor(offset/60)%60;
                    minutes=(minutes<10? '0' : '')+minutes;

                    var hours=Math.floor(offset/60/60)%24;
                    hours=(hours<10? '0' : '')+hours;

                    var day=Math.floor(offset/60/60/24);

                    span[0].innerText='距活动结束'+day+'天'+hours+'小时'+minutes+'分'+seconds+'秒';
                    if(offset<=0){
                        clearInterval(timers);
                    }
                }


            }
        }
</script>
<style lang="scss" scoped>
.el-icon-upload2{height: 80px;width: 80px;position:absolute;bottom: 200px;right: 20px;background: skyblue;text-align:center;line-height: 80px;border-radius:50%;z-index:2000;font-size:50px;}
*{
     padding:0;
     margin:0;
     font-size:0.32rem;
}
 .all{
     height:100%;
     display:flex;
     flex-direction:column;
     background:#F4F5F7;
}
 header{
     height:1.3333333333333333rem;
     width: 100%;
     display:flex;
     justify-content:space-around;
     padding-top: 0.29333333333333333rem;
     position: relative;
     top:0;
     left: 0;
     background: #584234;
     color: #fff;
     position:relative;
}
 header p{
     display:flex;
     flex-direction:column;
     text-align: center;
}
 header p i{
     font-size: 0.5333333333333333rem;
}
 header .input{
     width:6.666666666666667rem;
     height: 0.5333333333333333rem;
     margin-top: 0.08rem;
}
 header #search{
     position: absolute;
     border:1px solid #ccc;
     width:66.69%;
     left:50%;
     transform:translateX(-50%);
     top:0.9066666666666666rem;
     z-index:1000;
     background: #fff;
     color: #000;
     display:none;
}
 header #search p{
     text-align:left;
     line-height:0.5333333rem;
     height:0.1333333rem;
     background: #000;
     z-index:1000;
     padding:0.04rem;
}
 main{
     flex:1;
     overflow-x: hidden;
}
 main ul{
     width: 100%;
}
 main .logo{
     display:flex;
     flex-wrap:wrap;
}
 main .logo img{
     width: 20%;
     height:2.4rem;
}
 main .banner{
     height: 4rem;
}
 main .banner img{
     height: 4rem;
     width: 100%;
}
 main .bigimg{
     height: 2.6666666666666665rem;
     width: 100%;
}
 main .title img{
     height: 0.8rem;
     width: 30%;
     float: left;
}
 main .title p{
     height: 0.8rem;
     float: left;
     width: 66%;
     line-height: 0.8rem;
     padding-left: 0.5333333333333333rem;
     box-sizing:border-box;
}
 main .time{
     background: #fff;
     color: #000;
     height: 0.8rem;
     margin: 0.13333333333333333rem 0;
     line-height: 0.8rem;
}
 main .time .mint-header-title{
     font-size: 0.26666666666666666rem;
}
 main .first{
     width: 100%;
     overflow-y:hidden;
     height: 5.333333333333333rem;
}
 main .first li{
     height: 5.333333333333333rem;
     width: 3.3333333333333335rem;
     background: #fff;
     position: relative;
}
 main .first li img{
     height: 2.933333333333333rem;
     width: 3.3333333333333335rem;
}
 main .first li::before{
     content:'';
     height: 0.4rem;
     width: 100%;
     background: #fff;
     position: absolute;
     bottom: 0;
}
 main .bigban{
     height: 2.48rem;
}
 main .bigban img{
     width: 100%;
}
 main .firstTitle img{
     width: 100%;
}
 main .firstTitle .ping{
     height: 2.6666666666666665rem;
     width: 49%;
     display: inline-block;
}
 main .firstTitle .ping01{
     height: 2.6666666666666665rem;
     width: 32.7%;
     display: inline-block;
}
 main .logos{
     overflow-y: hidden;
     height: 2.4rem;
     background: #fff;
}
 main .logos li img{
     float: left;
     height: 1.8666666666666667rem;
     width: 1.8666666666666667rem;
     margin: 0 0.02666666666666667rem;
}
 main .title02{
     width: 100%;
}
 main .b01{
     position: relative;
     padding-top: 0.8rem;
     height: 6.666666666666667rem;
     width: 100%;
}
 main .title02{
     position: absolute;
     top: -0.29333333333333333rem;
}
 main .b01 .b02{
     width: 50%;
     float: left;
}
 main .b01 .b02:nth-child(2),main .b01 .b02:nth-child(3){
     margin: 0.18666666666666668rem 0;
}
 main .title03{
     width: 100%;
     margin-top: 0.21333333333333335rem;
}
 main .goods{
     height: 12rem;
}
 main .goods dt{
     width: 49%;
     height: 5.333333333333333rem;
     float: left;
     background: #fff;
     padding: 0 0.05333333333333334rem;
     box-sizing:border-box;
     text-align: center;
}
 main .goods dt img{
     height: 4rem;
     width:100%;
}
 footer{
     height:1.4666666666666666rem;
}
 ul{
     display:flex;
     justify-content:space-around;
     text-align: center;
     height: 100%;
     padding-top:0.13333333333333333rem;
}
 li{
     display:flex;
     flex-direction:column;
     text-align: center;
     img{
         height:1.0666666666666667rem;
         width:1.2rem;
    }
}
// .mint-header-title{
//     font-size:16px;
// }

</style>



