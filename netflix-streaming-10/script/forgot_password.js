
$(document).ready(function() {

  $('#login').click(function(){

    var userValue = $('#email').val();
    
    if(userValue == ""){
        isNotEmail();
    }else if($('#email').is(":invalid")){
        isNotEmail();
    }else{
        var login_box = document.getElementsByClassName('login_box');

        login_box[0].innerHTML = "<h1 style='color:white;'> Invio Email... </h1><div class='loader'><img src='./images/ajax-loader.gif'></div>";

        $.ajax({
            type: "POST",
            url: 'php/forgot_password.php',
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

  // $("form input").keypress(function (e) {
  //       var code = e.keyCode || e.which;
  //       if (code == 13) {
  //           $('#login').click();
  //       }
  //   });

});//jq

function checkLogin(data){
    console.log(data);
  if(data == "ok"){
     var login_box = document.getElementsByClassName('login_box');
     // login_box[0].innerHTML = "<h1 style='color:white;'> Nuova Password: " + data[1] + " </h1>";

     login_box[0].innerHTML = "<h1 style='color:white;'> Email Inviata </h1>";
     setInterval(() => {window.location = "login.html";}, 3000);
  }else{
      var login_box = document.getElementsByClassName('login_box');

      login_box[0].innerHTML = "<h1 style='color:white;'> Nessun Account con questa Mail </h1>";
      setInterval(() => {window.location = "forgot_password.html";}, 2000);
    // emailWrong();
  }
};

function isNotEmail(){
    var input = document.getElementsByClassName('sign_error');
    input[0].innerText = "Inserire un email valida";
    setTimeout(() => {input[0].innerText = "";},5000);
    console.log("fatto");
}

function emailWrong(){
    var input = document.getElementsByClassName('sign_error');
    input[0].innerText = "L'email non esiste";
    setTimeout(() => {input[0].innerText = "";},5000);
    console.log("fatto");

}
