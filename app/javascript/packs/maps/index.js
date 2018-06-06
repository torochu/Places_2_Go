document.addEventListener("turbolinks:load", function () {

  var map = new GMaps({
    div: '#map',
    lat: 38.5816,
    lng: -121.4944
  });
  window.map = map;

  var transactions = JSON.parse(document.querySelector("#map").dataset.places);
  window.transactions = transactions;

  var bounds = new google.maps.LatLngBounds();

  transactions.forEach(function (transaction) {
    if (transaction.latitude && transaction.longitude) {
      var marker = map.addMarker({
        lat: transaction.latitude,
        lng: transaction.longitude,
        title: transaction.full_address,
        infoWindow: {
          content: `<p><a href='/transactions/${transaction.id}'>${transaction.full_address}</a></p>`
        }
      });

      bounds.extend(marker.position);
    }
  });

  map.fitBounds(bounds);
});