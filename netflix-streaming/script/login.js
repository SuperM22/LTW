
$(document).ready(function() {

  $('#login').click(function(){
    var userValue = $('#email').val();
    var pwdValue = $('#password').val();

    $.ajax({
        type: "POST",
        url: 'http://localhost/netflix-streaming/php/login.php',
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

  });//click

  function checkLogin(data){
    if(data == "ok"){
        //console.log("ok va bn");
      window.location = "index.html";
    }else{
      console.log("email o password errati");
    }
  };

});//jq
