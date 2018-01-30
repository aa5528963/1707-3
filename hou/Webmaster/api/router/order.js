var db = require('../db/db')


module.exports = {
    register : function(app){
       
        app.get('/order',function(req,res){
            // var date = req.query.date;
            // var sql =`select * from order`;
            db.select('SELECT * FROM `order`',function(data){

                res.send(data);
            });
        });
        
    }
}