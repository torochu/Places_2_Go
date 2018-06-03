console.log("maps！！！！")
var map;

window.addMarkers = function addMarkers() {
  var element = document.querySelector("#map");
  var places = window.places = JSON.parse(element.dataset.places);

  // map.removeMarkers();

  places.forEach(function (place) {
    if (place.latitude && place.longitude) {
      var marker = map.addMarker({
        lat: place.latitude,
        lng: place.longitude,
        title: place.full_address,
        infoWindow: {
          content: `<p><a href='/places/${place.id}'>${place.full_address}</a></p>`
        }
      });
    }
  });

  //setSafeBounds(element);
}


// var places = JSON.parse(document.querySelector("#map").dataset.places);
// window.places = places;



// places.forEach(function (place) {
//   if (place.latitude && place.longitude) {
//     map.addMarker({
//       lat: place.latitude,
//       lng: place.longitude,
//       title: place.full_address,
//       infoWindow: {
//         content: `<p><a href='/place/${place.id}'>${place.full_address}</a></p>`
//       }
//     });
//   }
// });



$(document).ready(function () {
//document.addEventListener('turbolinks:load', () => {
//document.addEventListener("turbolinks:load", function () {
  //  new GMaps({
//    div: '#map',
//    lat: -12.043333,
//    lng: -77.028333
//  });
  var map = new GMaps({
    div: '#map',
    lat: -12.043333,
    lng: -77.028333
  });
  
  window.map = map;

  // var markers = JSON.parse(document.querySelector("#map").dataset.places);
  // window.markers = markers;

  addMarkers();


});


