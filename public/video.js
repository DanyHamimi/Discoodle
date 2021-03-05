//RTC INTEGRATION - Fonctionnel avec micro + caméra en temps réel.

function initVid() {
    const socket = io('/')
    const videoGrid = document.getElementById('video-grid')
    const myPeer = new Peer()
    const myVideo = document.createElement('video') //On crée un  canvas vidéo (qui contiendra l'audio et la vidéo)
    myVideo.muted = false //Pour ne pas entendre sa propre voix
    const peers = {} //Tous les utilisateurs ayant rejoint le P2P

    //Ici on demande l'autorisation du navigateur pour prendre les flux audio/vidéo
    navigator.mediaDevices.getUserMedia({
      video: false, //Désactiver ou activer le flux vidéo
      audio: true
    }).then(stream => {
      addVideoStream(myVideo, stream)
    
      myPeer.on('call', call => { //Listener sur les utilisateurs qui rejoignent
        call.answer(stream)
        const video = document.createElement('video')
        call.on('stream', userVideoStream => {
          addVideoStream(video, userVideoStream)
        })
      })
    
      socket.on('user-joined', userId => { //Liaison Socket.io - PeerJs
        console.log(userId)
        connectToNewUser(userId, stream)
      })
    })
    
    socket.on('user-disconnected', userId => { //On déconnecte l'utilisateur des peers
      if (peers[userId]) peers[userId].close()
    })
    
    myPeer.on('open', id => { //Exécuté dès la connexion au P2P. Dès l'appel de la fonction initVid() si la connexion réussit.
      socket.emit('join-room', id) //On fait rejoindre une room à l'utilisateur
    })
    
    function connectToNewUser(userId, stream) { //Executé pour tous les utilisateurs Peer
      const call = myPeer.call(userId, stream)
      const video = document.createElement('video')
      call.on('stream', userVideoStream => { //Dès qu'on reçoit un flux vidéo
        addVideoStream(video, userVideoStream)
      })
      call.on('close', () => { //Dès qu'on ferme la connexion
        video.remove()
      })
    
      peers[userId] = call
    }
    
    function addVideoStream(video, stream) { //Fonction qui agit sur l'HTML de la page et qui lie le flux Peer au canva 'video'
      video.srcObject = stream
      video.addEventListener('loadedmetadata', () => {
        video.play()
      })
      videoGrid.append(video)
    }
}