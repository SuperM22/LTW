<?php
    include "connection.php";
    include "query_functions.php";

    $mysqli = dbConnection();

    $command = $_GET['command'];
    // $command = 'getCategory';
    //$command = "getFilm";
    // $command = "getCast";
    //$command = "addPreferiti";
    //$command = "getPreferiti";
    // $command = "correlati";

    switch($command){

        case 'getFilm':
        echo getFilm($mysqli, $_GET['titolo']);
        //echo getCategory($mysqli, 'azione');
        break;

        case 'getCategory':
        echo getCategory($mysqli, $_GET['categoria']);
        // echo getCategory($mysqli, 'azione');
        break;

        case 'getCast':
        echo getCast($mysqli, $_GET['titolo']);
        // echo getCast($mysqli, "Non e' un paese per vecchi");
        break;

        case 'addPreferiti':
        echo addPreferiti($mysqli, $_GET['titolo'], $_GET['cookie']);
        //echo addPreferiti($mysqli, 'hannibal');
        break;

        case 'getPreferiti':
        echo getPreferiti($mysqli, $_GET['cookie']);
        break;

        case 'deletePreferiti':
        echo deletePreferiti($mysqli, $_GET['titolo'], $_GET['cookie']);
        break;

        case 'getKeepFilm':
        echo getKeepFilm($mysqli);
        break;

        case 'getAgainFilm':
        echo getAgainFilm($mysqli);
        break;

        case 'updateTime':
        echo updateTime($mysqli, $_GET['titolo'], $_GET['time']);
        break;

        case 'setSearch':
        echo setSearch($mysqli, $_GET['query']);
        break;

        case 'correlati':
        echo potrebbeInteressare($mysqli, $_GET['titolo']);
        // echo "final".potrebbeInteressare($mysqli, "Looper");
        break;

        default:
            break;
    }

?>
