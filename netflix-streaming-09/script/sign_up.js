
$(document).ready(function() {

  $('#login').click(function(){

    var userValue = $('#email').val();
    var pwdValue = $('#password1').val();
    var pwdValue2 = $('#password2').val();



    if($('#email').is(":invalid")){
        isNotEmail();
    }else if(pwdValue != pwdValue2){
        passwordWrong(pwdValue, pwdValue2);
    }else{
        $.ajax({
            type: "POST",
            url: 'http://localhost/netflix-streaming/php/sign_up.php',
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
    input[0].innerText = "This in not an Email";
    setTimeout(() => {input[0].innerText = "";},5000);
    console.log("fatto");
}

function emailWrong(){
    var input = document.getElementsByClassName('sign_error');
    input[0].innerText = "Email Already Exist";
    setTimeout(() => {input[0].innerText = "";},5000);
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
