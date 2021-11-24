<template lang="">
  <button
    class="
      absolute
      top-0
      right-0
      flex
      items-center
      justify-center
      w-6
      h-6
      bg-red-500
      rounded-full
      hover:bg-red-600
      mt-2
      mr-2
    "
    @click.prevent="handleButtonRemoveClick($event.target)"
  >
    <svg
      class="w-4 h-4 fill-current text-white"
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
    >
      <title>close</title>
      <g>
        <path
          d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"
          fill="#212121"
        ></path>
      </g>
    </svg>
  </button>
</template>
<script>
export default {
  methods: {
    handleButtonRemoveClick(target) {
      this.$emit("buttonRemoveClicked", target);
    },
  },
};
</script>
<style lang=""></style>
