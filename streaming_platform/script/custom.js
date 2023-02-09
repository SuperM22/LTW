class Time{
    constructor(time){
        var vec = time.split(":");
        this.hours = parseInt(vec[0]);
        this.minutes = parseInt(vec[1]);
        this.seconds = parseInt(vec[2]);
    }
    toSeconds(){
        return this.hours * 3600 + this.minutes * 60 + this.seconds;
    }
}

class Secondi{
    constructor(time){
        this.hours = Math.floor(time / 3600);
        this.minutes = Math.floor( (time - 3600*this.hours) / 60 );
        this.seconds = time - 3600*this.hours - 60*this.minutes;
    }
    toTimes(){
        return this.hours + ":" + this.minutes + ":" + this.seconds;
    }
}

//START setPage()
function setPage(json, type){

    var section = document.getElementById("section");

    var no_film_html = "<div class='container'></div><div class='riga'><h2>FILM</h2><div class='nav'><div class='nav-bar'></div></div><div class='prev'> < </div>  <div class='next'> > </div></div>";
    var preferiti = getPreferiti();
    console.log("che stampa: ",preferiti);
    console.log(json.film.length);

    if(json.film.length == 0){
        section.innerHTML = no_film_html;
        return;
    }


    var slider_html = "";
    var slide_html = "<div class='slides'>";
    var img_html = "<img src=";
    var content_html = "<div class='content'>";
    var h2_html = "<h2>";
    var p_html = "</h2><p>";
    var a_html = "</p><a href=";
    var i_play_html = "<i class='fa fa-play' aria-hidden='true'></i>Guarda</a>";
    var i_add_html = "<button type='button' onclick='changePreferenza(this)' name='";
    var end_slide_html = "<i class='fa fa-plus'></i><span>Aggiungi ai preferiti</span></button><button onclick=potrebbeInteressare(this)><span>Potrebbe Interessarti</span></button></div></div>";

    var colon_html = "";
    var colonna_html;

    var container_html = "<div class='container'>";
    var riga_html = "<div class='riga'>"

    if(type == "categoria"){
        var h2_riga_html = "<h2>FILM " + json.film[0].categoria + "</h2>";
    }else if(type == "preferiti"){
        var h2_riga_html = "<h2>LA MIA LISTA</h2>";
    }else if(type == "keep"){
        var h2_riga_html = "<h2>CONTINUA A GUARDARE</h2>";
    }else if(type == "again"){
        var h2_riga_html = "<h2>GUARDA DI NUOVO</h2>";
    }else if(type == "film"){
        var h2_riga_html = "<h2>FILM</h2>";
    }else if(type == "correlati"){
        var h2_riga_html = "<h2>FILM CORRELATI</h2>";
    }

    var nav_html = "<div class='nav'>";
    var nav_bar_html = "<div class='nav-bar'>";

    riga_html += h2_riga_html + nav_html + nav_bar_html;

    var cast;

    $.each( json.film, function( i, film ) {
            end_slide_html = "<i class='fa fa-plus'></i><span>Aggiungi ai preferiti</span></button><button onclick=potrebbeInteressare(this) name="
            end_slide_html += "'" + film.titolo + "'><span>Potrebbe Interessarti</span></button></div></div>";

            cast = getCast(film.titolo);


            img_html += "'" + film.anteprima + "'>";
            h2_html += film.titolo;

            //Controllo se ci sono tutti e 3 gli attori
            if(cast[2]==undefined){
                p_html += film.descrizione + "<br><br>" + "Attori: " + cast[1] + "<br>" + "Regista: " + cast[0] + "<br>" + "Categoria: " + film.categoria;

            }else if(cast[3]==undefined){
                p_html += film.descrizione + "<br><br>" + "Attori: " + cast[1] + ", " + cast[2] +
                            "<br>" + "Regista: " + cast[0] + "<br>" + "Categoria: " + film.categoria;

            }else{
                p_html += film.descrizione + "<br><br>" + "Attori: " + cast[1] + ", " + cast[2] + ", " + cast[3] +
                            "<br>" + "Regista: " + cast[0] + "<br>" + "Categoria: " + film.categoria;
            }



            a_html += "'vid.html?video=" + film.video + "&titolo=" + film.titolo + "&time=" + film.minutaggio + "'>";

            i_add_html += film.titolo + "'>";

            for(elem of preferiti){
                if(film.titolo == elem){
                    end_slide_html = "<i class='fa fa-check'></i><span>Salvato</span></button><button onclick=potrebbeInteressare(this) name=";
                    end_slide_html += "'" + film.titolo + "'><span>Potrebbe Interessarti</span></button></div></div>";
                }
            }


            slider_html += slide_html + img_html + content_html + h2_html + p_html + a_html + i_play_html
                        + i_add_html + end_slide_html;

            if(i==0){
                colonna_html = "<div class='colonna active'>";
            }else{
                colonna_html = "<div class='colonna'>";
            }
            colon_html += colonna_html + img_html + "</div>";

            img_html = "<img src=";
            h2_html = "<h2>";
            p_html = "</h2><p>";
            a_html = "</p><a href=";
            i_add_html = "<button type='button' onclick='changePreferenza(this)' name='";


        });

        container_html += slider_html + "</div>";
        riga_html += colon_html + "</div></div><div class='prev'> < </div>  <div class='next'> > </div></div>";
        final_html = container_html + riga_html;


        section.innerHTML = final_html;
        setSlider();

}//END setPage

//START getCast
function getCast(titolo){
    var cast = [];

    $.ajax({
        url: "php/query.php",
        dataType: 'json',
        async: false,
        data: { command: 'getCast', titolo: titolo },
        success: function(json){
            var nome = json.film[0].nomeregista + " " + json.film[0].cognomeregista;
            cast.push(nome);

            $.each( json.film, function( i, film ) {
                nome = film.nomeattore + " " + film.cognomeattore;
                cast.push(nome);

            });

        }
    });

    // $.getJSON( "php/query.php", { command: 'getCast', titolo: titolo }, function( json ) {
    //     var nome = json.film[0].nomeregista + " " + json.film[0].cognomeregista;
    //     cast.push(nome);
    //
    //     $.each( json.film, function( i, film ) {
    //         nome = film.nomeattore + " " + film.cognomeattore;
    //         cast.push(nome);
    //
    //     });
    //
    // });
    return cast;
}
//END getCast

//START setSlider
function setSlider(){
    const slides = document.querySelectorAll('.slides');
    const dots = document.querySelectorAll('.colonna');
    let slideIndex = 0;
    showSlide();
    function showSlide(n){
        if(slideIndex > slides.length - 1){
            slideIndex = 0;
        }
        if(slideIndex < 0){
            slideIndex = slides.length - 1;
        }
        for(let i=0; i<slides.length; i++){
            slides[i].style.display = "none";
        }
        for(let i=0; i<dots.length; i++){
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex].style.display = "block";
        dots[slideIndex].className += " active";
    }
    dots.forEach((item, index) =>{
        item.addEventListener('click', ()=>{
            showSlide(slideIndex = index);
        })
    });

    const nav = document.querySelector('.nav');
    const prev = document.querySelector('.prev');
    const next = document.querySelector('.next');
    next.addEventListener('click', ()=>{
        nav.scrollLeft += dots[0].offsetWidth;
        showSlide(slideIndex += 1);
        if(slideIndex === 0){
            nav.scrollLeft = 0;
        }
    })
    prev.addEventListener('click', ()=>{
        nav.scrollLeft -= dots[0].offsetWidth;
        showSlide(slideIndex -= 1);
        if(slideIndex === slides.length - 1){
            nav.scrollLeft = nav.scrollWidth;
        }
    })
}//END setSlider

//START addPreferiti
function addPreferiti(titolo, myCookie){
    $.ajax({
        url: "php/query.php",
        data: { command: 'addPreferiti', titolo: titolo, cookie: myCookie},
        success: function(data){

        }
    });
}//END addPreferiti

//START deletePreferiti
function deletePreferiti(titolo, myCookie){
    $.ajax({
        url: "php/query.php",
        data: { command: 'deletePreferiti', titolo: titolo, cookie: myCookie },
        success: function(data){
            //getPreferiti();

        }
    });
}//END deletePreferiti

//START getPreferiti
function getPreferiti(){
    var result=[];
    var myCookie = getCookie("netflix");
    if (myCookie == null) {
        myCookie = sessionStorage.getItem("netflix");
    }
    console.log("dentro getPreferiti ",myCookie);
    $.ajax({
        url: "php/query.php",
        dataType: 'json',
        async: false,
        data: { command: 'getPreferiti', cookie: myCookie },
        success: function(json){


            $.each(json.film, function(i, film){
                result.push(film.titolo);
            });

        }
    });
    return result;
}//END getPreferiti


//START setPreferiti
function setPreferiti(){
    var myCookie = getCookie("netflix");
    if (myCookie == null) {
        myCookie = sessionStorage.getItem("netflix");
    }
    $.getJSON( "php/query.php", { command: 'getPreferiti', cookie: myCookie }, function( json ) {
        setPage(json,"preferiti");
    });
}//END setPreferiti


//START getCategory
function getCategory(categoria){
    $.getJSON( "php/query.php", { command: 'getCategory', categoria: categoria }, function( json ) {
        setPage(json,"categoria");
    });

}//END getCategory

//START getFilm
function getFilm(titolo){

    $.getJSON( "php/query.php", { command: 'getFilm', titolo: titolo }, function( json ) {
        setPage(json,"film");
    });
}//END getFilm

//START getKeepFilm
function getKeepFilm(){
    console.log("entrato");
    $.getJSON( "php/query.php", { command: 'getKeepFilm' }, function( json ) {
        setPage(json,"keep");
    });
}//END getKeepFilm

//START getAgainFilm
function getAgainFilm(){

    $.getJSON( "php/query.php", { command: 'getAgainFilm' }, function( json ) {
        setPage(json,"again");
    });
}//END getAgainFilm

//START updateTime
function updateTime(titolo, time){
    $.ajax({
        url: "php/query.php",
        data: { command: 'updateTime', titolo: titolo, time: time },
        success: function(data){

        }
    });
}//END updateTime

//START changePreferenza
function changePreferenza(el){
    var i_html = el.children[0];
    var span = el.children[1];
    var myCookie = getCookie("netflix");
    if (myCookie == null) {
        myCookie = sessionStorage.getItem("netflix");
    }

    if(span.innerHTML == "Salvato"){
        i_html.setAttribute("class","fa fa-plus");
        span.innerHTML = "Aggiungi ai preferiti";
        deletePreferiti(el.name, myCookie);
    }else{
        i_html.setAttribute("class","fa fa-check");
        span.innerHTML = "Salvato";
        addPreferiti(el.name, myCookie);
    }

}//END changePreferenza

//START setSearch
function setSearch(el){
    var searchText = el.value;
    console.log(searchText);

    if (searchText != "") {
      $.ajax({
        url: "php/query.php",
        dataType: 'json',
        data: { command: 'setSearch', query: searchText },
        success: function (json) {
            setPage(json,"film");

        }
      });
    } else {
      // $("#show-list").html("");
    }
}//END setSearch

//START getCookie
function getCookie(name) {
    var dc = document.cookie;
    var prefix = name + "=";
    var begin = dc.indexOf("; " + prefix);
    if (begin == -1) {
        begin = dc.indexOf(prefix);
        if (begin != 0) return null;
    }
    else
    {
        begin += 2;
        var end = document.cookie.indexOf(";", begin);
        if (end == -1) {
        end = dc.length;
        }
    }
    // because unescape has been deprecated, replaced with decodeURI
    //return unescape(dc.substring(begin + prefix.length, end));
    return decodeURIComponent(dc.substring(begin + prefix.length, end));
}//END getCookie

function check(){
    if (document.getElementById("show-menu").checked == true){
        document.getElementById("show-menu").click();
    }
}//END CHECK

function logout(){
    document.cookie="netflix=;expires=Thu, 01 Jan 1970 00:00:00 GMT;path=/;"
    sessionStorage.removeItem('netflix');
}
var bella;
function potrebbeInteressare(el){

    $.ajax({
      url: "php/query.php",
      dataType: 'json',
      data: { command: 'correlati', titolo: el.name },
      success: function (json) {
          console.log(json);
          bella = json;

          json_final = { film: [] };

          var set_film = new Set();
          var count_cat = 0;

          $.each(json.all[0].cat[0].film, function(i, film){
              if(count_cat >= 4) return;
              if(set_film.has(film.titolo)) return;
              if(film.titolo == el.name) return;
              set_film.add(film.titolo);
              json_final.film.push(film);
              count_cat++;

          });

          var count_cast = 0;

          $.each(json.all[1].cast, function(i, act){
              // console.log("act: ",act);
              $.each(act.film, (i, film) => {
                  // console.log("film:",film);
                  if(count_cast >= 4) return;
                  if(set_film.has(film.titolo)) return;
                  if(film.titolo == el.name) return;
                  set_film.add(film.titolo);
                  json_final.film.push(film);
                  count_cast++;
              });

          });
          setPage(json_final,'correlati');

        }
    });


}
