require 'sidekiq/web'

Rails.application.routes.draw do
  
  resources :jobs
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  mount SimpleDiscussion::Engine => "/forum"
  post 'intents', to: "jobs#intents"


  Rails.application.routes.draw do
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }
  end

  get '/dashboard/:id', to: 'dashboard#dashboard', as: 'dashboard'


  root to: 'home#index'

end
