<template>
  <div>
    <label for="headquarters" class="label">Headquarters</label>
    <span class="required"></span>
    <input
      type="text"
      id="headquarters"
      placeholder="Office location"
      class="input"
      required
      @input="handleTitleInput($event.target.value)"
      v-model.trim="headquarters"
    />
    <div v-if="$v.headquarters.$error" class="text-sm text-red-500">
      location is required
    </div>
  </div>
</template>

<script>
import { required, minLength } from "vuelidate/lib/validators";

export default {
  data() {
    return {
      headquarters: this.$store.form.job.headquarters,
    };
  },
  validations: {
    headquarters: {
      required,
    },
  },
  methods: {
    handleTitleInput(value) {
      this.$actions.updateForm("headquarters", value);
    },
  },
};
</script>
