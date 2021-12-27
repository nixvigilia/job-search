import { store } from "../store";
import { Controller } from "stimulus";
import Vue from "vue";

const DashboardComponent = (component) =>
  class extends Controller {
    static targets = ["dashboard"];

    connect() {
      const el = this.dashboardTarget;

      new Vue({
        el,
        render: (h) => h(component),
        data: store,
      });
    }
  };

export default DashboardComponent;
