<template>
  <div>
    <h3 class="mb-2 text-2xl font-black">About the job</h3>

    <div class="inline-flex mb-6">
      <p class="m-0 text-xs tracking-wide text-gray-600 uppercase">
        Required fields
      </p>
      <span class="mt-2 ml-1 required"></span>
    </div>

    <JobTitle class="mb-6"></JobTitle>
    <ApplyLink class="mb-6"></ApplyLink>
    <JobDescription class="mb-6"></JobDescription>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-2 mb-6">
      <JobExperience class="lg:col-span-1"></JobExperience>
      <JobRemote class="lg:col-span-1"></JobRemote>
    </div>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-2 mb-6">
      <CompensationType class="lg:col-span-1"></CompensationType>
      <EstimatedHours
        v-if="$store.form.job.compensationType == 'Contract'"
        class="lg:col-span-1"
      ></EstimatedHours>
      <CompensationRange
        v-if="$store.form.job.compensationType == 'Full-time'"
        class="lg:col-span-1"
      ></CompensationRange>
    </div>

    <h3 class="mb-2 text-2xl font-black">About the company</h3>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-2 mb-6">
      <div class="lg:col-span-1">
        <p class="block w-full label">Company logo</p>
        <FileSelect></FileSelect>
        <p class="my-1 text-sm text-gray-500">
          While not required, we recommend adding a company logo to helpy your
          listing stand out.
        </p>
      </div>
      <CompanyWebsite class="lg:col-span-1"></CompanyWebsite>
    </div>

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-2 mb-6">
      <CompanyName class="lg:col-span-1"></CompanyName>
      <CompanyEmail class="lg:col-span-1"></CompanyEmail>
    </div>

    <Headquarters></Headquarters>

    <CompanyDescription class="mb-6"></CompanyDescription>

    <JobUpsells></JobUpsells>

    <div v-if="$actions.formattedPrice()">
      {{ $actions.formattedPrice() }}
    </div>

    <a
      @click="next()"
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
      :class="{ 'opacity-25 pointer-events-none': $store.formInvalid }"
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
import Headquarters from "../fields/Headquarters";
import JobUpsells from "../JobUpsells";

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
    JobUpsells,
    Headquarters,
  },
  methods: {
    next() {
      this.$emit("nextStep");
    },
  },
  mounted() {
    document.querySelector("form").addEventListener("input", () => {
      const childrenWithValidations = this.$children.filter((c) => c.$v);
      this.$store.formInvalid = childrenWithValidations.every(
        (child) => child.$v.$invalid == false
      );
    });
  },
  created() {
    const storedForm = this.$actions.openStorage();

    if (storedForm) {
      this.$store.form.job.jobTitle = storedForm.jobTitle;
      this.$store.form.job.companyWebsite = storedForm.companyWebsite;
      this.$store.form.job.companyName = storedForm.companyName;
      this.$store.form.job.companyLogo = storedForm.companyLogo;
      this.$store.form.job.companyDescription = storedForm.companyDescription;
      this.$store.form.job.companyEmail = storedForm.companyEmail;
      this.$store.form.job.compensationRange = storedForm.compensationRange;
      this.$store.form.job.compensationType = storedForm.compensationType;
      this.$store.form.job.jobDescription = storedForm.jobDescription;
      this.$store.form.job.estimatedHours = storedForm.estimatedHours;
      this.$store.form.job.headquarters = storedForm.headquarters;
      this.$store.form.job.linkToApply = storedForm.linkToApply;
      this.$store.form.job.price = storedForm.price;
      this.$store.form.job.remote = storedForm.remote;
      this.$store.form.job.yearsOfExperience = storedForm.yearsOfExperience;
      this.$store.form.job.upsellType = storedForm.upsellType;
    }
  },
};
</script>
