<template lang="">
  <div>
    <h1 class="font-black text-4xl">Preview</h1>

    <a @click.prevent="prev()" class="btn btn-default">Back</a>
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
