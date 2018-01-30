var express = require('express');
var app = express();
var bp = require('body-parser');

app.use(bp.urlencoded({extended:false}));

var user = require('./user');
var order = require('./order');
var behindUser = require('./behindUser')

module.exports = {
    start : function(_port){
        app.all('*', function(req, res, next) {
            res.header("Access-Control-Allow-Origin", "*");
            res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
            res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
            res.header("X-Powered-By",' 3.2.1')
            if(req.method=="OPTIONS"){
                res.send(200);
            } else {
                next();
            }
        });          
        
        user.register(app);
        order.register(app);
        behindUser.register(app);
        app.listen(_port);
    }
}