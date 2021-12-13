<template>
  <div class="relative inline-block">
    <img
      class="object-cover rounded-full"
      :src="$store.form.job.companyLogo"
      :class="{ 'mt-2 w-32 h-32': !!$store.form.job.companyLogo }"
      id="companyLogo"
    />
    <div v-if="error" class="mb-1 text-sm text-red-500">{{ error }}</div>
    <div v-if="!$store.form.job.companyLogo">
      <label class="file-select">
        <div class="inline-block select-button btn btn-default">
          <span>Select file</span>
        </div>
        <input
          type="file"
          ref="inputFile"
          @change="handleFileChange"
          name="companyLogo"
        />
      </label>
    </div>
    <button-remove v-else @buttonRemoveClicked="removeImage"></button-remove>
  </div>
</template>
<script>
import ButtonRemove from "../ButtonRemove";

export default {
  components: {
    ButtonRemove,
  },
  data() {
    return {
      companyLogo: "",
      error: "",
      inputPicture: null,
    };
  },
  methods: {
    handleFileChange(e) {
      this.$emit("input", e.target.files[0]);
      let files = e.target.files || e.dataTransfer.files;
      let imageTypes = ["image/gif", "image/png", "image/jpeg", "image/jpg"];

      if (!files.length) {
        return;
      }

      if (files[0].size > 200000) {
        this.error = "Please choose a file smaller in 2mb size";
        return;
      }

      if (!imageTypes.includes(files[0].type)) {
        this.error = "Please try a different image format";
        return;
      }

      this.createImage(files[0]);
    },
    createImage(file) {
      const reader = new FileReader();
      // const vm = this;

      reader.onload = (e) => {
        this.$store.form.job.companyLogo = e.target.result;
        this.$actions.updateForm("companyLogo", e.target.result);
      };

      reader.readAsDataURL(file);
    },

    removeImage() {
      this.$store.form.job.companyLogo = null;
      this.$actions.updateForm("companyLogo", null);
    },
  },
};
</script>

<style lang="scss" scoped>
.file-select > input[type="file"] {
  @apply hidden;
}
</style>
