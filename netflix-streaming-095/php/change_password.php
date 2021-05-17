<?php
    include "connection.php";


    $mysqli = dbConnection();

    $oldpass = $_POST['oldpass'];
    $newpass = $_POST['newpass'];
    $cookie = $_POST['cookie'];


    $encrypted_password_old = md5($oldpass);
    $encrypted_password_new = md5($newpass);


    $result = $mysqli -> query("SELECT * FROM utente where cookie = '$cookie' AND password = '$encrypted_password_old'");
    $count = mysqli_num_rows($result);



    if($count == 1){
        $result = $mysqli->query("UPDATE utente SET password = '$encrypted_password_new' WHERE utente.cookie = '$cookie'");

        echo "ok";
    }else{
        $error = "Password is not correct";
        die($error) ;
    }





    //Ricordati che devi settare pythonw.exe come variabile di ambiente in windows

?>
