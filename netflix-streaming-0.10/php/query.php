<?php
    include "connection.php";
    include "query_functions.php";

    $mysqli = dbConnection();

    $command = $_GET['command'];
    //$command = 'getCategory';
    switch($command){

        case 'getCategory':
        echo getCategory($mysqli, $_GET['categoria']);
        //echo getCategory($mysqli, 'azione');
        break;

        default:
            break;
    }

?>
