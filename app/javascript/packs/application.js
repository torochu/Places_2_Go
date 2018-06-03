/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// console.log('Hello World from Webpacker')

// Vue-Turbolinks
// yarn add vue-turbolinks

// ERROR
// Module parse failed: Unexpected token(18: 2) You may need an appropriate loader to handle this file type.
// yarn upgrade vue-loader@14.2.2

// look for a directory inside javascript packs, and we would put an 
// index.js in there, and this require will basically load up that file 
// and execute it as well. All we have to do then is say: Let's make a 
// directory called



import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
require('./maps')

Vue.use(TurbolinksAdapter)
Vue.component('app', App)


document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '[data-behavior="vue"]',
  })
})