// 1. Load if undefined ready()
// 2. Get JSON data-toggle getData()
// 3. Initilize initialize()

var map;
var data;
var ready = function() {
  if (typeof google === 'undefined' ) {
      var script = document.createElement('script');
      script.type = 'text/javascript';
      script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' + 'libraries=places&'+'callback=getData';
      document.body.appendChild(script);
  } else { getData(); }
};

var getData = function() {
  var markers = $("#map-canvas").data('map-markers');
  $.getJSON( markers, function( data ) {
    if ( typeof data.anchorage !== 'undefined' ) {
      initialize(data, "anchorage");
    } else if ( typeof data.locations !== 'undefined' ) {
      initialize(data, "region");
    }
  });
};

$( document ).ready(function() {
  if ($("#map-canvas").length) { ready(); }
});

var initialize = function(data, type) {
  var infowindow = null;

  if (type === "anchorage") { // MAP for Anchorage Show Page
  var anchorage = data.anchorage;
  var spots = data.spots;


  if (typeof anchorage !== 'undefined' && typeof google !== 'undefined') {
  var mapOptions = {
    zoom: 15,
    center: {lat: anchorage.lat, lng: anchorage.lng },
    mapTypeId: google.maps.MapTypeId.SATELLITE,
    disableDefaultUI: false,
    scrollwheel: false,
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

      var image = {
      url:"https://storage.googleapis.com/anchorage/assets/marker-large.png",
      size: new google.maps.Size(20, 32),
      scaledSize: new google.maps.Size(20, 32)
      };

      var user_image = {
      url:"https://storage.googleapis.com/anchorage/assets/marker-orange-large.png",
      size: new google.maps.Size(20, 32),
      scaledSize: new google.maps.Size(20, 32)
      };

    setLocationMarkers(map, anchorage, spots);
  }

    } else if (type === "region") { // MAP for Region Show
      var locations = data.locations;

      if (typeof locations !== 'undefined' && typeof google !== 'undefined') {
        var mapOptions = {
          zoom: 8,
          center: { lat: locations[0].lat, lng: locations[0].lng },
          mapTypeId: google.maps.MapTypeId.SATELLITE,
          scrollwheel: false,
        };
        var map = new google.maps.Map(document.getElementById('map-canvas'),
                                      mapOptions);

        setRegionMarkers(map, locations);
      }
    }
};


function setLocationMarkers(map, anchorage, spots) {

  var image = {
  url:"https://storage.googleapis.com/anchorage/assets/marker-large.png",
  size: new google.maps.Size(20, 32),
  scaledSize: new google.maps.Size(20, 32)
  };

  var user_image = {
  url:"https://storage.googleapis.com/anchorage/assets/marker-orange-large.png",
  size: new google.maps.Size(20, 32),
  scaledSize: new google.maps.Size(20, 32)
  };


    var content = '<h3>'+anchorage.name+'</h3>';
    var myLatLng = new google.maps.LatLng(anchorage.lat, anchorage.lng);
    var infowindow = new google.maps.InfoWindow({
      content: content
      });
    var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: image,
        title: anchorage.name,
        url: anchorage.url
      });

      google.maps.event.addListener(marker, 'click', (function(mm, tt) {
        return function() {
          infowindow.setContent(tt);
          infowindow.open(map, mm);
        };
      })(marker, content));

      for (var i = 0; i < spots.length; i++) {
        var spot = spots[i];
        var content = '<h5><a href="/'+spot.username+'">'+spot.username+'</a></h5><p><i class="fa fa-anchor"></i> Anchored Right Here!</p>';
        var infowindow = new google.maps.InfoWindow({
          content: content
          });
        var spotMarker = new google.maps.Marker({
            position: { lat:spot.lat, lng:spot.lng },
            map: map,
            icon: user_image,
            title: spot.username,
            url: "/"+spot.username
          });

          google.maps.event.addListener(spotMarker, 'click', (function(mm, tt) {
            return function() {
              infowindow.setContent(tt);
              infowindow.open(map, mm);
            };
          })(spotMarker, content));
      }

}

function setRegionMarkers(map, locations) {

  var image = {
  url:"https://storage.googleapis.com/anchorage/assets/marker-large.png",
  size: new google.maps.Size(20, 32),
  scaledSize: new google.maps.Size(20, 32)
  };


  for (var i = 0; i < locations.length; i++) {
    var anchorage = locations[i];
    var content = '<h3>'+anchorage.name+'</h3> <h5><i class="fa fa-binoculars"></i> <a href="'+anchorage.url+'">Explore '+anchorage.name+'</a></h5>';
    var myLatLng = new google.maps.LatLng(anchorage.lat, anchorage.lng);
    var infowindow = new google.maps.InfoWindow({
      content: content
      });
    var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: image,
        title: anchorage.name,
        url: anchorage.url
      });

      google.maps.event.addListener(marker, 'click', (function(mm, tt) {
        return function() {
          infowindow.setContent(tt);
          infowindow.open(map, mm);
        };
      })(marker, content));
  }
}
