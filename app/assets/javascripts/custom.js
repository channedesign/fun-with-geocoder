jQuery(function() {
	var lat_field, lng_field;
	lat_field = $('#place_latitude');
	lng_field = $("#place_longitude");
	window.initMap = function() {
	  var map;
	  if ($('#map').size() >= 0) {
	    map = new google.maps.Map(document.getElementById('map'), {
	      center: {
	        lat: -34.397,
	        lng: 150.644
	      },
	      zoom: 8
	    });
	    map.addListener('click', function(e) {
	    	updateFields(e.latlng)
	    });
	  }
	}

	function updateFields(latlng) {
		lat_field.val(latlng.lat());
		lng_field.val(latlng.lat());
	}

});