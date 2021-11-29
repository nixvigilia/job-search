<template>
  <div class="text-center lg:col-span-4">
    <div
      class="
        p-4
        sticky
        top-0
        p-6
        mt-6
        text-gray-700
        bg-white
        border border-black
        rounded-lg
        shadow-sm
      "
    >
      <div class="flex justify-center">
        <div class="text-center">
          <img
            v-if="logoImage"
            :src="logoImage"
            :alt="$store.form.job.companyName"
            class="flex-shrink-0 w-14"
          />
        </div>
      </div>

      <p>
        <a
          :href="$store.form.job.companyWebsite"
          target="_blank"
          class="text-base text-gray-600 hover:text-indigo-600"
          >{{ $store.form.job.companyName }}</a
        >
      </p>

      <p class="text-lg font-black text-gray-800 lg:px-4 leading-tight mb-2">
        {{ $store.form.job.jobTitle }}
      </p>

      <div v-if="$store.form.job.compensationType == 'Contract'">
        <p class="pb-3 mb-3 leading-tight text-gray-700">
          {{ $store.form.job.estimatedHours }} hours
        </p>
      </div>
      <div v-else>
        <p class="leading-tight text-gray-700">
          PHP{{ $store.form.job.compensationRange }}
        </p>
        <p class="leading-tight text-gray-700">
          {{ $store.form.job.compensationType }}
        </p>
        <p class="pb-2 mb-2 leading-tight text-gray-700">
          {{ $store.form.job.yearsOfExperience }}
          {{ "year" | pluralize(toNumber($store.form.job.yearsOfExperience)) }}
          of experience
        </p>
      </div>
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
    logoImage() {
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
