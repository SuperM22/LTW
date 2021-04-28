<?php
    include "connection.php";

    $email = $_POST['email'];
    $pass = $_POST['password'];

    $mysqli = new mysqli($GLOBALS['path'], $GLOBALS['usr'], $GLOBALS['psw'], $GLOBALS['db']);
    if ($mysqli->connect_errno) {
           echo "Connect failed: %s\n", $mysqli->connect_error;
           exit();
       }


   $result = $mysqli -> query("SELECT * FROM utente where email = '$email' AND password = '$pass'");
   $count = mysqli_num_rows($result);
   // $row = mysqli_fetch_array($result);

   if($count == 1){
       echo "ok";
   }else{
       $error = "Your Login Name or Password is invalid";
       die($error) ;
   }
?>
