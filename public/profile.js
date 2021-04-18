const socket = io("ws://localhost:5000");
getUID();


function loadForm() {
    document.getElementById('buttonid').addEventListener('click', openDialog);
    function openDialog() {
        document.getElementById('inputid').click();
    }
    document.getElementById('inputid').addEventListener('change', submitForm);
    function submitForm() {
        if(confirm("Voulez vous vraiment changer votre photo de profil ?")) document.getElementById('autosubmit_form').submit();
    }
}


function confirmDelete() {
    /*if(confirm("Voulez vous vraiment supprimer votre compte ?")) {
        //socket.emit("del-acc", uid);
        
        alert("Hello");
    }*/
}

function getUID() {
    let t = new Promise(function(resolve, reject) {
        socket.emit("logged-in", "a", (response) => {
            if(response != null) resolve(response);
        })
        setTimeout(() => {}, 5000);
    });
    t.then((res)=>{
        sessionStorage.setItem("uid", res);
        console.log(res);
    }).catch(()=>{

    });
}

function getProfilePictureUrl() {

    /*let t = new Promise(function(resolve, reject) {
        socket.emit("sql-select", `SELECT 'profile_picture' FROM 'accounts' WHERE 'username' = ${uid}`, (response) => {
            resolve(response);
        })
        setTimeout(() => {}, 500);
    });
    t.then((res)=>{
        console.log("res");
        return res;
    }).catch(()=>{

    });*/
    var a = "SELECT profile_picture FROM accounts WHERE id = " + sessionStorage.getItem("uid");
    console.log(a);
    socket.emit("sql-select", a, (response) => {
        return response[0].profile_picture;
    })
   
}

function setProfilePictureUrl(url) {
    var a = "UPDATE accounts SET profile_picture = " + url + " WHERE id = " + sessionStorage.getItem("uid");
    socket.emit("sql-update", a, (response) => {
        console.log("Done");
    })
}