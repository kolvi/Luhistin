<template>
  <div>
    <v-card outlined
      class="mx-auto ma-8"
      max-width="90%">
      <v-card-title>Selected {{thing_name}}</v-card-title>
      <v-card-text>
          <v-expansion-panels v-model="panel_status" v-if="thing_list != null">
          <v-expansion-panel>
            <v-expansion-panel-header>
              {{selected_thing_name}}
            </v-expansion-panel-header>
            <v-expansion-panel-content>
            <v-list dense>
              <v-list-item-group v-model="locally_selected" color="primary">

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

const _ = require('lodash')

module.exports = {
  props: ['thing_list', 'currently_selected_id', 'thing_name'],
  data: function(){
    return {
      panel_status: undefined,
      dialog_status: false,
      locally_selected: undefined,
    }
  },
  created() {
    this.update_selection();

    //this.update_selection();
    //this.initial_selection();
  },
  methods: {
    create_thing() {
      this.$emit("add");
    },
    rename_thing() {
      this.$emit("rename", this.locally_selected);
    },
    delete_thing(item) {
      this.$emit("delete", this.locally_selected);
    },
    select_thing(item) {
      this.panel_status = undefined;
      this.$emit("select", item);
    },
    update_selection() {
      if (this.items_and_selection_exist) {
        const match = _.findIndex(this.thing_list, (thing) => (thing.id  == this.currently_selected_id) );

        if (match != -1)
          this.locally_selected = match
      }
    },
  },
  computed: {
    selected_thing(){
      if (this.thing_list != null && this.locally_selected !== undefined)
        return this.thing_list[this.locally_selected];
      else return undefined;
    },
    selected_thing_name(){
      return (this.selected_thing ? this.selected_thing.name : "")
    },
    items_and_selection_exist(){
      return (this.currently_selected_id && (this.thing_list.length > 0))
    }

  },
  watch: {
    currently_selected_id(newVal, oldVal) {
      this.update_selection();
    },
    locally_selected(newVal, oldVal) {
      // This stops the menu clearing itself if the current selection is selected again 
      if (newVal == undefined) this.locally_selected = oldVal   
    },
    thing_list: function(newVal, oldVal){
      this.update_selection();
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
