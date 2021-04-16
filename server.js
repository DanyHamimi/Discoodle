var express = require('express');
var app = express();
const multer = require("multer");
const bodyParser = require('body-parser');
const server = require('http').createServer(app);
const io = require('socket.io')(server, {'pingTimeout': 180000, 'pingInterval': 25000});
const port = process.env.PORT || 5000;
const path = require('path');
const fs = require('fs');
const bcrypt = require('bcrypt');
const util = require('util');
const { PassThrough } = require('stream');

var mysql = require('mysql');

var session = require('express-session')({
    secret: "my-secret",
    resave: true,
    saveUninitialized: true
  });
var sharedsession = require("express-socket.io-session");


app.use(session);

io.use(sharedsession(session));

var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'root',
	password : '',
	database : 'discoodle',
    charset : 'utf8mb4',
});

connection.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});





app.use(express.urlencoded());
app.use(express.static('img'));
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());


const user = [];

const upload = multer({
    dest: "/public/img"
});

function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
}

app.use(express.static(__dirname + '/public'));
app.use(bodyParser.urlencoded({ extended: true })); 


app.get('/', (req,res) => {
    res.sendFile(`${__dirname}/public/index.html`)
    if(request.session.loggedin != 1){
        request.session.loggedin = 0;
    }
})

app.post('/index.html', function (req, res) {
    res.redirect(`/index.html?name=${req.body.name}`)
    console.log(`Full name is:${req.body.name} .`);
})

app.post('/writeArticle.html', function (req, res) {
    var p1 = req.param("fradio");
    console.log(p1);
    var p2 = req.param("text");
    console.log(p2);
    var p3 = req.param("articletext");
    console.log(p3);
    var sql = "INSERT INTO articles (nom, contenu,auteur,type) VALUES ('"+p2+"','"+p3+"','"+req.session.username+"','"+p1+"')";
    connection.query(sql, function (err, result) {
      if (err) throw err;
      console.log("1 record inserted");
    });
    res.redirect("/home.html");
})

app.get('/messages', function (req, res) {
    console.log('GET request received at /messages') 
    connection.query("SELECT * FROM message_log", function (err, result) {
        if (err) throw err;
        else{
            res.send(result)
        }
    });
});


app.post('/auth', function(request, response) {
	var username = request.body.username
	var password = request.body.password;
            if (username && password) {
                connection.query('SELECT * FROM accounts WHERE username = ?', [username], function(error, results, fields) {
                    if (results.length > 0) {
                        let t = new Promise(function(resolve, reject) {
                            bcrypt.compare(password, results[0].password, function(err, res) {
                                if (err) {
                                     reject(err);
                                } else {
                                     resolve(res);
                                }
                            });
                        });
                        t.then((pswRes)=>{
                            if (pswRes==true){
                                request.session.loggedin = 1;
                                request.session.username = username;
                                console.log(request.session.username);
                                //console.log(t);  
                                return response.redirect('/home.html');
                                
                                }else{
                                return response.redirect('/log.html');
                                }
                        }).catch((pswRes)=>{
                            console.log("error"+pswRes);
                        });
                          
                    } else {
                        return response.redirect('/log.html');
                    }			
                    //response.end();
                });
            } else {
               // response.send('Please enter Username and Password!');
               console.log("3333");
                //response.end();
            }
	
});

app.post('/reg', function(request, response) {
    var password = (request.body.password).toString();
	var username = request.body.username;
    var email = request.body.email;
    var passwordBis = request.body.passwordBis;
    var l = true;
	if (username && password && email) {
        connection.query('SELECT * FROM accounts WHERE username = ?', [username], function(error, r, fields) {
            if(r.length>0){
                response.send('Le pseudo est deja utilisé');
                //return response.redirect('/register.html');
            }else if(password==passwordBis){
                bcrypt.genSalt(10, function(err, salt) {
                    bcrypt.hash(password, salt, function(err, hash) {
                        var sql = "INSERT INTO accounts (username,password,email) VALUES (?,?,?)";
                        var todo = [username, hash,email];
                        connection.query(sql, todo, (err, results, fields) => {
                          if (err) {
                            return console.error(err.message);
                         }
                         response.redirect('/log.html');
                         }); 
                    });
                });
            }
        });
        
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});



io.on('connection', (socket) => {
    var session = socket.handshake.session;
    socket.on('user-created', name => {
        console.log('Utilisateur connecté');
        user[socket.id] = name;
        var heure =new Date();
        io.emit('MessageSend',session.username,"est connecté",heure.getHours()+':'+ heure.getMinutes()+':'+ heure.getSeconds());
    });

    socket.on('disconnecting', () => {
        io.emit('MessageSend', user[socket.id],"s'est déconnecté");
        console.log(socket.rooms); // Set contient le socket ID
    });


    socket.on('disconnect', () => {
        console.log('Utilisateur déconnecté'),
        // Quand le serveur crash ou redémarre user == null 
        delete user[socket.id];
    });

    socket.on('MessageSend',(name,msg,hour) =>{
        if ( name && name.length>0 && name !=null){
            var heure =new Date();
            io.emit('MessageSend',session.username,msg,heure.getHours()+':'+ heure.getMinutes()+':'+ heure.getSeconds());
            connection.query('INSERT INTO message_log (username, message, id, date) VALUES (?, ?, ?, ?)', [ session.username, msg, socket.id, new Date() ], function(error, results, fields){
                    if(error) throw error;
            });     
        }
    });

    socket.on('ImageSend',(name,img) =>{
        if ( name && name.length>0 && name !=null){
            io.emit('ImageSend',name,img);
        }
    });

    socket.on('join-room', (userId) => { //Système de room pour le WebRTC - userId est l'ID peer unique de l'utilsateur
        console.log(userId)
        io.emit('user-joined', userId);
    });
    
    socket.on('articleload', ()=>{
        console.log('test articles');
        connection.query('SELECT * FROM articles', function(error, results, fields){
			if (results.length > 0) {
				io.emit('articleload',results);
			}
        })
    });

    socket.on('checklog',()=>{
        console.log(session.loggedin);
        if(session.loggedin != 1){
            io.emit('checklog');
        }
    })

});

//File upload

const errHandler = (err, res) => { //Si on réussit pas a upload
    res
      .status(500)
      .contentType("text/plain")
      .end("Erreur fatale!");
  };


app.post(
    "/upload",
    upload.single("file"),
    (req, res) => {
      const original = req.file.path;
      var a = "./public/img/" + getRandomInt(10000000) + path.extname(req.file.originalname).toLowerCase();
      const target = path.join(__dirname, a);
  
      //jpg, png, jpeg acceptés uniquement.
      if (path.extname(req.file.originalname).toLowerCase() === ".png" || path.extname(req.file.originalname).toLowerCase() === ".jpg" || path.extname(req.file.originalname).toLowerCase() === ".jpeg") {
        fs.rename(original, target, err => {
          if (err) return errHandler(err, res);
          io.emit("ImageSend", req.body.uname, a.slice(9));
          //TODO: PAGE LOADS INFINITELY.
          /*res
            .status(200)
            .contentType("text/plain")
            .redirect();*/
            
        });
      } else {
        fs.unlink(original, err => {
          if (err) return errHandler(err, res);
  
          res
            .status(403)
            .contentType("text/plain")
            .end("Ce n'est pas une image");
        });
      }
    }
  );



server.listen(port, () =>{
    console.log(`Ca demarre sur le port ${port}`)
    console.log(`http://discoo.dog:${port}/`)
});