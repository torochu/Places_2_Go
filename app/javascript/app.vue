<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
// export default {
//   data: function () {
//     return {
//       message: "Hello Vue!"
//     }
//   }
// }

export default {
  props: ["message"],
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
