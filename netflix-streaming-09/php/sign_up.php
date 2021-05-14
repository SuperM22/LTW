<?php
    include "connection.php";

    $mysqli = dbConnection();

    $email = $_POST['email'];
    $pass = $_POST['password'];
    $encrypted_password = md5($pass);

    $result = $mysqli -> query("SELECT * FROM utente where email = '$email'");
    $count = mysqli_num_rows($result);
    // $row = mysqli_fetch_array($result);

    if($count == 0){
        $result = $mysqli->query("INSERT INTO utente (email, password) VALUES ('$email','$encrypted_password')");
        echo "ok";
    }else{
        $error = "Account already Exist!";
        die($error) ;
    }
?>
