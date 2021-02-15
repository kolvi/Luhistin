<template>
	<v-app>
<!--
	  TODO: Remove?
	  <v-navigation-drawer app>
	  </v-navigation-drawer>
-->
	  <v-app-bar app>
	      <v-app-bar-nav-icon></v-app-bar-nav-icon>
	      <v-toolbar-title>Luhistin</v-toolbar-title>
	  </v-app-bar>

	  <!-- Sizes your content based upon application components -->
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
       			    	</v-col>
				      <v-col cols="5" class="pa-8">
				      	Here be the result
				      </v-col>

       			    </v-row>
	 	        </v-tab-item>
	 	        <v-tab-item>
	 	        	Old processings here!
	 	        </v-tab-item>
			</v-tabs>
<!--
          <example></example>
-->

	    </v-container>
	  </v-main>

	  <v-footer app>
	  	Something in the fotter
	    <!-- -->
	  </v-footer>

	</v-app>

</template>

<script>
export default {
  data () {
    return {
      msg: 'I am the app!'
    }
  }
}
</script>

<style>
.example {
  color: red;
}
</style>
