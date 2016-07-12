jQuery(function() {
	var lat_field, lng_field;
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
    	console.log(e.latLng)
    	updateFields(e.latLng)

    }); 
	}

	function updateFields(latLng) {
		lat_field.val(latLng.lat());
		lng_field.val(latLng.lng());
		
	}

});