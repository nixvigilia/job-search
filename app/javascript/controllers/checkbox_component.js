// import { store } from "../store";
import { Controller } from "stimulus";
import Vue from "vue/dist/vue.esm";

const CheckboxComponent = (component) =>
  class extends Controller {
    // static targets = ["name", "output"];
    static targets = ["checkbox"];

    connect() {
      const el = this.checkboxTarget;

      this.vue = new Vue({
        el,
        render: (h) => h(component),
        // data: store,
      });
    }

    // greet() {
    //   this.outputTarget.textContent = `Hello, ${this.nameTarget.value}!`;
    // }
  };

export default CheckboxComponent;
