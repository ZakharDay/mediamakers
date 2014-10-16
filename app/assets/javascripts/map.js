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

  // var styles = [
  //   {
  //     "featureType": "landscape",
  //     "stylers": [
  //       {"hue": "#FFC500"},
  //       {"saturation": 16.666666666666657},
  //       {"lightness": -12.470588235294116},
  //       {"gamma": 1}
  //     ]
  //   },
  //   {
  //     "featureType": "road.highway",
  //     "stylers": [
  //       {"hue": "#FF0300"},
  //       {"saturation": -100},
  //       {"lightness": 61.39999999999998},
  //       {"gamma": 1}
  //     ]
  //   },
  //   {
  //     "featureType": "road.arterial",
  //     "stylers": [
  //       {"hue": "#FFD300"},
  //       {"saturation": 18.987341772151908},
  //       {"lightness": -10.760784313725495},
  //       {"gamma": 1}
  //     ]
  //   },
  //   {
  //     "featureType": "road.local",
  //     "stylers": [
  //       {"hue": "#FFD800"},
  //       {"saturation": -26.000000000000014},
  //       {"lightness": -26.4313725490196},
  //       {"gamma": 1}
  //     ]
  //   },
  //   {
  //     "featureType": "water",
  //     "stylers": [
  //       {"hue": "#3A00FF"},
  //       {"saturation": -55.10204081632652},
  //       {"lightness": -71.13725490196079},
  //       {"gamma": 1}
  //     ]
  //   },
  //   {
  //     "featureType": "poi",
  //     "stylers": [
  //       {"hue": "#FFAF00"},
  //       {"saturation": 46.66666666666663},
  //       {"lightness": 10.823529411764724},
  //       {"gamma": 1}
  //     ]
  //   }
  // ];

  var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});
  var mapCanvas = document.getElementById('map');
	var mapElement = $('.map');
  var mapLat = mapElement.data('latitude');
  var mapLon = mapElement.data('longitude');
  var center = new google.maps.LatLng(mapLat, mapLon);
  var tribecaLocation = new google.maps.LatLng(55.752663, 37.566621);

  var mapOptions = {
    zoom: 15,
    center: center,
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
    overviewMapControl: false
  }

  map = new google.maps.Map(mapCanvas, mapOptions);

  map.mapTypes.set('map_style', styledMap);
  map.setMapTypeId('map_style');

  var image2 = new google.maps.MarkerImage(
    'http://tribecamoscow.ru/pointer-new.png',
    new google.maps.Size(44,57),
    new google.maps.Point(0,0),
    new google.maps.Point(22,57)
  );

  var image = new google.maps.MarkerImage(
    'http://tribecamoscow.ru/trans.gif',
    new google.maps.Size(1,1),
    new google.maps.Point(0,0),
    new google.maps.Point(1,-1)
  );

  marker = new google.maps.Marker({
    position: tribecaLocation,
    map: map,
    clickable: true,
    title: 'Tribeca',
    icon: image
  });

  infowindow = new google.maps.InfoWindow({
    content: contentString
  });

  google.maps.event.addListener(marker, 'click', function() {
    marker.setIcon(image);
    infowindow.open(map, marker);
  });

  google.maps.event.addListener(infowindow,'closeclick',function() {
    marker.setIcon(image2);
  });

	// if ($('#contacts').length) {
	// 	infowindow.open(map, marker);
	// }
}

// function OpenInfo() {
//   var image = new google.maps.MarkerImage(
//     'http://tribecamoscow.ru/trans.gif',
//     new google.maps.Size(1,1),
//     new google.maps.Point(0,0),
//     new google.maps.Point(1,1)
//   );
//
//   marker.setIcon(image);
//   infowindow.open(map,marker);
// }


$(document).on('ready page:load', function(){

  if ($('.map').length) {
    var width = $(window).width();

    // if (width < 2000){
      var contentString = '<div class="popup_map"><strong><br /></strong></div>';
    // } else {
      // var contentString = '<img style="margin: 20px; margin-top: 40px;" src="images/map_popup_logo_big.png" alt="" />'
    // }

    initialize(contentString);

    // function showPosition(pos){
    //   var directionsDisplay = new google.maps.DirectionsRenderer();
    //   var directionsService = new google.maps.DirectionsService();
    //
    //   var request = {
    //     origin: new google.maps.LatLng(pos.coords.latitude,pos.coords.longitude), //точка старта
    //     destination: new google.maps.LatLng(55.752663,37.566621), //точка финиша
    //     travelMode: google.maps.DirectionsTravelMode.DRIVING //режим прокладки маршрута
    //   };
    //
    //   directionsService.route(
    //     request, function(response, status) {
    //       if (status == google.maps.DirectionsStatus.OK) {
    //         directionsDisplay.setDirections(response);
    //       }
    //     }
    //   );
    //
    //   directionsDisplay.setMap(map);
    // }

    // $(".arrow").click(function(){
    //   if (navigator.geolocation) {
    //     navigator.geolocation.getCurrentPosition(showPosition);
    //   } else {
    //     alert("Geolocation is not supported by this browser.");
    //   }
    // });
  }

  // $(".close").click(function(){
  //   $(this).parent().hide();
  // });
});
