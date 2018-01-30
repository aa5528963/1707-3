var mysql = require('mysql');

// 建立与数据库连接
var db = mysql.createPool({
  connectionLimit : 10,
  host     : '10.3.136.69',//填数据库者的电脑IP
  user     : 'root',
  password : '12345678',
  database : 'wine'
});
 

module.exports= {
    select : function(_sql,_callback){
        db.query(_sql,function(error,results,fields){
            if(error){
                _callback({status:false,error:error})
            }else{
                _callback({status:true,data:{results,fields}});
            }
        })
    },
    insert : function(_sql,_callback){
        db.query(_sql,function(error,results,fields){
            if(error){
                _callback({status:false,error:error})
            }else{
                _callback({status:true,data:{results,fields}});
            }
        })
    },
    delete : function(_sql,_callback){
        db.query(_sql,function(error,results,fields){
            if(error){
                _callback({status:false,error:error})
            }else{
                _callback({status:true,data:{results,fields}});
            }
        })
    },
    update : function(_sql,_callback){
        db.query(_sql,function(error,results,fields){
            if(error){
                _callback({status:false,error:error})
            }else{
                _callback({status:true,data:{results,fields}});
            }
        })
    },
}