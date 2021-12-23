# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

# job-search

- install gems and follow instructions
- scaffold Job
- bin/rails action_text:install
- bundle exec rails webpacker:install:stimulus
- bundle exec rails webpacker:install:vue
- initializers/content_security_policy.rb

```ruby
Rails.application.config.content_security_policy do |policy|
    if Rails.env.development?
        policy.script_src :self, :https, :unsafe_eval
    else
        policy.script_src :self, :https
    end
end
```

# job_ui

- yarn add @tailwindcss/typography

```js
// tailwind.config.js
module.exports = {
  theme: {
    // ...
  },
  plugins: [
    require("@tailwindcss/typography"),
    // ...
  ],
};
```

- yarn add ky vue-turbolinks
- yarn add vue-trix
- yarn add vue-pluralize

# Stripe

<!-- new -->

- rails credentials:edit --environment=development

<!-- code -->

- EDITOR="mate --wait" bin/rails credentials:edit --environment=development

- EDITOR="code --wait" bin/rails credentials:edit --environment=development

- yarn add axios
- yarn add vuelidate

- rails g migration add_company_email_to_jobs company_email:string

- gem 'active_storage_base64'

- yarn add @tailwindcss/forms

```js
// tailwind.config.js
module.exports = {
  theme: {
    // ...
  },
  plugins: [
    require("@tailwindcss/typography"),
    require("@tailwindcss/forms"),
    // ...
  ],
};
```

- yarn add mdi-vue @mdi/js
