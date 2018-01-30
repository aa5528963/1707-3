var db = require('../db/db')


module.exports = {
    register : function(app){
        // 详情页申请数据
        app.get('/de',function(req,res){
            console.log(req.query);
            var _id = req.query.id;
            var sql = `select * from list where id = ${_id}`;
            db.select(sql,function(data){
                res.send(data);
            });
        }),
       // // 获取订单数据
        app.get('/order',function(req,res){
            //console.log(666);
            // var date = req.query.date;
            var sql =`select * from goods_order`;
            db.select(sql,function(data){

                res.send(data);
            });
        });
        // 把订单信息写入数据库
        app.get('/orderin',function(req,res){
            console.log(req.query);
            //var _goods = [];
            //req.query.order
            var _total = req.query.total;
            var _goods = req.query.order;
            // console.log(_goods,_total);

            var sql = `insert into goods_order (goods,total) values('${_goods}','${_total}')`;
            // console.log(sql);
            db.insert(sql,function(data){
                
                res.send(data);
            })
        });
       
       // 支付后删除商品订单
        app.get('/orderdel',function(req,res){
            console.log(req.query);
            var _id = req.query.id;
            var sql = `delete from goods_order where id = ${_id}`;
            console.log(sql);
            db.delete(sql,function(data){
                res.send('yes');
            })
        })
        
        
    }
}