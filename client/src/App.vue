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
							:currently_selected_id="selected.sourcetext_id"
							@select="selectItem('sourcetext_id', $event)"
						></thing-selector>

						<thing-selector v-if="recipes != null"
							:thing_list="recipes"
							thing_name="recipe"
							:currently_selected_id="selected.recipe_id"
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
//  	setTimeout(function(){ 
	this.getItems("sourcetext", { initial_selection: "force" } )
	this.getItems("recipe", { initial_selection: "force" } )

	//this.getAndAssign("/sourcetext", "sourcetexts", { initial_selection: "sourcetext "} )
//	this.getAndAssign("/recipe", "recipes")

//  }.bind(this), 2000);

  },
  methods: {
  	  getItems(itemtype, params) {
  	  	params = params || {}
  	  	const url = `/${itemtype}`
  	  	const keyname = `${itemtype}s`  // todo: possibly set in params
  	  	const idname = `${itemtype}_id`  // todo: possibly set in params

	  	axios.get(url).then(function(resp) { 
	  		this[keyname] = resp.data
	  		if (this[keyname].length > 0) {
	  			const insel = params.initial_selection

	  			if (insel == "force" || (this.selected[idname] == null && insel == "if_null") ) {
	  				this.selected[idname] = this[keyname][0].id
	  			}
	  		}
	  	}.bind(this))
  	  },
  	  getAndAssign(url, thekey, params) {
	  	axios.get(url).then(function(resp) { 
	  		this[thekey] = resp.data
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
