<template>
  <div>
    <label for="company-name" class="label">Company name</label>
    <span class="required"></span>
    <input
      type="text"
      id="company-name"
      placeholder="Enter company name"
      class="input"
      required
      :value="$store.form.job.companyName"
      @input="$actions.updateForm('companyName', $event.target.value)"
    />
  </div>
</template>
