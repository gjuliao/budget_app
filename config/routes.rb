Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  
  resources :users 
    resources :groups
      resources :entities
  

  authenticated :user do
   root 'groups#index', as: 'authenticated_root'
  end

  root 'static_pages#home'
end
