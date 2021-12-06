<template>
  <div>
    <label for="company-email" class="label">Company email</label>
    <span class="required"></span>
    <input
      type="email"
      id="company-email"
      placeholder="john@company.com"
      class="input"
      required
      v-model.trim="companyEmail"
      @input="$actions.updateForm('companyEmail', $event.target.value)"
    />
    <p class="my-1 text-sm text-gray-500">
      Used for billing purposes only. Not publically displayed.
    </p>
    <div
      v-if="$v.companyEmail.$error || !$v.companyEmail.companyEmail"
      class="text-sm text-red-500"
    >
      We need a valid email.
    </div>
  </div>
</template>
<script>
import { required, email } from "vuelidate/lib/validators";

export default {
  data() {
    return {
      companyEmail: this.$store.form.job.companyEmail,
    };
  },
  validations: {
    companyEmail: {
      email,
      required,
    },
  },
};
</script>
