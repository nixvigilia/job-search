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
import { required, minLength } from "vuelidate/lib/validators";

import VueTrix from "vue-trix";
export default {
  data() {
    return {
      validatedDescription: null,
    };
  },
  validations: {
    validatedDescription: {
      required,
      minLength: minLength(150),
    },
  },
  methods: {
    setDescription(value) {
      this.validatedDescription = value;
      this.$v.validatedDescription.$touch();
    },
  },
  components: {
    VueTrix,
  },
};
</script>
