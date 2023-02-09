<?php
    include "connection.php";


    $mysqli = dbConnection();

    $email = $_POST['email'];


    $pass = randomPassword();

    // echo $pass;
    // echo "<br>";

    $encrypted_password = md5($pass);

    $result = $mysqli -> query("SELECT * FROM utente where email = '$email'");
    $count = mysqli_num_rows($result);
    // $row = mysqli_fetch_array($result);

    if($count == 1){
        $result = $mysqli->query("UPDATE utente SET password = '$encrypted_password' WHERE utente.email = '$email'");
        sendEmail($email, $pass);

        echo "ok";
    }else{
        $error = "Account doesn't Exist!";
        die($error) ;
    }

    
    //Ricordati che devi settare pythonw.exe come variabile di ambiente in windows
    function sendEmail($email, $pass){
        $call = "pythonw.exe ..\python\invia-mail.py ".$email." ".$pass;
        $tmp = exec($call);


    }

    function randomPassword() {
        $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
        $pass = ""; //remember to declare $pass as an array
        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        for ($i = 0; $i < 8; $i++) {
            $n = rand(0, $alphaLength);
            $pass .= $alphabet[$n];
        }
        return $pass; //turn the array into a string
    }
?>
