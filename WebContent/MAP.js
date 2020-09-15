function initMap() {
	
  let map = new google.maps.Map(document.getElementById('map'), {
    zoom: 8,
    center: {lat: 37, lng: 127 }
  });
  
  let marker = new google.maps.Marker({
    position:{lat: 37, lng: 127 },
    map: map,
    draggable:true
});
  
  google.maps.event.addListener(marker, 'click', function() { 
  event.latLng=marker.getPosition();
  let infowindow = new google.maps.InfoWindow( 
  		     { content: "latLng: " + event.latLng , 
  		       size: new google.maps.Size(100,100) 
  		     })
  infowindow.close(map, marker);
  infowindow.open(map, marker);});

$.getJSON('t.json', function(data) {
    $.each(data, function(entryIndex, entry) {
  	  let latLng=new google.maps.LatLng(entry.lat,entry.lng);
  	  let image='http://maps.google.com/mapfiles/ms/icons/blue-dot.png'
  	  let marker2 = new google.maps.Marker({
            position : latLng,
            map : map,
            icon : image,
            label: entry.id
        });
  	  
  	 google.maps.event.addListener(marker2, 'click', function() { 
  		  let infowindow = new google.maps.InfoWindow( 
  		  		     { content: "post: " + entry.post , 
  		  		       size: new google.maps.Size(100,100) 
  		  		     })
  		  infowindow.close(map, marker2);
  		  infowindow.open(map, marker2);});
    });
});
marker2.setMap(map);
}

 window.onload = function(){
	 
let $ = function(id) { return document.getElementById(id);};
$("Write").onclick=function(){
	location.href="./sum_edi.jsp";
}
$("logout").onclick=function(){
    location.href="./lgout.jsp";
}

$("Recommand").onclick=function(){
    location.href="./list.jsp"
    	}
}
