<template>
  <div>
    <h3 class="mb-2 text-2xl font-black">About the job</h3>

    <div class="inline-flex mb-6">
      <p class="m-0 text-xs tracking-wide text-gray-600 uppercase">
        Required fields
      </p>
      <span class="mt-2 ml-1 required"></span>
    </div>

    <job-title :job="job" class="mb-6"></job-title>
    <apply-link :job="job" class="mb-6"></apply-link>
    <job-description :job="job" class="mb-6"></job-description>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-2 mb-6">
      <job-experience :job="job" class="lg:col-span-1"></job-experience>
      <job-remote :job="job" class="lg:col-span-1"></job-remote>
    </div>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-2 mb-6">
      <compensation-type :job="job" class="lg:col-span-1"></compensation-type>
      <estimated-hours
        v-if="jobType === 'Contract'"
        :job="job"
        class="lg:col-span-1"
      ></estimated-hours>
      <compensation-range
        v-else
        :job="job"
        class="lg:col-span-1"
      ></compensation-range>
    </div>

    <h3 class="mb-2 text-2xl font-black">About the company</h3>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-2 mb-6">
      <div class="lg:col-span-1">
        <p class="block w-full label">Company logo</p>
        <file-select v-model="job.companyLogo"></file-select>
        <p class="my-1 text-sm text-gray-500">
          While not required, we recommend adding a company logo to helpy your
          listing stand out.
        </p>
      </div>
      <company-website :job="job" class="lg:col-span-1"></company-website>
    </div>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-2 mb-6">
      <company-name :job="job" class="lg:col-span-1"></company-name>
      <company-email :job="job" class="lg:col-span-1"></company-email>
    </div>

    <company-description :job="job" class="mb-6"></company-description>

    <a
      @click.prevent="next()"
      class="
        btn
        text-white
        bg-indigo-600
        py-2
        px-4
        hover:bg-indigo-500
        lg:mr-2
        border border-indigo-500
        btn-lg
      "
      >Continue</a
    >
  </div>
</template>

<script>
import JobTitle from "../fields/JobTitle";
import ApplyLink from "../fields/ApplyLink";
import JobDescription from "../fields/JobDescription";
import JobExperience from "../fields/JobExperience";
import CompensationType from "../fields/CompensationType";
import CompensationRange from "../fields/CompensationRange";
import EstimatedHours from "../fields/EstimatedHours";
import JobRemote from "../fields/JobRemote";
import CompanyName from "../fields/CompanyName";
import CompanyEmail from "../fields/CompanyEmail";
import FileSelect from "../fields/FileSelect";
import CompanyWebsite from "../fields/CompanyWebsite";
import CompanyDescription from "../fields/CompanyDescription";

export default {
  components: {
    JobTitle,
    ApplyLink,
    JobDescription,
    JobExperience,
    CompensationType,
    EstimatedHours,
    CompensationRange,
    JobRemote,
    CompanyName,
    CompanyEmail,
    FileSelect,
    CompanyWebsite,
    CompanyDescription,
  },
  data() {
    return {
      jobType: "Full-time",
    };
  },
  props: {
    job: {
      type: Object,
      required: true,
    },
  },
  methods: {
    next() {
      this.$emit("nextStep");
    },
  },
};
</script>

<style lang=""></style>
