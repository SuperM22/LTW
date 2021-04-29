function getCategory(){

    $.getJSON( "php/query.php", { command: 'getCategory', categoria: 'azione' }, function( json ) {
        console.log(json);
        $.each( json.films, function( i, film ) {
            var user_html =
                        "<img " + "id='" + film.titolo + "'" + "src='" + film.anteprima + "'>";

            $("#prova").append( user_html );


        });

    });

}
//END getCategory
