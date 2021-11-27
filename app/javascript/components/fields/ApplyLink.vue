<template>
  <div>
    <label for="apply-link" class="label inline-block">Apply link</label>
    <span class="required"></span>
    <input
      type="text"
      id="apply-link"
      placeholder="www.companyname.com/apply"
      class="input"
      required
      :value="$store.form.job.linkToApply"
      @change="$actions.updateForm('linkToApply', $event.target.value)"
    />
  </div>
</template>
