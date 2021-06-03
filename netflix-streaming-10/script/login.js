
$(document).ready(function() {

  $('#login').click(function(){
    var userValue = $('#email').val();
    var pwdValue = $('#password').val();
    var checkBox = document.getElementById('remember-me').checked;


    $.ajax({
        type: "POST",
        url: 'php/login.php',
        data: ({ email : userValue, password: pwdValue, check: checkBox }),
        dataType: "html",
        success: function(data) {
            checkLogin(data, checkBox);
            return data;
        },
        error: function() {
            console.log('Error occured');
        }
    });//ajax

  });//click

  $("form input").keypress(function (e) {
        var code = e.keyCode || e.which;
        if (code == 13) {
            $('#login').click();
        }
    });

});//jq

function checkLogin(data, checkBox){
    data = data.split(" ");
    console.log(data);
  if(data[0] == "ok"){
      //console.log("ok va bn");
      if(!checkBox){
          sessionStorage.setItem("netflix", data[1]);
        }
    window.location = "index.html";
  }else{
     emailWrong();
    console.log(data);
  }
};

function emailWrong(){
    var input = document.getElementsByClassName('sign_error');
    input[0].innerText = "Email o Password sbagliata";
    input[1].innerText = "Email o Password sbagliata";
    setTimeout(() => {
        input[0].innerText = "";
        input[1].innerText = "";},5000);
    // console.log("fatto");

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

function changeEye(){
    var inp = document.getElementById("password");
    var yes_eye = document.getElementById("hide1");
    var no_eye = document.getElementById("hide2");

    if(inp.type == "password"){
        inp.type = "text";
        yes_eye.style.display = "none";
        no_eye.style.display = "block";
    }else{
        inp.type = "password";
        yes_eye.style.display = "block";
        no_eye.style.display = "none";
    }


}
