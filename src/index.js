import Vue from 'vue'
import Vuetify from 'vuetify'

/*
function component() {
  const element = document.createElement('div');
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');

  return element;
}
document.body.appendChild(component());
*/
//import 'vuetify/dist/vuetify.min.css'
Vue.use(Vuetify)

// Solve "Using runtime only etc" error:
// https://medium.com/@stefanledin/solve-the-you-are-using-the-runtime-only-build-of-vue-error-e675031f2c50

window.onload = function() {
	var app = new Vue({ 
	  el: '#app',
	  vuetify : new Vuetify(),
	  data: {
	    message: 'Helllllo Vue!'
	  }
	})
}

console.log("moikka vuan....")
