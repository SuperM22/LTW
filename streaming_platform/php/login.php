<?php
    include "connection.php";

    $mysqli = dbConnection();

    checkLogin($mysqli);

    $email = $_POST['email'];

    $check = $_POST['check'];
    $tempo;

    if($check == "true"){
        $tempo = 24 * 365;
    }else{
        $tempo = 0;
    }

    $cookie_name = "netflix";
    $cookieValue = createCookieValue(256);


    $key = "b91a25e358ab4ac402fa85466bc64216629d5a7a91f21c5075194c265e21e02b";

    $encryptedCookieValue = encrypt($cookieValue, $key);

    setcookie($cookie_name, $encryptedCookieValue, time() + (3600 * $tempo), '/');


    $result = $mysqli -> query("UPDATE utente SET cookie = '$encryptedCookieValue' WHERE utente.email = '$email'");

    echo "ok ".$encryptedCookieValue;

    function checkLogin($mysqli){
        $email = $_POST['email'];
        $pass = $_POST['password'];

        $encrypted_password = md5($pass);



       $result = $mysqli -> query("SELECT * FROM utente where email = '$email' AND password = '$encrypted_password'");
       $count = mysqli_num_rows($result);
       // $row = mysqli_fetch_array($result);

       if($count != 1){
           $error = "Your Login Name or Password is invalid";
           die($error) ;
           // die($encrypted_password);
       }



    }



    function createCookieValue($len){
      $value = '';

      for($i = 0; $i < $len; $i++){
        $value .= rand(0, 9);
      }

      return $value;
    }

    function encrypt($string, $key) {
    	$result = '';

    	for($i=0, $k= strlen($string); $i<$k; $i++) {
    		$char = substr($string, $i, 1);
    		$keychar = substr($key, ($i % strlen($key))-1, 1);
    		$char = chr(ord($char)+ord($keychar));
    		$result .= $char;
    	}
    	return base64_encode($result);
    }

?>
