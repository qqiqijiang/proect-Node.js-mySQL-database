"use strict";

var express=require("express");
var session=require("express-session");
var bodyParser = require("body-parser");
var mysql = require("mysql");
var fileUpload = require("express-fileupload");


var port = 8082;
var myconnect = mysql.createConnection(
    {
        host:"localhost",
        user:"qiqiqi",
        password:"666666",
        database:"myproject"
    }
);
myconnect.connect(function (err) {
   if(err){
       console.log("ERROR");
   } else{
       console.log("CONNECTED");
   }
});

var app = express();

app.use(express.static("public"));
app.use(bodyParser.urlencoded({extended: true}));
app.use(fileUpload());

// templating engine
app.set("view engine", "ejs");
app.set("views", "templates");


app.use(session({
    secret: "ahoifudpsjknhjdsyhihefl",
    resave: false,
    saveUninitialized: true,
    cookie:{maxAge: 1000*60*60}
}));

// set routes
app.get("/", function (request, response) {
    response.render("index.ejs",{"username": request.session.username});
});
app.get("/profile", function (request,response) {
    //determine if the user is login and show images
    var theQuery = `SELECT * FROM gallery`;
    myconnect.query(theQuery,function(err,results){
       if(err){
           response.send("Another DataBase err"+err);
       } else{
          response.render("profile.ejs",{"username": request.session.username, "gallery": results});
           //response.json(results);
       }
    });

});

app.post("/login", function (request,response) {
    var name = request.body.username;
    var pass = request.body.password;

    var thesql =  `SELECT Password FROM username WHERE Username = '${name}'`;


    myconnect.query(thesql, function (err,results) {
        
        if(err){
            response.send("Database error"+err);

        }else if(results.length>0&& results[0].Password ==pass){
            request.session.username =name;
            response.redirect("/profile");

        }else{
            //console.log(results);
            response.redirect("login.html");
        }
    });
});

app.post("/join",function(request,response){
   var fname = request.body.firstname;
   var sname = request.body.surname;
   var uname = request.body.username;
   var pass = request.body.password;

   var thesql = `INSERT INTO username(Firstname, Surname, Username, Password) VALUES ('${fname}','${sname}','${uname}','${pass}')`;
   //console.log(thesql);

   myconnect.query(thesql,function(err,results){
     if(err){
         response.send("Database error");
     }else{
         console.log(results);
         response.redirect("/login.html");
     }
   })
});

app.post("/upload", function (request, response) {
        var file = request.files.myfile;// the same name as in html file
        //console.log(request.files);
        file.mv("public/uploads/" + file.name);
        //response.send("upload successfully!");
        var imagename = request.body.imagename;
        var uname = request.session.username;
        var date = new Date().toLocaleString();
        var time = date.toString();

        var myupload = `INSERT INTO gallery(Imagename, Username, Date, Source) VALUES ('${imagename}','${uname}','${time}','${file.name}')`;
        //console.log(myupload);
        myconnect.query(myupload, function (err, results) {
            if (err) {
                response.send("Cannot upload");
            } else {
                console.log(results);
                response.redirect("/profile");
            }
        })
});
app.get("/upload", function(request,response){
    var user = request.session.username;
    if(user){
        response.redirect("upload.html");
    }else{
        response.redirect("login.html");
    }
});

app.get("/logout", function (request,response) {
    delete request.session.username;
    response.redirect("/login.html");
});
app.listen(port);
console.log("Server running on http://localhost:" + port);