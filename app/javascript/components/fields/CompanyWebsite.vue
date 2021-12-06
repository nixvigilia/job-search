<template>
  <div>
    <label for="company-website" class="label">Company website</label>
    <span class="required"></span>
    <input
      type="text"
      id="company-website"
      placeholder="www.companywebsite.com"
      class="input"
      required
      v-model.trim="companyWebsite"
      @input="$actions.updateForm('companyWebsite', $event.target.value)"
    />

    <div v-if="$v.companyWebsite.$error" class="text-sm text-red-500">
      A website is required
    </div>
    <div v-if="!$v.companyWebsite.url" class="text-sm text-red-500">
      A valid URL is required
    </div>
  </div>
</template>

<script>
import { url, required } from "vuelidate/lib/validators";

export default {
  data() {
    return {
      companyWebsite: this.$store.form.job.companyWebsite,
    };
  },
  validations: {
    companyWebsite: {
      url,
      required,
    },
  },
};
</script>
