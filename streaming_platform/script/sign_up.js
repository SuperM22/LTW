
$(document).ready(function() {

  $('#login').click(function(){
      console.log("errore");

    var userValue = $('#email').val();
    var pwdValue = $('#password1').val();
    var pwdValue2 = $('#password2').val();
    console.log("errore2");

    if($('#email').is(":invalid")){
        isNotEmail();
    }else if(pwdValue == ""){
        passwordVoid();
    }
    else if(!CheckPassword(pwdValue)){
        return passwordNotGood();
    }else if(pwdValue != pwdValue2){
        passwordWrong(pwdValue, pwdValue2);
    }else{
        console.log("errore3");
        $.ajax({
            type: "POST",
            url: 'php/sign_up.php',
            data: ({ email : userValue, password: pwdValue }),
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

  $("form input").keypress(function (e) {
        var code = e.keyCode || e.which;
        if (code == 13) {
            $('#login').click();
        }
    });

});//jq

function checkLogin(data){
  if(data == "ok"){
     var login_box = document.getElementsByClassName('login_box');
     login_box[0].innerHTML = "<h1 style='color:white;'> Account Creato </h1>";
      //window.alert("Account creato");
     setInterval(() => {window.location = "login.html";}, 2000);
  }else{
    emailWrong();
  }
};

function isNotEmail(){
    var input = document.getElementsByClassName('sign_error');
    input[0].innerText = "Email non valida";
    setTimeout(() => {input[0].innerText = "";},5000);
    console.log("fatto");
}

function emailWrong(){
    var input = document.getElementsByClassName('sign_error');
    input[0].innerText = "Email già Esistente";
    setTimeout(() => {input[0].innerText = "";},5000);
    console.log("fatto");

}

function passwordWrong(){
    var input = document.getElementsByClassName('sign_error');
    input[1].innerText = "Le Password non corrispondono";
    input[2].innerText = "Le Password non corrispondono";
    setTimeout(() => {
        input[1].innerText = "";
        input[2].innerText = "";},5000);
    console.log("fatto");
}
function passwordVoid(){
    var input = document.getElementsByClassName('sign_error');
    input[1].innerText = "La password non può essere vuota";
    input[2].innerText = "La password non può essere vuota";
    setTimeout(() => {
        input[1].innerText = "";
        input[2].innerText = "";},5000);
    console.log("fatto");
}
function passwordNotGood(){
    var input = document.getElementsByClassName('sign_error');
    input[1].innerText = "Impegnati per una password migliore";
    input[2].innerText = "Impegnati per una password migliore";
    setTimeout(() => {
        input[1].innerText = "";
        input[2].innerText = "";},5000);
    console.log("fatto");
}

function changeEye(){
    var inp1 = document.getElementById("password1");
    var inp2 = document.getElementById("password2");
    var yes_eye = document.getElementById("hide1");
    var no_eye = document.getElementById("hide2");

    if(inp1.type == "password"){
        inp1.type = "text";
        inp2.type = "text";
        yes_eye.style.display = "none";
        no_eye.style.display = "block";
    }else{
        inp1.type = "password";
        inp2.type = "password";
        yes_eye.style.display = "block";
        no_eye.style.display = "none";
    }

}
function CheckPassword(inputtxt){
    var decimal=  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
    if(inputtxt.match(decimal)){
        return true;
    }else{
        return false;
    }
}

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
}
