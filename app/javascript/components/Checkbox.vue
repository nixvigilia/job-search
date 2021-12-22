<template>
  <div>
    <!-- <input type="checkbox" value="10" v-model="additional" />
    <input type="checkbox" value="20" v-model="additional" /> -->
    <div class="form-check">
      <input
        class="
          form-check-input
          appearance-none
          h-4
          w-4
          border border-gray-300
          rounded-sm
          bg-white
          checked:bg-blue-600 checked:border-blue-600
          focus:outline-none
          transition
          duration-200
          mt-1
          align-top
          bg-no-repeat bg-center bg-contain
          float-left
          mr-2
          cursor-pointer
        "
        type="checkbox"
        name="user[job_seeker]"
        value="1"
        id="new_registration_job_seeker"
        v-model="additional_grouped"
        @change="uniqueCheck"
      />
      <label
        class="form-check-label inline-block text-gray-800"
        for="new_registration_job_seeker"
      >
        Job Seeker
      </label>
    </div>
    <div class="form-check">
      <input
        class="
          form-check-input
          appearance-none
          h-4
          w-4
          border border-gray-300
          rounded-sm
          bg-white
          checked:bg-blue-600 checked:border-blue-600
          focus:outline-none
          transition
          duration-200
          mt-1
          align-top
          bg-no-repeat bg-center bg-contain
          float-left
          mr-2
          cursor-pointer
        "
        type="checkbox"
        name="user[employer]"
        value="2"
        id="new_registration_employer"
        v-model="additional_grouped"
        @change="uniqueCheck"
      />
      <label
        class="form-check-label inline-block text-gray-800"
        for="new_registration_employer"
      >
        Employer
      </label>
    </div>

    <div class="mt-4">
      <button
        v-if="additional_grouped.length == 0"
        disabled
        class="
          group
          relative
          w-full
          flex
          justify-center
          py-2
          px-4
          border border-transparent
          text-sm
          font-medium
          rounded-md
          text-white
          bg-indigo-600
          opacity-50
        "
        type="submit"
      >
        <span class="absolute left-0 inset-y-0 flex items-center pl-3">
          <svg
            class="h-5 w-5 text-indigo-500"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 20 20"
            fill="currentColor"
            aria-hidden="true"
          >
            <path
              fill-rule="evenodd"
              d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z"
              clip-rule="evenodd"
            />
          </svg>
        </span>
        Sign up
      </button>
      <button
        v-else
        class="
          group
          relative
          w-full
          flex
          justify-center
          py-2
          px-4
          border border-transparent
          text-sm
          font-medium
          rounded-md
          text-white
          bg-indigo-600
          hover:bg-indigo-700
          focus:outline-none
          focus:ring-2
          focus:ring-offset-2
          focus:ring-indigo-500
        "
        type="submit"
      >
        <span class="absolute left-0 inset-y-0 flex items-center pl-3">
          <svg
            class="h-5 w-5 text-indigo-500 group-hover:text-indigo-400"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 20 20"
            fill="currentColor"
            aria-hidden="true"
          >
            <path
              fill-rule="evenodd"
              d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z"
              clip-rule="evenodd"
            />
          </svg>
        </span>
        Sign up
      </button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // additional: [],
      additional_grouped: [],
    };
  },
  // computed: {
  //   final() {
  //     return this.additional.concat(this.additional_grouped);
  //   },
  // },
  computed: {
    isDisabled() {
      console.log(true);
      return true;
    },
  },
  methods: {
    uniqueCheck(e) {
      let newUser = document.getElementById("new_user");
      let newUserForm = new FormData(newUser);
      this.additional_grouped = [];
      if (e.target.checked) {
        this.additional_grouped.push(e.target.value);
      }

      // for (var pair of newUserForm.entries()) {
      //   console.log(pair[0] + ", " + pair[1]);
      // }
    },
  },
};
</script>
