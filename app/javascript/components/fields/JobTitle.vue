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
      :value="$store.form.job.jobTitle"
      @input="$actions.updateForm('jobTitle', $event.target.value)"
    />
  </div>
</template>
