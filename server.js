var express = require('express');
var app = express();
const multer = require("multer");
const bodyParser = require('body-parser');
const server = require('http').createServer(app);
const io = require('socket.io')(server, {'pingTimeout': 180000, 'pingInterval': 25000});
const port = process.env.PORT || 5000;
const path = require('path');
const fs = require('fs');

var mysql = require('mysql');

var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'newuser',
	password : 'password',
	database : 'nodelogin'
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
})

app.post('/index.html', function (req, res) {
    res.redirect(`/index.html?name=${req.body.name}`)
    console.log(`Full name is:${req.body.name} .`);
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


io.on('connection', (socket) => {

    socket.on('user-created', name => {
        console.log('Utilisateur connecté');
        user[socket.id] = name;
        var heure =new Date();
        io.emit('MessageSend',name,"est connecté",heure.getHours()+':'+ heure.getMinutes()+':'+ heure.getSeconds());
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
            io.emit('MessageSend',name,msg,heure.getHours()+':'+ heure.getMinutes()+':'+ heure.getSeconds());
            connection.query('INSERT INTO message_log (username, message, id, date) VALUES (?, ?, ?, ?)', [ name, msg, socket.id, new Date() ], function(error, results, fields){
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

