Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :users do
    resources :groups do
      resources :entities
    end
  end

  root "users#index"
end
