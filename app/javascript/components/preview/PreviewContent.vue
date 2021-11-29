<template>
  <div class="lg:col-span-8 mb-10">
    <div class="lg:pr-6">
      <h1
        class="
          lg:text-4xl
          leading-tight
          text-3xl
          font-black
          text-indigo-600
          mb-4
        "
      >
        {{ $store.form.job.jobTitle }}
      </h1>

      <div v-if="$store.form.job.compensationType == 'Contract'">
        <p class="pb-2 mb-2 leading-tight text-gray-700">
          {{ $store.form.job.estimatedHours }} hours
        </p>
      </div>
      <div v-else>
        <p class="pb-2 mb-2 leading-tight text-gray-700">
          PHP{{ $store.form.job.compensationRange }}
          {{ $store.form.job.compensationType }}
          {{ $store.form.job.yearsOfExperience }}
          {{ "year" | pluralize(toNumber($store.form.job.yearsOfExperience)) }}
          of experience
        </p>
      </div>
      <div class="border-b pb-3 mb-3">
        <div class="float-left mr-2">
          <img
            v-if="$store.form.job.companyLogo"
            :src="companyImage"
            :alt="$store.form.job.companyName"
            class="w-5 flex-shrink-0"
          />
        </div>
        <div class="float-none">
          <p class="text-base text-gray-600">
            {{ $store.form.job.companyName }}
          </p>
        </div>
      </div>

      <h3 class="mb-2 text-xs font-bold tracking-wider text-gray-900 uppercase">
        About the role
      </h3>

      <div v-html="$store.form.job.jobDescription" class="mb-6"></div>

      <h3 class="mb-2 text-xs font-bold tracking-wider text-gray-900 uppercase">
        About the company
      </h3>

      <div v-html="$store.form.job.jobDescription" class="mb-6"></div>
      <a
        :href="$store.form.job.linkToApply"
        target="_blank"
        class="
          btn
          text-white
          bg-indigo-600
          py-2
          px-4
          hover:bg-indigo-500
          lg:mr-2
          border border-indigo-500
        "
        >Apply for this role</a
      >
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    companyImage() {
      return JSON.parse(localStorage.getItem("logoImage"));
    },
  },
  methods: {
    toNumber(num) {
      const years = Number(num);
      return years;
    },
  },
};
</script>
