module.exports = {
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter"],
      },
    },
  },
  variants: {},
  plugins: [require("@tailwindcss/typography"), require("@tailwindcss/forms")],
};
