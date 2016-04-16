function getCity(){
    $.getJSON('https://geoip-db.com/json/geoip.php?jsonp=?')
        .done (function(location)
        {
            alert(location.city)
        });

}
