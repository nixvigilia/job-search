<template>
  <div>
    <label for="job-description" class="label">Job description</label>
    <span class="required"></span>
    <input id="jobDescriptionEditor" type="hidden" name="content" />
    <VueTrix
      placeholder="Enter more details about the role"
      inputId="jobDescriptionEditor"
      class="trixEditorStyle"
      v-model="$store.form.job.jobDescription"
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
      jobDescription: this.$store.form.job.jobDescription,
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
    handleTitleInput(value) {
      this.$actions.updateForm("jobDescription", value);
    },
  },
  components: {
    VueTrix,
  },
};
</script>
