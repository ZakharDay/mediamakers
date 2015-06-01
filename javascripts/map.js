var map;
var infowindow;
var marker;
var myLatlng;
var image;

function initialize(contentString) {

  var styles = [
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        { "saturation": -100 },
        { "lightness": -8 },
        { "gamma": 1.18 }
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "geometry",
      "stylers": [
        { "saturation": -100 },
        { "gamma": 1 },
        { "lightness": -24 }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        { "saturation": -100 }
      ]
    },
    {
      "featureType": "administrative",
      "stylers": [
        { "saturation": -100 }
      ]
    },
    {
      "featureType": "transit",
      "stylers": [
        { "saturation": -100 }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry.fill",
      "stylers": [
        { "saturation": -100 }
      ]
    },
    {
      "featureType": "road",
      "stylers": [
        { "saturation": -100 }
      ]
    },
    {
      "featureType": "administrative",
      "stylers": [
        { "saturation": -100 }
      ]
    },
    {
      "featureType": "landscape",
      "stylers": [
        { "saturation": -100 }
      ]
    },
    {
      "featureType": "poi",
      "stylers": [
        { "saturation": -100 }
      ]
    }
  ];

  var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});
  var mapCanvas = document.getElementById('map');
	var mapElement = $('.map');
  var diLocation = new google.maps.LatLng(55.758478, 37.61053);

  var mapOptions = {
    zoom: 17,
    // center: new google.maps.LatLng(55.7595764, 37.6119288),
    // center: new google.maps.LatLng(55.7589764, 37.6112288),
    center: new google.maps.LatLng(55.758478, 37.61053),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    navigationControl: false,
    streetViewControl: false,
    mapTypeControl: false,
    scaleControl: false,
    panControl: false,
    zoomControl: false,
    mapTypeControl: false,
    scaleControl: false,
    streetViewControl: false,
    overviewMapControl: false,
    scrollwheel: false
  }

  map = new google.maps.Map(mapCanvas, mapOptions);

  map.mapTypes.set('map_style', styledMap);
  map.setMapTypeId('map_style');

  var image = new google.maps.MarkerImage(
    'images/map_pointer.png',
    new google.maps.Size(20,31),
    new google.maps.Point(0,0),
    new google.maps.Point(1,36)
  );

  marker = new google.maps.Marker({
    position: diLocation,
    map: map,
    clickable: true,
    title: 'DI Telegraph',
    icon: image
  });

  google.maps.event.addListener(marker, 'click', function() {
    marker.setIcon(image);
    infowindow.open(map, marker);
  });
}

$(document).on('ready page:load', function(){
  initialize();
});
