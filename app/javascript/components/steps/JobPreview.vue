<template>
  <div>
    <h1 class="font-black text-4xl">Preview</h1>

    <a @click.prevent="prev()" class="btn btn-default">Back</a>
    <a @click.prevent="next()" class="btn btn-default">Next</a>
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
