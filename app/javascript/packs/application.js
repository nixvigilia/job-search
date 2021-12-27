import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import Vue from "vue";
import Vuex from "vuex";
import TurbolinksAdapter from "vue-turbolinks";
import VuePluralize from "vue-pluralize";
import Vuelidate from "vuelidate";
import "controllers";
import "src/data";
import "stylesheets/application";
import VueRouter from "vue-router";

Rails.start();
Turbolinks.start();
Vue.use(Vuex);
Vue.use(TurbolinksAdapter);
Vue.use(VuePluralize);
Vue.use(Vuelidate);
Vue.use(VueRouter);

ActiveStorage.start();
require("trix");
require("@rails/actiontext");

document.addEventListener("turbolinks:load", () => {});
