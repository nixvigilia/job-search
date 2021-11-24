<template lang="">
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
  </div>
</template>
<script>
export default {
  props: {
    job: {
      type: Object,
      required: true,
    },
  },
  methods: {
    prev() {
      this.$emit("prevStep");
    },
  },
};
</script>
<style lang=""></style>
