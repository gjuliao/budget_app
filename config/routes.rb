Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :users do
    resources :entities do
      resources :groups
    end
  end


  root "entities#index"
end
