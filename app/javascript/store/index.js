import Vue from "vue";
import axios from "axios";
import { getMetaValue } from "helpers";
import { darkModeKey } from "config.js";

axios.defaults.headers.post["Content-Type"] =
  "application/x-www-form-urlencoded";
axios.defaults.headers.post["X-CSRF-Token"] = getMetaValue("csrf-token");

export const store = Vue.observable({
  form: {
    step: 1,
    job: {
      cardName: null,
      companyName: null,
      companyWebsite: null,
      companyLogo: null,
      companyDescription: null,
      companyEmail: null,
      compensationRange: "50,000 - 60,000",
      compensationType: "Full-time",
      estimatedHours: null,
      headquarters: "Philippines",
      linkToApply: null,
      price: 199,
      basePrice: 199,
      remote: "Yes",
      jobTitle: null,
      yearsOfExperience: null,
      upsellType: "No, thanks",
    },
    paymentIntentClientSecret: null,
    upsellPricing: {
      good: 49,
      better: 69,
      great: 149,
    },
  },
  showPaymentButton: true,
  formInvalid: false,
});

export const actions = {
  updateForm(input, value) {
    store.form.job[input] = value;

    let storedForm = this.openStorage();
    if (!storedForm) storedForm = {};

    storedForm[input] = value;
    this.saveStorage(storedForm);
  },

  openStorage() {
    return JSON.parse(localStorage.getItem("form"));
  },

  saveStorage(form) {
    localStorage.setItem("form", JSON.stringify(form));
  },

  formattedPrice() {
    return new Intl.NumberFormat("en-EN", {
      style: "currency",
      currency: "PHP",
    }).format(store.form.job.price);
  },

  handleBoolean(input, value) {
    if (input === value) {
      return true;
    } else {
      return false;
    }
  },

  handlePurchase(stripeResult) {
    let newJobForm = document.getElementById("newJob");
    let formData = new FormData(newJobForm);
    const job = store.form.job;

    if (job.companyLogo) {
      formData.append("job[company_logo]", job.companyLogo);
    }

    formData.append("job[company_email]", job.companyEmail);
    formData.append("job[company_name]", job.companyName);
    formData.append("job[company_website]", job.companyWebsite);
    formData.append("job[company_description]", job.companyDescription);
    formData.append("job[compensation_range]", job.compensationRange);
    formData.append("job[compensation_type]", job.compensationType);
    formData.append("job[description]", job.jobDescription);
    formData.append("job[estimated_hours]", job.estimatedHours);
    // formData.append("featured_until", job.featuredUntil);
    formData.append("job[headquarters]", job.headquarters);
    // formData.append("link_to_apply", job.linkToApply);
    formData.append("job[title]", job.jobTitle);
    formData.append("job[years_of_experience]", job.yearsOfExperience);
    formData.append("job[upsell_type]", job.upsellType);
    // formData.append("remote", actions.handleBoolean(job.remote, "Yes"));
    formData.append("job[price]", job.price);

    // checking form data entries
    // for (var pair of formData.entries()) {
    //   console.log(pair[0] + ", " + pair[1]);
    // }

    axios({
      url: "/jobs",
      method: "POST",
      data: formData,
    })
      .then((response) => {
        if (response.status === 200) {
          // console.log(response);
          window.location = response.data.redirect_url;
        }
      })
      .catch((errors) => {
        // @job.errors TODO: Render in view
        console.log(errors);
      });
  },
};

export const dashboard = Vue.observable({
  state: {
    /* User */
    step: 9,
    userName: null,
    userEmail: null,
    userAvatar: null,

    /* fullScreen - fullscreen form layout (e.g. login page) */

    isFullScreen: false,

    /* Aside */
    isAsideMobileExpanded: false,
    isAsideLgActive: false,

    /* Dark mode */
    darkMode: false,

    /* Field focus with ctrl+k (to register only once) */
    isFieldFocusRegistered: false,

    /* Sample data (commonly used) */
    clients: [],
    history: [],
  },
});
