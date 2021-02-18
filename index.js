var express = require('express');
var app = express();
const bodyParser = require('body-parser');
const server = require('http').createServer(app);
const io = require('socket.io')(server);

app.use(express.static(__dirname + '/public'));
app.use(bodyParser.urlencoded({ extended: true })); 

app.get('/', (req,res) => {
    res.sendFile(`${__dirname}/public/index.html`)
})

app.post('/index.html', function (req, res) {
    res.redirect(`/index.html?name=${req.body.name}`)
    console.log(`Full name is:${req.body.name} .`);
  })


io.on('connection', (socket) => {
    console.log('Un utilisateur s\'est connecté.')

    socket.on('MessageSend',(name,msg) =>{
        io.emit('MessageSend',name,msg);
    });
});




server.listen(80, () =>{
    console.log('Ca demarre sur le port 80')
})