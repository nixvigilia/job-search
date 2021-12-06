<template>
  <div>
    <label for="title" class="label">Title</label>
    <span class="required"></span>
    <input
      type="text"
      id="title"
      placeholder="Enter a job title"
      class="input"
      required
      @input="handleTitleInput($event.target.value)"
      v-model.trim="jobTitle"
    />
    <div v-if="$v.jobTitle.$error" class="text-sm text-red-500">
      A title is required
    </div>
    <div v-if="!$v.jobTitle.minLength" class="text-sm text-red-500">
      Title must have at least
      {{ $v.jobTitle.$params.minLength.min }} characters.
    </div>
  </div>
</template>

<script>
import { required, minLength } from "vuelidate/lib/validators";

export default {
  data() {
    return {
      jobTitle: this.$store.form.job.jobTitle,
    };
  },
  validations: {
    jobTitle: {
      required,
      minLength: minLength(4),
    },
  },
  methods: {
    handleTitleInput(value) {
      this.$actions.updateForm("jobTitle", value);
    },
  },
};
</script>
