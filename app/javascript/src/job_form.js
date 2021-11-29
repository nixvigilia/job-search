import Vue from "vue";
import { store, actions } from "../store";
import ky from "ky";
import TurbolinksAdapter from "vue-turbolinks";
import { getMetaValue } from "helpers";
import VuePluralize from "vue-pluralize";
Vue.use(TurbolinksAdapter);
Vue.use(VuePluralize);

Vue.prototype.$store = store;
Vue.prototype.$actions = actions;

Vue.prototype.$http = ky.extend({
  hooks: {
    beforeRequest: [
      (request) => {
        request.headers.set("X-CSRF-Token", getMetaValue("csrf-token"));
      },
    ],
  },
  retry: 0,
});
