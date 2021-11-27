<template>
  <div>
    <label for="company-email" class="label">Company email</label>
    <span class="required"></span>
    <input
      type="email"
      id="company-email"
      placeholder="john@company.com"
      class="input"
      :value="$store.form.job.companyEmail"
      @input="$actions.updateForm('companyEmail', $event.target.value)"
      required
    />
    <p class="my-1 text-sm text-gray-500">
      Used for billing purposes only. Not publically displayed.
    </p>
  </div>
</template>
<script>
export default {};
</script>
