//$(document).on("ready page:load", function() {

function initialize() {
  var lat = $('#map-attr').data('lat');
  var long = $('#map-attr').data('long');
  var mapOptions = {
    zoom: 14,
    center: new google.maps.LatLng(lat, long),
    mapTypeId: google.maps.MapTypeId.SATELLITE,
    disableDefaultUI: true,
    zoomControl: true
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
}

function loadScript() {
  if ( $( "#map-canvas" ).length ) { //only initialize on map pages
    if (typeof google == "undefined") { //prevent duplicate loading
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
        '&signed_in=true&callback=initialize';
    document.body.appendChild(script);
    }else{
      initialize();
    }
  }
}


  $(document).on("ready page:load", loadScript);
