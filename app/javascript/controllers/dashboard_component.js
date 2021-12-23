import { Controller } from "stimulus";
import Vue from "vue/dist/vue.esm";

const DashboardComponent = (component) =>
  class extends Controller {
    static targets = ["dashboard"];

    connect() {
      const el = this.dashboardTarget;

      this.vue = new Vue({
        el,
        render: (h) => h(component),
        // data: store,
      });
    }
  };

export default DashboardComponent;
