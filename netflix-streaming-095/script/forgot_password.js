
$(document).ready(function() {

  $('#login').click(function(){

    var userValue = $('#email').val();

    if($('#email').is(":invalid")){
        isNotEmail();
    }else{
        $.ajax({
            type: "POST",
            url: 'http://localhost/netflix-streaming/php/forgot_password.php',
            data: ({ email : userValue }),
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

     login_box[0].innerHTML = "<h1 style='color:white;'> Email Inviata </h1>";
     setInterval(() => {window.location = "login.html";}, 5000);
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
    input[0].innerText = "Email doesn't Exist";
    setTimeout(() => {input[0].innerText = "";},5000);
    console.log("fatto");

}
