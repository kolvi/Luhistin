<template>
	<v-app>
	  <v-app-bar app>
	      <v-app-bar-nav-icon></v-app-bar-nav-icon>
	      <v-toolbar-title>Luhistin</v-toolbar-title>
	  </v-app-bar>

	  <v-main>

	    <!-- Provides the application the proper gutter -->
	    <v-container fluid>
			<v-tabs align-with-title>
			    <v-tab>Process text</v-tab>
			    <v-tab>View old processings</v-tab>
	 	        <v-tab-item>
       			    <v-row no-gutters>
       			    	<v-col cols="3">Thing selectors
       			    	</v-col>
       			    	<v-col cols="4">Here you edit thing
       			    		{{sourcetexts}}
       			    	</v-col>
				      <v-col cols="5" class="pa-8">
				      	Here be the result
				      	{{recipes}}
				      </v-col>

       			    </v-row>
	 	        </v-tab-item>
	 	        <v-tab-item>
	 	        	Old processings here!
	 	        </v-tab-item>
			</v-tabs>
	    </v-container>
	  </v-main>

	</v-app>

</template>

<script>
var axios = require('axios')

export default {
  data () {
    return {
      sourcetexts: null,
      recipes: null
    }
  },
  mounted: function() {
  	this.getSourcetexts()
  	this.getRecipes()
  },
  methods: {
  	  getAndAssign(url, thekey) {
	  	axios.get(url).then(function(resp) { 
	  		this[thekey] = resp.data;
	  	}.bind(this))
  	  },
	  getSourcetexts() {
  		this.getAndAssign("/sourcetext", "sourcetexts")

	  },
	  getRecipes() {
  		this.getAndAssign("/recipe", "recipes")
	  }
  },
}
</script>

<style>
.example {
  color: red;
}
</style>
