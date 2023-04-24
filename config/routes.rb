Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  
  resources :groups
    resources :entities
  devise_for :users
  

  authenticated :user do
   root 'groups#index', as: 'authenticated_root'
  end

  root 'static_pages#home'
end
