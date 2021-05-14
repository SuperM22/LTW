
$(document).ready(function() {

    $('#login').click(function(){

        var pass1 = $('#password1').val();
        var pass2 = $('#password2').val();
        var pass3 = $('#password3').val();
        var myCookie = getCookie("netflix");
        if (myCookie == null) {
            myCookie = sessionStorage.getItem("netflix");


        }

        if(pass1 == ""){
            passwordVoid();
        }else if(pass2 != pass3){
            passwordWrong();
        }else{
            $.ajax({
                type: "POST",
                url: 'http://localhost/netflix-streaming/php/change_password.php',
                data: ({ oldpass: pass1, newpass: pass2, cookie: myCookie }),
                dataType: "html",
                success: function(data) {
                    checkLogin( data );
                    return data;
                },
                error: function() {
                    console.log('Error occured');
                }
            });//ajax
        }
    });//click

});//jq

function checkLogin(data){
    console.log(data);
    if(data == "ok"){
        var login_box = document.getElementsByClassName('login_box');
         // login_box[0].innerHTML = "<h1 style='color:white;'> Nuova Password: " + data[1] + " </h1>";

        login_box[0].innerHTML = "<h1 style='color:white;'> Password Modificata </h1>";
        setInterval(() => {window.location = "index.html";}, 10000);
    }else{
        var login_box = document.getElementsByClassName('login_box');
        login_box[0].innerHTML = "<h1 style='color:white;'> Errore: Impossibile Modificare Password </h1>";
        setInterval(() => {window.location = "index.html";}, 10000);

    }
};

function passwordVoid(){
    var input = document.getElementsByClassName('sign_error');
    input[0].innerText = "Password is Void";

    setTimeout(() => {
        input[0].innerText = "";},5000);
    console.log("fatto");
}

function passwordWrong(){
    var input = document.getElementsByClassName('sign_error');
    input[1].innerText = "Password Doesn't match";
    input[2].innerText = "Password Doesn't match";
    setTimeout(() => {
        input[1].innerText = "";
        input[2].innerText = "";},5000);
    console.log("fatto");
}

//START getCookie
function getCookie(name) {
    var dc = document.cookie;
    var prefix = name + "=";
    var begin = dc.indexOf("; " + prefix);
    if (begin == -1) {
        begin = dc.indexOf(prefix);
        if (begin != 0) return null;
    }
    else
    {
        begin += 2;
        var end = document.cookie.indexOf(";", begin);
        if (end == -1) {
        end = dc.length;
        }
    }
    // because unescape has been deprecated, replaced with decodeURI
    //return unescape(dc.substring(begin + prefix.length, end));
    return decodeURI(dc.substring(begin + prefix.length, end));
}//END getCookie

function changeEye(){
    var inp1 = document.getElementById("password1");
    var inp2 = document.getElementById("password2");
    var inp3 = document.getElementById("password3");
    var yes_eye = document.getElementById("hide1");
    var no_eye = document.getElementById("hide2");

    if(inp1.type == "password"){
        inp1.type = "text";
        inp2.type = "text";
        inp3.type = "text";
        yes_eye.style.display = "none";
        no_eye.style.display = "block";
    }else{
        inp1.type = "password";
        inp2.type = "password";
        inp3.type = "password";
        yes_eye.style.display = "block";
        no_eye.style.display = "none";
    }

}
