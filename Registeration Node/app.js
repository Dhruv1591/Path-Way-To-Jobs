var sqlite3 = require('sqlite3').verbose();
var express = require('express');
var http = require('http');
var path = require("path");
var bodyParser = require('body-parser');
var helmet = require('helmet');
var rateLimit = require("express-rate-limit");

var app = express();
var server = http.createServer(app);

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, 
  max: 100 // 
});


// Create database
var db = new sqlite3.Database('database/users.db');


app.use(bodyParser.urlencoded({extended: false}));
app.use(express.static(path.join(__dirname,'./public')));
app.use(helmet());
app.use(limiter);

// Run database
db.run('CREATE TABLE IF NOT EXISTS users(username TEXT, email EMAIL,pass PASSWORD,confirm_pass PASSWORD)');


// Load default page
app.get('/', function(req,res){
  res.sendFile(path.join(__dirname,'./public/register.html'));
});


// Insert
app.post('/add', function(req,res){
  db.serialize(()=>{
    db.run('INSERT INTO users(username,email,pass,confirm_pass) VALUES(?,?,?,?)',
      [req.body.username, req.body.email,req.body.pass,req.body.confirm_pass], function(err) {
      if (err) {
        return console.log(err.message);
      }
      console.log("New user has been added");
      res.send("New user has been added into the database with username = "
        + req.body.username + " email = " + req.body.email+"passowrd = "+req.body.pass);
    });
  });
});

//Run server
server.listen(5555,function(){ 
    console.log("Server listening on port: 5555");
});