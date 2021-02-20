var express = require('express');
var app = express();
const bodyParser = require('body-parser');
const server = require('http').createServer(app);
const io = require('socket.io')(server, {'pingTimeout': 180000, 'pingInterval': 25000});
const port = process.env.PORT || 5000;


const user = [];


app.use(express.static(__dirname + '/public'));
app.use(bodyParser.urlencoded({ extended: true })); 


app.get('/', (req,res) => {
    res.sendFile(`${__dirname}/public/index.html`);
})

app.post('/index.html', function (req, res) {
    res.redirect(`/index.html?name=${req.body.name}`);
    console.log(`Full name is:${req.body.name} .`);
})


io.on('connection', (socket) => {

    socket.on('user-created', name => {
        console.log('Utilisateur connecté');
        user[socket.id] = name;
        io.emit('MessageSend',name,"est connecté");
    });

    socket.on('disconnecting', () => {
        if(user[socket.id]){
            io.emit('MessageSend', user[socket.id],"s'est déconnecté");
            console.log(socket.rooms); // Set contient le socket ID
        }
    });


    socket.on('disconnect', () => {
        if(user[socket.id]){
            console.log('Utilisateur déconnecté');
            delete user[socket.id];
        }
    });


    socket.on('MessageSend',(name,msg) =>{
        if (!name) {
            return next(new Error("Vous n'avez pas de NOM!"));
        }
        if ( name && name.length>0 && name !=null){
            io.emit('MessageSend',name,msg);
        }
    });



});


server.listen(port, () =>{
    console.log(`Ca demarre sur le port ${port}`);
    console.log(`http://discoo.dog:${port}/`);
});
