//$(document).on("ready page:load", function() {

function initialize() {
  var lat = $('#map-canvas').data('lat');
  var long = $('#map-canvas').data('long');
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
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
      '&signed_in=true&callback=initialize';
  document.body.appendChild(script);
}

$(document).on("ready page:load", loadScript);
