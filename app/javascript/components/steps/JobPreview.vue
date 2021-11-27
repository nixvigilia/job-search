<template>
  <div>
    <h1 class="font-black text-4xl">Preview</h1>

    <a
      @click.prevent="prev()"
      class="
        btn
        bg-transparent
        text-purple-600
        py-2
        px-4
        lg:mr-2
        btn-lg
        border border-purple-500
        hover:text-white hover:bg-purple-500 hover:border-transparent
      "
      >Back</a
    >
    <a
      @click.prevent="next()"
      class="
        btn
        text-white
        bg-indigo-600
        py-2
        px-4
        hover:bg-indigo-500
        lg:mr-2
        border border-indigo-500
        btn-lg
      "
      >Next</a
    >
  </div>
</template>
<script>
export default {
  methods: {
    next() {
      this.$emit("nextStep");
    },

    prev() {
      this.$emit("prevStep");
    },
  },
};
</script>
<style lang=""></style>
