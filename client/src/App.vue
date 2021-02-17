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
							thing_name="sourcetext"
							@select="selectItem('sourcetext_id', $event)"
						></thing-selector>

						<thing-selector v-if="recipes != null"
							:thing_list="recipes"
							thing_name="recipe"
							@select="selectItem('recipe_id', $event)"
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
      	sourcetext_id: null,
      	recipe_id: null
      }
    }
  },
  mounted: function() {
  	setTimeout(function(){ 
	this.getAndAssign("/sourcetext", "sourcetexts")
	this.getAndAssign("/recipe", "recipes")

  }.bind(this), 2000);

  },
  methods: {
  	  getAndAssign(url, thekey) {
	  	axios.get(url).then(function(resp) { 
	  		this[thekey] = resp.data;
	  	}.bind(this))
  	  },
	  selectItem(itemtype, ind) {
	  	this.selected[itemtype] = ind;
	  },
  },
}
</script>

<style>
.example {
  color: red;
}
</style>
