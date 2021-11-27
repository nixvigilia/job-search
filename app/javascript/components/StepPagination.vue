<template lang="">
  <div
    class="
      max-x-4xl
      mb-4
      mx-auto
      pt-3
      bg-white
      border
      rounded-t-lg
      shadow-sm
      lg:pt-6
    "
  >
    <div class="grid grid-cols-1 lg:grid-cols-12">
      <div
        class="
          lg:col-span-4
          px-2
          pb-2
          border-b-4 border-transparent
          lg:pt-2 lg:px-4 lg:pb-4
        "
        :class="{ 'border-indigo-500': $store.form.step === 1 }"
      >
        <p class="text-xs text-gray-600 uppercase lg:text-sm">Step 1</p>
        <h3
          :class="{ 'text-indigo-600': $store.form.step === 1 }"
          class="text-sm font-black lg:text-xl"
        >
          Job Details
        </h3>
      </div>
      <div
        class="
          lg:col-span-4
          px-2
          pb-2
          border-b-4 border-transparent
          lg:pt-2 lg:px-4 lg:pb-4
        "
        :class="{ 'border-indigo-500': $store.form.step === 2 }"
      >
        <p class="text-xs text-gray-600 uppercase lg:text-sm">Step 2</p>
        <h3
          :class="{ 'text-indigo-600': $store.form.step === 2 }"
          class="text-sm font-black lg:text-xl"
        >
          Preview
        </h3>
      </div>
      <div
        class="
          lg:col-span-4
          px-2
          pb-2
          border-b-4 border-transparent
          lg:pt-2 lg:px-4 lg:pb-4
        "
        :class="{ 'border-indigo-500': $store.form.step === 3 }"
      >
        <p class="text-xs text-gray-600 uppercase lg:text-sm">Step 3</p>
        <h3
          :class="{ 'text-indigo-600': $store.form.step === 3 }"
          class="text-sm font-black lg:text-xl"
        >
          Purchase
        </h3>
      </div>
    </div>
  </div>
</template>
