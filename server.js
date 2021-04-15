var express = require('express');
var mysql = require('mysql');
var app = express();
var path = require('path');
const bcrypt = require('bcrypt');
const util = require('util');

const bodyParser = require('body-parser');
const { PassThrough } = require('stream');
const server = require('http').createServer(app);
const io = require('socket.io')(server, {'pingTimeout': 180000, 'pingInterval': 25000});
const port = process.env.PORT || 5000;

var session = require('express-session')({
    secret: "my-secret",
    resave: true,
    saveUninitialized: true
  });
var sharedsession = require("express-socket.io-session");



app.use(session);

io.use(sharedsession(session));

const user = [];

var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'nodelogin'
});

app.use(express.static(__dirname + '/public'));
app.use(bodyParser.urlencoded({ extended: true })); 


app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());


app.get('/', (req,res) => {
    console.log(rea.session.username);
    res.sendFile(`${__dirname}/index.html`);
})

app.post('/index.html', function (req, res) {
    res.redirect(`/index.html?name=${req.body.name}`)
    console.log(`Full name is:${req.body.name} .`);
})

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
                                request.session.loggedin = true;
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


app.get('/home.html', function(req, res) {
    console.log('toto');
});


app.get('/index.html', function(req, res) {
    console.log('toto');
});

io.on('connection', (socket) => {
    var session = socket.handshake.session;
    socket.on('user-created', name => {
        console.log('Utilisateur connecté'),
        user[socket.id] = name
        io.emit('MessageSend',session.username,"est connecté");
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
            io.emit('MessageSend',session.username,msg);
            console.log(session.username);
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
