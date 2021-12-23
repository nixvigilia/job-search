import Vue from "vue";
import { store, actions, dashboard } from "../store";
import ky from "ky";
import { getMetaValue } from "helpers";
Vue.prototype.$store = store;
Vue.prototype.$actions = actions;
Vue.prototype.$dashboard = dashboard;

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
