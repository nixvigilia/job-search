<template>
  <div>
    <label for="company-description" class="label">Company description</label>
    <span class="required"></span>
    <VueTrix
      placeholder="Tell us about your company"
      v-model="$store.form.job.companyDescription"
      localStorage
    />
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
