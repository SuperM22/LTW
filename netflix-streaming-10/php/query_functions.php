<?php

//START getFilm
function getFilm($mysqli, $titolo) {

    $query = "SELECT f.categoria, f.titolo, f.video, f.anteprima, f.durata, f.descrizione, f.annopubblicazione, f.minutaggio
              FROM film f
              WHERE f.titolo='$titolo'";

    $json_film = '{ "film" : [';

    $counter = 0;

    if ($result = $mysqli->query($query)) {

        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {

            $json_film .= json_encode($row);

            $counter++;

            if($counter != mysqli_num_rows($result)){
                $json_film .= ",";
            }

        }

        $json_film .= "]}";

    }

    return $json_film;

}//END getFilm


//START getCategory
function getCategory($mysqli, $categoria) {

    $query = "SELECT f.categoria, f.titolo, f.video, f.anteprima, f.durata, f.descrizione, f.annopubblicazione, f.minutaggio
              FROM film f
              WHERE f.categoria='$categoria'";

    $json_film = '{ "film" : [';

    $counter = 0;

    if ($result = $mysqli->query($query)) {

        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
            // echo $row['descrizione']."<br>";
            $json_film .= json_encode($row);

            $counter++;

            if($counter != mysqli_num_rows($result)){
                $json_film .= ",";
            }

        }

        $json_film .= "]}";

    }

    return $json_film;

}//END getCategory


//START getCast
function getCast($mysqli, $titolo) {

    $query = "SELECT a.nome as nomeattore,
                     a.cognome as cognomeattore, r.nome as nomeregista, r.cognome as cognomeregista
              FROM film f, attore a, regista r, cast c
              WHERE c.attore_id = a.id and
                    c.film_id = f.id and
                    c.regista_id = r.id and
                    f.titolo='$titolo'";

    $json_film = '{ "film" : [';

    $counter = 0;

    if ($result = $mysqli->query($query)) {

        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
            // echo $row['nomeattore']." ".$row['cognomenomeattore']." ".$row['nomeregista']." ".$row['cognomeregista']." ".
            $json_film .= json_encode($row);

            $counter++;

            if($counter != mysqli_num_rows($result)){
                $json_film .= ",";
            }

        }

        $json_film .= "]}";

    }

    return $json_film;

}//END getCast


//START addPreferiti
function addPreferiti($mysqli, $titolo, $cookie) {

    $query = "SELECT id
              from film
              where titolo = '$titolo'";

    $result = $mysqli->query($query);
    $row_film = $result->fetch_array();

    $query = "SELECT email
              from utente
              where cookie = '$cookie'";

    $result = $mysqli->query($query);
    $row_utente = $result->fetch_array();

    $query = "INSERT INTO preferito (film_id, utente_id) VALUES ('$row_film[0]','$row_utente[0]')";
    $result = $mysqli->query($query);
    return $mysqli->insert_id;

}//END addPreferiti

//START getPreferiti
function getPreferiti($mysqli, $cookie) {

      $query = "SELECT f.titolo, f.anteprima, f.descrizione, f.video, f.durata, f.categoria, f.annopubblicazione, f.minutaggio
              from film f, preferito p
              where f.id = p.film_id
              and p.utente_id = (select email
                                 from utente
                                 where cookie = '$cookie')";

      $json_film = '{ "film" : [';

      $counter = 0;

      if ($result = $mysqli->query($query)) {

          while ($row = $result->fetch_array(MYSQLI_ASSOC)) {

              $json_film .= json_encode($row);

              $counter++;

              if($counter != mysqli_num_rows($result)){
                  $json_film .= ",";
              }

          }

          $json_film .= "]}";

      }

      return $json_film;

}//END getPreferiti

//START deletePreferiti
function deletePreferiti($mysqli, $titolo, $cookie) {

    $query = "SELECT id
              from film
              where titolo = '$titolo'";

    $result = $mysqli->query($query);
    $row_film = $result->fetch_array();

    $query = "SELECT email
              from utente
              where cookie = '$cookie'";

    $result = $mysqli->query($query);
    $row_utente = $result->fetch_array();

    $query = "DELETE FROM preferito WHERE preferito.film_id = '$row_film[0]' AND preferito.utente_id = '$row_utente[0]'";
    $result = $mysqli->query($query);
    return $result;

}//END deletePreferiti

//START getKeepFilm
function getKeepFilm($mysqli) {

      $query = "SELECT f.titolo, f.anteprima, f.descrizione, f.video, f.durata, f.categoria, f.annopubblicazione, f.minutaggio
              from film f
              where f.minutaggio != f.durata
              and f.minutaggio !='00:00:00'";

      $json_film = '{ "film" : [';

      $counter = 0;

      if ($result = $mysqli->query($query)) {

          while ($row = $result->fetch_array(MYSQLI_ASSOC)) {

              $json_film .= json_encode($row);

              $counter++;

              if($counter != mysqli_num_rows($result)){
                  $json_film .= ",";
              }

          }

          $json_film .= "]}";

      }

      return $json_film;

}//END getKeepFilm

//START getAgainFilm
function getAgainFilm($mysqli) {

      $query = "SELECT f.titolo, f.anteprima, f.descrizione, f.video, f.durata, f.categoria, f.annopubblicazione, f.minutaggio
              from film f
              where f.minutaggio = f.durata";

      $json_film = '{ "film" : [';

      $counter = 0;

      if ($result = $mysqli->query($query)) {

          while ($row = $result->fetch_array(MYSQLI_ASSOC)) {

              $json_film .= json_encode($row);

              $counter++;

              if($counter != mysqli_num_rows($result)){
                  $json_film .= ",";
              }

          }

          $json_film .= "]}";

      }

      return $json_film;

}//END getAgainFilm

//START updateTime
function updateTime($mysqli, $titolo, $time) {

    $query = "UPDATE film SET minutaggio = '$time' WHERE film.titolo = '$titolo'";

    $result = $mysqli->query($query);
    return $mysqli->insert_id;

}//END updateTime

//START setSearch
function setSearch($mysqli, $query) {

    $query = "SELECT f.titolo, f.anteprima, f.descrizione, f.video, f.durata, f.categoria, f.annopubblicazione, f.minutaggio
              FROM film f
              WHERE f.titolo LIKE '%$query%'";

    $json_film = '{ "film" : [';

    $counter = 0;

    if ($result = $mysqli->query($query)) {

        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {

            $json_film .= json_encode($row);

            $counter++;

            if($counter != mysqli_num_rows($result)){
                $json_film .= ",";
            }

        }

        $json_film .= "]}";

    }

    return $json_film;
}//END setSearch

//START getFilmActors
function getFilmActors($mysqli, $attore) {

    $query = "SELECT f.categoria, f.titolo, f.video, f.anteprima, f.durata, f.descrizione, f.annopubblicazione, f.minutaggio
              FROM film f
              WHERE f.ID in (SELECT c.film_id
                             FROM cast c
                             WHERE c.attore_id in (SELECT a.id
                                                    FROM attore a
                                                    WHERE a.nome = '$attore->nomeattore'
                                                    AND a.cognome = '$attore->cognomeattore'))";


    $json_film = '{ "film" : [';

    $counter = 0;

    if ($result = $mysqli->query($query)) {

        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {

            $json_film .= json_encode($row);

            $counter++;

            if($counter != mysqli_num_rows($result)){
                $json_film .= ",";
            }

        }

        $json_film .= "]}";

    }

    return $json_film;

}//END getFilmActors

//START getActors
function getActors($mysqli, $titolo) {

    $query = "SELECT a.nome as nomeattore,
                     a.cognome as cognomeattore
              FROM film f, attore a, cast c
              WHERE c.attore_id = a.id and
                    c.film_id = f.id and
                    f.titolo='$titolo'";

    $json_film = '{ "film" : [';

    $counter = 0;

    if ($result = $mysqli->query($query)) {

        while ($row = $result->fetch_array(MYSQLI_ASSOC)) {

            $json_film .= json_encode($row);

            $counter++;

            if($counter != mysqli_num_rows($result)){
                $json_film .= ",";
            }

        }

        $json_film .= "]}";

    }

    return $json_film;

}//END getActors

//START potrebbeInteressare
function potrebbeInteressare($mysqli, $titolo) {
    $query = "SELECT f.ID, f.categoria
              FROM film f
              WHERE f.titolo='$titolo'";



    $result = $mysqli->query($query);
    $categoria_film = $result->fetch_array(MYSQLI_ASSOC)['categoria'];

    $cat = getCategory($mysqli, $categoria_film);
    $cast = getActors($mysqli, $titolo);
    //continua da qui
    // echo $cast;

    // echo "<br><br>";

    $prova = json_decode($cast);
    // print_r($prova);
    // echo "<br><br>";
    // echo $prova->film[0]->nomeattore;
    // echo "<br><br>";
    // echo count($prova->film);
    // echo "<br><br>";

    $filmActors = '{ "cast" : [';

    for($i=0; $i<count($prova->film); $i++){
        // echo $prova->film[$i]->nomeattore;
        $filmActors .= getFilmActors($mysqli,$prova->film[$i]);

        if($i != count($prova->film)-1){
            $filmActors .= ",";
        }

    }
    $filmActors .= "]}";
    // echo $filmActors."<br><br>";
    // echo $cat."<br><br>";

    $json_all = '{ "all" : [{ "cat" : [';

    $json_all .= $cat;

    $json_all .= "]}";

    $json_all .= ",";

    $json_all .= $filmActors;

    $json_all .= "]}";



    return $json_all;

}//END potrebbeInteressare


 ?>
