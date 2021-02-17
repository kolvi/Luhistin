<template>
  <div>
    <v-card outlined
      class="mx-auto ma-8"
      max-width="90%">
      <v-card-title>Selected {{thing_name}}</v-card-title>
<!--
      <v-card-subtitle>Click {{thing_name}} to select it</v-card-subtitle>
-->
      <v-card-text>
          <v-expansion-panels v-model="panel_status" v-if="thing_list != null">
          <v-expansion-panel>
            <v-expansion-panel-header>
              {{selected_thing_name}}
<!--
              {{thing_list[selected_in_list].name}}
-->
            </v-expansion-panel-header>
            <v-expansion-panel-content>
            <v-list dense>
<!--
              <v-subheader>thing_list</v-subheader>
            -->
              <v-list-item-group v-model="selected_in_list" color="primary">

                <v-list-item
                v-for="(thing, t_ind) in thing_list"
                :key="thing.id"
                @click="select_thing(thing.id)"
                >
                  <v-list-item-content>
                   <v-list-item-title v-text="thing.name"/></v-list-item-content>

                </v-list-item>
              </v-list-item-group>
              </v-list>
                <v-btn
                  color="red"
                  fab dark small
                  absolute right bottom
                  @click="create_thing"
                ><v-icon>mdi-plus</v-icon>
              </v-btn>
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>

        <template v-if="panel_status === undefined">
          <span class="rename_delete" @click="rename_thing">Rename</span>
          <span class="rename_delete" @click="delete_thing">Delete</span>
        </template>

      </v-card-text>
  </v-card>
  </div>
</template>
<script>
// Import other components using a relative path, e.g.
//
// import SecretSauce from './secret-sauce.vue'
// 
// or specific third-party modules installed via npm (and listed in
// the dependencies list in package.json), e.g.
//
// import _ from 'lodash'
//

module.exports = {
  props: ['thing_list', 'selection', 'thing_name'],
  data: function(){
    return {
      panel_status: undefined,
      dialog_status: false,
      selected_in_list: undefined,
//      id: null
    }
  },
  created() {
    //this.update_selection();
    this.initial_selection();
  },
  methods: {
    create_thing() {
      this.$emit("add");
    },
    rename_thing() {
      this.$emit("rename", this.selected_in_list);
    },
    delete_thing(item) {
      this.$emit("delete", this.selected_in_list);
    },
    select_thing(item) {
      console.log("Selecting thing " + item);
      this.panel_status = undefined;
      this.$emit("select", item);
    },
    update_selection() {
      if (this.selected_in_list !== this.selection)
        this.selected_in_list = this.selection;
    },
    initial_selection() {
      // TODO: Let pick initial selection
      if (this.thing_list.length > 0) {
        this.selected_in_list = 0;
        this.$emit("select", this.thing_list[0].id)
      }
    }
  },
  computed: {
    selected_thing(){
      if (this.thing_list !== undefined && this.selected_in_list !== undefined)
        return this.thing_list[this.selected_in_list];
      else return undefined;
    },
    selected_thing_name(){
      return (this.selected_thing ? this.selected_thing.name : "");
    }
  },
  watch: {
/*    selection(value) {
      console.log("sel = " + this.selection);
      this.update_selection();
    },*/
    selected_in_list(value) {
      console.log("sil = " + this.selected_in_list);
    },
    thing_list: function(newVal, oldVal){
      console.log("thing list updated")
    }
  },
  
  // If you reference other components, then you must also list them
  // in the components map. e.g:
  //
  // components: {
  //   SecretSauce
  // }
}
</script>


<style lang="css">
  .rename_delete {
    color: #88f; padding: 0.5em; cursor: pointer;
  }
</style>
