var db = require('../db/db')


module.exports = {
    register : function(app){
       
        app.get('/loginView',function(req,res){
            // var date = req.query.date;
            var sql =`select * from behindUser`;
            db.select(sql,function(data){

                res.send(data);
            });
        });
        app.get('/registerView',function(req,res){
            // var date = req.query.date;
            var sql =`select * from behindUser`;
            db.select(sql,function(data){

                res.send(data);
            });
        });
        
    }
}