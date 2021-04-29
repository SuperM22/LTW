<?php

//START getCategory
function getCategory($mysqli, $categoria) {

    $query = "SELECT titolo, anteprima FROM film WHERE categoria='$categoria'";

    $json_films = '{ "films" : [';

    $counter = 0;

    if ($result = $mysqli->query($query)) {

        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {

            $json_films .= json_encode($row);

            $counter++;

            if($counter != mysqli_num_rows($result)){
                $json_films .= ",";
            }

        }

        $json_films .= "]}";

    }

    return $json_films;

}//END getCategory

 ?>
