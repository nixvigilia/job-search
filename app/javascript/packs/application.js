// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import TurbolinksAdapter from "vue-turbolinks";
import Vue from "vue/dist/vue.esm";
import Vuex from "vuex";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
require("trix");
require("@rails/actiontext");

import "controllers";
import "src/job_form";
import "stylesheets/application";

Vue.use(TurbolinksAdapter);
Vue.use(Vuex);

document.addEventListener("turbolinks:load", () => {
  //   const checkbox = new Vue({
  //     el: '[data-behavior="vue"]',
  //   });
});
