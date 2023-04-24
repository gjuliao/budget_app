Rails.application.routes.draw do
  get 'static_pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :users do
    resources :groups do
      resources :entities
    end
  end

  authenticated :user do
   root 'groups#index', as: :authenticated_root
  end

  root 'static_pages#home'
end
