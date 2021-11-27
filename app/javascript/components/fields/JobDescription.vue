<template>
  <div>
    <label for="job-description" class="label">Job description</label>
    <span class="required"></span>
    <VueTrix
      placeholder="Enter more details about the role"
      v-model="$store.form.job.jobDescription"
      input="test"
      localStorage
    >
    </VueTrix>
  </div>
</template>
<script>
import VueTrix from "vue-trix";

export default {
  components: {
    VueTrix,
  },
};
</script>
