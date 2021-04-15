var uname = sessionStorage.getItem("uname");

function loadForm() {
    document.getElementById('buttonid').addEventListener('click', openDialog);
    function openDialog() {
        document.getElementById('inputid').click();
    }
    document.getElementById('inputid').addEventListener('change', submitForm);
    function submitForm() {
        if(confirm("Voulez vous vraiment changer votre photo de profil ?")) document.getElementById('autosubmit_form').submit();
        socket.on("PPUpdated", (url) => {
            setProfilePictureUrl(url);
        })
    }
}

function confirmDelete() {
    if(confirm("Voulez vous vraiment supprimer votre compte ?")) {
        socket.emit("del-acc", uid);
    }
}

function getProfilePictureUrl() {
    socket.emit("sql-select", `SELECT 'profile_picture' FROM 'accounts' WHERE 'username' = ${uname}`, (response) => {
        return response;
    })
}

function setProfilePictureUrl(url) {
    socket.emit("sql-update", `UPDATE 'accounts' SET 'profile_picture' = ${url}`, (response) => {

    })
}