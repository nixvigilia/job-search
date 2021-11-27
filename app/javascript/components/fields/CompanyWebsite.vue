<template>
  <div>
    <label for="company-website" class="label">Company website</label>
    <span class="required"></span>
    <input
      type="text"
      :value="$store.form.job.companyWebsite"
      @input="$actions.updateForm('companyWebsite', $event.target.value)"
      id="company-website"
      placeholder="www.companywebsite.com"
      class="input"
      required
    />
  </div>
</template>
