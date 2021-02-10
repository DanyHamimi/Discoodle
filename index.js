const app = require('express')();
const server = require('http').createServer(app);
const io = require('socket.io')(server);

app.get('/', (req,res) => {
    res.sendFile(`${__dirname}/public/index.html`)
})

io.on('connection', (socket) => {
    console.log('Un utilisateur s\'est connectÃ©.')

    socket.on('MessageSend',(msg) =>{
        io.emit('MessageSend',msg);
    });
});




server.listen(5000, () =>{
    console.log('Ca demarre sur le port 5000')
})