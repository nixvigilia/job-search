<template>
  <div>
    <NavBarItem
      ref="root"
      type="block"
      :has-divider="hasDivider"
      :active="isDropdownActive"
      dropdown
      class="dropdown"
      @click="toggle()"
    >
      <a
        class="
          flex
          items-center
          py-2
          px-3
          bg-gray-100
          dark:bg-gray-800
          lg:bg-transparent lg:dark:bg-transparent
        "
      >
        <slot />
        <!-- <Icon
          :path="toggleDropdownIcon"
          class="hidden lg:inline-flex transition-colors"
        /> -->
      </a>
      <div
        class="
          text-sm
          border-gray-100 border-b
          lg:border-b-0
          lg:border-gray-200
          lg:border-t
          lg:bg-white
          lg:absolute
          lg:top-full
          lg:left-0
          lg:min-w-full
          lg:z-20
          lg:shadow-md
          lg:rounded-b
          lg:dark:bg-gray-800
          dark:border-gray-700
        "
        :class="{ 'lg:hidden': !isDropdownActive }"
      >
        <slot name="dropdown" />
      </div>
    </NavBarItem>
  </div>
</template>
<script>
import { mdiChevronUp, mdiChevronDown } from "@mdi/js";
import NavBarItem from "./NavBarItem";
// import Icon from "./Icon";

export default {
  data() {
    return {
      isDropdownActive: false,
      root: null,
    };
  },
  components: {
    NavBarItem,
    // Icon,
  },
  props: {
    hasDivider: {
      type: Boolean,
      default: false,
    },
  },
  method: {
    toggle() {
      alert("ok");
      // this.isDropdownActive.value = !this.isDropdownActive.value;
    },
    forceClose(event) {
      if (!this.root.value.$el.contains(event.target)) {
        this.isDropdownActive.value = false;
      }
    },
  },
  computed: {
    toggleDropdownIcon() {
      this.isDropdownActive.value ? mdiChevronUp : mdiChevronDown;
    },
  },
  mounted() {
    window.addEventListener("click", this.forceClose);
  },
  beforeUnmount() {
    window.removeEventListener("click", this.forceClose);
  },
};
</script>
