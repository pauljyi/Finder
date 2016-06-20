$( document ).ready(function() {
  var createLatitude = $("#event_latitude").val();
  var createLongitude = $("#event_longitude").val();
  var createLocation = new google.maps.LatLng(createLatitude,createLongitude);
  $("#event_location").geocomplete({
    map: "#create-map",
    mapOptions: { zoom: 12 },
    location: createLocation,
    markerOptions: {
      // icon: "<%= asset_path 'icons/funfinder-logo8.png' %>",
  
    }
  });

  $("#area-search-bar").geocomplete({details: "form" })


  // var frontLocation = new google.maps.LatLng(32.715738,-117.1610838);
  //
  // var map = $("#area-search-bar").geocomplete({
  //
  //   map: "#front-map",
  //   mapOptions: { zoom: 12 },
  //   location: frontLocation,
  //   circleOptions: {
  //     center: frontLocation,
  //     radius: 2 * 1609.344,
  //     fillColor: "#ff69b4",
  //     fillOpacity: 0.5,
  //     strokeOpacity: 0.0,
  //     strokeWeight: 0
  //   },
  //   markerOptions: {
  //     draggable: true
  //   }
  // });


});
