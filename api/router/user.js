var db = require('../db/db')


module.exports = {
    register : function(app){
        
        app.get('/login',function(req,res){
            //console.log(req.query.username);
            var _username = req.query.username;
            var sql = `select * from user where username = ${_username}`;
            db.select(sql,function(data){
                
                res.send(data);
            })
        });
        app.get('/user',function(req,res){
            // console.log(req);
            // var date = req.query.date;
            var sql =`select * from user`;
            db.select(sql,function(data){
                res.send(data);
            });
        });
        

        // 注册
        // 判断用户名是否被注册
        app.get('/register',function(req,res){
            //console.log(req.query);
            var _username = req.query.date;
            var sql = `select * from user where username = ${_username}`;
            db.select(sql,function(data){
                
                if(data.data.results.length == 0){
                    res.send('yes')
                }else{
                    res.send('no')
                }
            });
        }); 
        // 把用户名和密码写入数据库
        app.post('/register',function(req,res){
            
            var _username = req.body.user;
            var _password = req.body.password;console.log(_username,_password);
            var sql = `insert into user (username,password) values ('${_username}','${_password}')`;
            db.insert(sql,function(data){
                res.send('ok');
            })
            
        });
    }
}