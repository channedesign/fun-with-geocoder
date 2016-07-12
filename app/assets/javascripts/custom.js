jQuery(function() {
	var lat_field, lng_field;
	var markersArray = [];
	lat_field = $('#place_latitude');
	lng_field = $("#place_longitude");
	window.initMap = function() {
	  var map;  
    map = new google.maps.Map(document.getElementById('map'), {
      center: {
        lat: -34.397,
        lng: 150.644
      },
      zoom: 8
    });
    map.addListener('click', function(e) {
    	placeMarkerToMap(e.latLng, map)
    	updateFields(e.latLng)
    }); 
	}

	function updateFields(latLng) {
		lat_field.val(latLng.lat());
		lng_field.val(latLng.lng());
	}

	function placeMarkerToMap(latLng, map) {
		var marker;
		while (markersArray.length) {
			console.log('yo')
			markersArray.pop().setMap(null);
		}
		marker = new google.maps.Marker({
	    map: map,
	    position: latLng
	  });
	  map.panTo(latLng);
	  markersArray.push(marker);
	}

});