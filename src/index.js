import Vue from 'vue'
import Vuetify from 'vuetify'
import example from './Example.vue'

//import 'vuetify/dist/vuetify.min.css'
Vue.use(Vuetify)
Vue.component('example', example)

// Solve "Using runtime only etc" error:
// https://medium.com/@stefanledin/solve-the-you-are-using-the-runtime-only-build-of-vue-error-e675031f2c50

window.onload = function() {
	var app = new Vue({ 
	  el: '#app',
	  vuetify : new Vuetify(),
	  data: {
	    message: 'Helllllo!'
	  }
	})
}

console.log("moikka vuan....")
