<template>
  <div class="pt-8 pb-16">
    <step-pagination></step-pagination>

    <div
      class="
        relative
        max-w-5xl
        p-4
        mx-auto
        bg-white
        rounded
        shadow-sm
        mb-10
        border
      "
    >
      <div class="lg:p-10 p-2">
        <form @submit.prevent="submit" enctype="multipart/form-data">
          <div v-if="$store.form.step === 1">
            <JobInfo @nextStep="handleNextStep" />
          </div>

          <div v-if="$store.form.step === 2">
            <JobPreview @nextStep="handleNextStep" @prevStep="handlePrevStep" />
          </div>

          <div v-if="$store.form.step === 3">
            <JobPurchase @prevStep="handlePrevStep" />
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
// import rootData from "store";
import JobInfo from "./steps/JobInfo";
import JobPreview from "./steps/JobPreview";
import JobPurchase from "./steps/JobPurchase";
import StepPagination from "./StepPagination";

export default {
  components: {
    JobInfo,
    JobPreview,
    JobPurchase,
    StepPagination,
  },
  methods: {
    handleNextStep() {
      this.$store.form.step++;
    },
    handlePrevStep() {
      this.$store.form.step--;
    },
  },
};
</script>
