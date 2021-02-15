<template>
	<v-app>
	  <v-navigation-drawer app>
	  	Jotai
	    <!-- -->
	  </v-navigation-drawer>

	  <v-app-bar app>
	  	Ylä
	    <!-- -->
	  </v-app-bar>

	  <!-- Sizes your content based upon application components -->
	  <v-main>

	    <!-- Provides the application the proper gutter -->
	    <v-container fluid>
	    	I am the app!
	          <example></example>

	    	<v-btn
	  color="primary"
	  elevation="2"
	>Paina mua</v-btn>

	    </v-container>
	  </v-main>

	  <v-footer app>
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
