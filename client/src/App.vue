<template>
	<v-app>
	  <v-app-bar flat app>
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
       			    	<v-col cols="3">

						<thing-selector v-if="sourcetexts != null"
							:thing_list="sourcetexts"
							:selection="selected.sourcetext"
							thing_name="sourcetext"
							@select="selectSourcetext"
						></thing-selector>

						<thing-selector v-if="recipes != null"
							:thing_list="recipes"
							:selection="selected.recipe"
							thing_name="recipe"
						></thing-selector>

       			    	</v-col>
       			    	<v-col cols="4">
						  <v-card-title>List of steps</v-card-title>
						  <v-card-subtitle>Click step to edit it</v-card-subtitle>
						  TODO: STEPS EDITOR 
       			    	</v-col>
				      <v-col cols="5" class="pa-8">
						  TODO: RESULT DISPLAYER
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
      recipes: null,

      selected: {
      	sourcetext: 0,
      	recipe: 0
      }
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
	  },
	  selectSourcetext(ind) { this.selected.sourcetext = ind; },
	  selectRecipe(ind) { this.selected.recipe = ind; },
  },
}
</script>

<style>
.example {
  color: red;
}
</style>
