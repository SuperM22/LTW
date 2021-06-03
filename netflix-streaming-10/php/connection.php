<?php
  $GLOBALS['path'] = "localhost";
  $GLOBALS['usr'] = "root";
  $GLOBALS['psw'] = "";
  $GLOBALS['db'] = "netflix";

  function dbConnection(){
      $mysqli = new mysqli($GLOBALS['path'], $GLOBALS['usr'], $GLOBALS['psw'], $GLOBALS['db']);
      if ($mysqli->connect_errno) {
             echo "Connect failed: %s\n", $mysqli->connect_error;
             exit();
         }
    
         return $mysqli;
  }
  /*$mysqli = dbConnection();
  echo "ok";

  $result = $mysqli -> query("SELECT * FROM utente where email = 'ciarpaglini.lorenzo@gmail.com'");
  $count = mysqli_num_rows($result);
  echo $count;*/

?>
