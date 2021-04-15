

function loadForm() {
    alert("Hello");
    document.getElementById('buttonid').addEventListener('click', openDialog);
    function openDialog() {
        document.getElementById('inputid').click();
    }
    document.getElementById('inputid').addEventListener('change', submitForm);
    function submitForm() {
        document.getElementById('autosubmit_form').submit();
    }
}

function confirmDelete() {
    if(confirm("Voulez vous vraiment supprimer votre compte ?")) {
        var uid = sessionStorage.getItem("uid");
        socket.emit("del-acc", uid);
    }
}