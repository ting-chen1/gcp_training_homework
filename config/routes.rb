Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :members, except: :show

  root to: 'members#index'
end
