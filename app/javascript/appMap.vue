<template>
  <div id="map">
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  props: ["places"],
  data: function () {
    return {
      message: 'nothing'
    }
  },
  mounted() {
    var map = new GMaps({
      div: '#map',
      lat: 38.5816,
      lng: -121.4944
    });
       window.map = map;

    var transactions = JSON.parse(this.places);
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
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
