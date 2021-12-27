<template>
  <div>
    <Icon :path="icon" class="transition-colors" />
    <span
      class="px-2 transition-colors"
      :class="{ 'lg:hidden': this.isDesktopIconOnly }"
      >{{ this.label }}</span
    >
  </div>
</template>
<script>
import Icon from "./Icon";

export default {
  props: {
    icon: {
      type: String,
      required: true,
    },
    label: {
      type: String,
      required: true,
    },
    isDesktopIconOnly: Boolean,
  },
  components: {
    Icon,
  },
};
</script>
