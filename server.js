var express = require('express');
var app = express();
const bodyParser = require('body-parser');
const server = require('http').createServer(app);
const io = require('socket.io')(server, {'pingTimeout': 180000, 'pingInterval': 25000});
const port = process.env.PORT || 5000;
var mysql = require('mysql');

/*
mysql -u root -p
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
FLUSH PRIVILEGES;
password

CREATE DATABASE IF NOT EXISTS `nodelogin` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `nodelogin`;

CREATE TABLE IF NOT EXISTS `message_log` (
  `username` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

*/

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


const user = [];


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
        console.log('Utilisateur connecté'),
        user[socket.id] = name
        io.emit('MessageSend',name,"est connecté");
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

    socket.on('MessageSend',(name,msg) =>{
        if ( name && name.length>0 && name !=null){
            io.emit('MessageSend',name,msg);
            connection.query('INSERT INTO message_log (username, message, id, date) VALUES (?, ?, ?, ?)', [ name, msg, socket.id, new Date() ], function(error, results, fields){
                    if(error) throw error;
            });     
        }
    });

    socket.on('join-room', (userId) => { //Système de room pour le WebRTC - userId est l'ID peer unique de l'utilsateur
        console.log(userId)
        io.emit('user-joined', userId);
    });

});


server.listen(port, () =>{
    console.log(`Ca demarre sur le port ${port}`)
    console.log(`http://discoo.dog:${port}/`)
});
