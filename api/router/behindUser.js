var db = require('../db/db')


module.exports = {
    register : function(app){
        // 后台注册验证
        app.get('/registerbehind',function(req,res){
            // console.log(req.query);
            var _username = req.query.username;
            var sql = `select * from behindUser where user_name = ${_username}`;
            db.select(sql,function(data){
                res.send(data);
                
                
            });
        });
        // 注册写入数据库
        app.get('/registerin',function(req,res){
            //console.log(req.query);
            var _username = req.query.username;
            var _password = req.query.password;
            var sql = `insert into behindUser (user_name,pass_word) values('${_username}','${_password}')`;
            db.insert(sql,function(data){
                res.send('ok');
            })
        });
        app.get('/loginView',function(req,res){
            //console.log(req.query.username);
            var _username = req.query.username;
            var sql =`select * from behindUser where user_name = ${_username}`;
            db.select(sql,function(data){
                // console.log(data);
                if(data.data.results.length == 0 ){
                    res.send('no');
                }else{
                    res.send('yes')
                }
            });
        });
        app.get('/loginGo',function(req,res){
            //console.log(req.query);
            var _username = req.query.username;
            var sql =`select * from behindUser where user_name = ${_username}`;
            db.select(sql,function(data){
                res.send(data);
            });
        });
        // 用户名查询
        app.get('/checkUser1',function(req,res){
            
            
            var _username = req.query.username;
            //console.log(req.query.title);
            var sql = `select * from user where username='${_username}'`;
            console.log(sql)
                
            db.select(sql, function(data){
                
                
                res.send(data);
            })

        });
        // 订单按编号查询
        app.get('/serachOrder',function(req,res){
            
            
            var _id = req.query.id;
            //console.log(req.query.title);
            var sql = `select * from goods_order where id='${_id}'`;
            console.log(sql)
                
            db.select(sql, function(data){
                
                
                res.send(data);
            })

        });
        // 会员管理实现分页
        app.get('/fenye',function(req,res){
            
            
            var page = req.query.page*1;
            var limit = req.query.limit * 1;
            var sql = `select id,username,password,reg_time from user `;
            
                
            db.select(sql, function(data){
                var total=data.data.results.length;
                data.data.results = data.data.results.splice((page-1)*limit,limit)
                
                res.send(data);
            })



        });
        //订单管理实现分页
        app.get('/orderPage',function(req,res){
            
            
            var page = req.query.page*1;
            var limit = req.query.limit * 1;
            var sql = `select id,goods,total,type,add_time from goods_order `;
            
                
            db.select(sql, function(data){
                var total=data.data.results.length;
                data.data.results = data.data.results.splice((page-1)*limit,limit)
                
                res.send(data);
            })



        });
        // 删除用户
        app.post('/delUser',function(req,res){
            var _id = req.body.id;
            console.log(_id)

           var sql = `delete  from user where id=${_id}`
           console.log(sql);
            db.delete(sql,function(data){
                res.send(data);
            })
        });
        // 删除订单
        app.post('/delOrder',function(req,res){
            var _id = req.body.id;
            console.log(_id)

           var sql = `delete  from goods_order where id=${_id}`
           console.log(sql);
            db.delete(sql,function(data){
                res.send(data);
            })
        });
      
    }
}