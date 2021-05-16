var currentChannel;
         var a = 69;
           function get(name){
               var url = window.location.search;
               var num = url.search(name);
               var namel = name.length;
               var frontlength = namel+num+1; //length of everything before the value 
               var front = url.substring(0, frontlength);  
               url = url.replace(front, "");  
               num = url.search("&");
               if(num>=0) return url.substr(0,num); 
               if(num<0)  return url;             
           }
         
         
           function addChan(){
             a++;
             var res = String.fromCharCode(a);
             document.getElementById('item').insertAdjacentHTML('beforeEnd','<button class="guild-add">' + res + '</button>');
           }
           
           function enableEmo(elem) {
             document.querySelector('#msg').value += elem.textContent;
           }
           var typeText = 1;
           function gText(){
            typeText = 2;
           }
           function pText(){
            typeText = 1;
           }
         
           function display(elemt) {
             var x = document.getElementById(elemt);
             currentChannel = elemt;
             document.getElementById('module2').innerHTML = "";
             //document.getElementById('module2').innerHTML = '<div class="header">Projet de Programmation</div>';
             if (!x){
               var test = "SELECT * FROM `cours` WHERE libelle_cours = "+elemt;
               //console.log(test);
               socket.emit('sql-select', "SELECT * FROM `cours` WHERE libelle_cours = "+'"'+elemt+'"', (result) =>{
                //console.log(result);
                 socket.emit('sql-select', "SELECT * FROM `modules` WHERE id_cours = "+'"'+result[0].id_cours+'"', (res) =>{
                   console.log(res);
                   console.log(res.length)
         
                   document.getElementById('module2').insertAdjacentHTML('beforeEnd','<div class="items" style="display:block" id="'+result[0].libelle_cours+'"><a id="'+result[0].libelle_cours+'test" href="#"></a></div>');
                   var toto = result[0].libelle_cours+"test";  
                   document.getElementById(toto).insertAdjacentHTML('beforeEnd','<div class="iteminf">Cours</div>');
                     for (let i = 0; i < res.length; i++) {
                       
                       console.log("'"+res[i].libelle_module+"'");
                       var p = document.contains(document.getElementById(res[i].libelle_module));
                       document.getElementById(toto).insertAdjacentHTML('beforeEnd','<div class="item trigger-group-cours" id="testtest" data="'+ res[i].libelle_module+ '">'+ res[i].libelle_module+ '</div>');
                       if (p === false) {
                         document.getElementById('msg-chan').insertAdjacentHTML('beforeEnd','<div class="messages-group hide-unless-show" id="'+res[i].libelle_module+'"><div class="header">'+res[i].libelle_module+'</div><div class="messages" id = "'+res[i].libelle_module+"0"+'"></div></div>');
                       }
              
                       socket.emit('join-channel',res[i].libelle_module+"0");
                     }
                      var j = document.contains(document.getElementById('chat'+result[0].libelle_cours));
                      console.log(j);
                      if(j === true){
                        var elem = document.getElementById('chat'+result[0].libelle_cours);
                        elem.remove();
                      }
                        document.getElementById(toto).insertAdjacentHTML('beforeEnd','<div class="iteminf id="temin">Salons Textuels</div>');
                        document.getElementById(toto).insertAdjacentHTML('beforeEnd','<div class="item trigger-group" id="testtest" data="chat'+result[0].libelle_cours+'">'+result[0].libelle_cours+' chat</div>');
                        document.getElementById('msg-chan').insertAdjacentHTML('beforeEnd','<div class="messages-group hide-unless-show" id="chat'+result[0].libelle_cours+'"><div class="header">'+result[0].libelle_cours+' chat</div><div class="messages" id ="chat'+result[0].libelle_cours+"0"+'"></div></div>');
                        socket.emit('join-channel',"chat"+result[0].libelle_cours+"0");
                     
                     
                     
                     //document.getElementById(toto).insertAdjacentHTML('beforeEnd','<div class="messages-group hide-unless-show" id="'+res[0].id_cours+'"><div class="header">video'+result[0].id_cours+'</div><div class="messages" id = "'+res[i].libelle_module+"0"+'"></div></div>');
                   });
                     
               })
             }
           } 
             var t;
             async function b(uid){
               t = await getOtherProfilePictureUrl(uid);
               console.log(t);
               return t;
             }
         
           $(function (){
           
             var socket = io();
               const def = "Utilisateur";
               const name = "test";
               
         
               let t = new Promise(function(resolve, reject) {
                 //var classe;
                 socket.emit('sql-select', "SELECT class FROM `users` WHERE id_user = "+getCookie("uid"), (result) =>{
                 console.log("classe :"+getCookie("uid"));
                 //classe = result[0].class;
                 //console.log(classe);
                 resolve(result[0].class);
                 })              
               });
               t.then((classe)=>{
                 socket.emit('sql-select', "SELECT * FROM `cours` WHERE id_classe =" +classe, (result) =>{
                 console.log(classe+"here");
                 var test = "test";
                 for (let i = 0; i < result.length; i++) {
                   document.getElementById('item').insertAdjacentHTML('beforeEnd','<button class="guild-add" onclick=\'display("'+result[i].libelle_cours+'")\'>' + result[i].libelle_cours + '</button>');
                 }
                 
               })
               })
               socket.emit('user-created',name);
               socket.emit('checklog');
               
               
               
                 
               
             	
               
               socket.emit('user-created',name);
               socket.emit('checklog');
               var idArray = [];
               $('.messages').each(function () {
                 idArray.push(this.id);
               });
         
               for (const element of idArray) {
                   socket.emit('join-channel',element);
               }
               
               if(localStorage.getItem("nom") !== null){
                 var tabhome = document.getElementById(localStorage.getItem("nom"));
                 if(tabhome.style.display = "none"){
                   display(localStorage.getItem("nom"));
                   console.log(localStorage.getItem("nom"));
                   localStorage.removeItem("nom");
                 }
               }
               socket.on('checklog',()=>{
                 console.log('FAIT');
                 window.location.href = "log.html"
               })
               document.getElementById("uname").setAttribute('value',name);  
               var username = name;
               $("#msgform").submit(function(e) {
                  var emptyMsg = $("#msg").val() === "";
                  if(emptyMsg === false){
                    if(typeText===2){
                      var s = "<h1>"+$("#msg").val();+"</h1>"
                    }else{
                      var s = $("#msg").val();
                    }
                    
                    e.preventDefault(); // Pour pas que la page se recharge
                    socket.emit("MessageSend",username,s,new Date(),defaultId+0,getCookie("uid"),profile_link); //Envoyer au socket la val de #msg
                    $("#msg").val(""); // On vide pr pouvoir renvoyer un msg 
          
                    element = document.getElementById('msg-chan');
                    element.scrollTop = element.scrollHeight;
                    return false;
                  }       
               });
              
               socket.on('MessageSend', function(name,msg,hour,channel1,usid,prfPic){
                 if (channel1 == defaultId+'0'){
                   var node = document.getElementById(defaultId+'0');
                   console.log(defaultId);
                   node.insertAdjacentHTML('beforeend', '<div class="message"> <div class="icon"><img class="responsive-img" src="'+prfPic+'"/></div> <div class="body"> <div class="user-name">'+name+'</div><div class="hour">'+hour+'</div> <div class="content">'+msg+'</div> </div> </div>');
                   element = document.getElementById('msg-chan');
                   element.scrollTop = element.scrollHeight;
                 }
               });
         
               socket.on('OldSend', function(name,msg,hour,channel,prPic){
                 element = document.getElementById('msg-chan');
             element.scrollTop = element.scrollHeight;
                 var node = document.getElementById(channel);
                 if(node != null){
                   node.insertAdjacentHTML('beforeend', '<div class="message"> <div class="icon"><img class="responsive-img" src="'+prPic+'"/></div> <div class="body"> <div class="user-name">'+name+'</div><div class="hour">'+hour+'</div> <div class="content">'+msg+'</div> </div> </div>');
                 }
               })
         
               socket.on('ImageSend', function(name,img){
                 element = document.getElementById('msg-chan');
             element.scrollTop = element.scrollHeight;
                 var node = document.getElementById(defaultId+'0');
                 console.log(defaultId);
                 node.insertAdjacentHTML('beforeend', '<div class="message"><div class="icon"><img class="responsive-img" src="./ProfilDefault.png"/></div> <div class="body"> <div class="user-name">'+name+'</div> <div class="content"> <img src="'+img+'" style="max-width: 500px;"/></div> </div> </div>');
               });
           });