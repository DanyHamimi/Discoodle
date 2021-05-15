//RTC INTEGRATION - Fonctionnel avec micro + caméra en temps réel.

console.log("Finally...")
const roomId = "3232131"
const socket = io('/')
const videoGrid = document.getElementById('video-grid')
const myPeer = new Peer()
console.log("My user id is : " + myPeer.id)
const myVideo = document.createElement('video') //On crée un  canvas vidéo (qui contiendra l'audio et la vidéo)
myVideo.muted = true //Pour ne pas entendre sa propre voix
const peers = {} //Tous les utilisateurs ayant rejoint le P2P

var getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
getUserMedia({video: true, audio: true}, function(stream) {
  addVideoStream(myVideo, stream);

  /*myPeer.on('call', (call) => { //Recieves call
    console.log("I recieved a call, hurray !")
    call.answer(stream)
    console.log("I answered the call")
    var vid2 = document.createElement('video')
    call.on('stream', (otherStream) => {
      addVideoStream(vid2, otherStream)
    })
  })*/

  socket.on('user-joined', (userId) => { //Only users already in channel recieve this event
    connectToUser(userId, stream)

  })
}, function(err) {
  console.log('Failed to get local stream' ,err)
})

myPeer.on('call', (call) => { //Recieves call
  getUserMedia({video: true, audio: true}, function(stream) {
    console.log("I recieved a call, hurray !")
    call.answer(stream)
    console.log("I answered the call")
    var vid2 = document.createElement('video')
    call.on('stream', (otherStream) => {
      addVideoStream(vid2, otherStream)
    })
  })
})

myPeer.on('open', id => {
  socket.emit('join-room', roomId, id)
  console.log("Just opened, we emitted !")
})

socket.on('user-disconnected', (userId) => {
  console.log("We recieved : user disconnected")
  if(peers[userId]) peers[userId].close();
})

function connectToUser(userId, stream) {
  console.log("User has joined!")
    var call = myPeer.call(userId, stream);
    console.log("Calling : " + userId)
    var vid = document.createElement('video')
    peers[userId] = call;
    call.on('stream', function(remoteStream) { //Answered
      console.log(userId + " has answered.")
      addVideoStream(vid, remoteStream)
    })

    call.on('close', () => {
      vid.remove()
    })
}

function addVideoStream(video, stream) {
  video.srcObject = stream
  video.addEventListener('loadedmetadata', () => {
    video.play()
  })
  videoGrid.append(video)
}

function leaveCall() {
  socket.emit('disconnect', roomId, myPeer.id)
}

function leftCall() {
  socket.emit('disconnect', roomId, myPeer.id)
}

function unmuteMic(){
  myVideo.muted = false;
}