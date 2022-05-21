Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :members, param: :slug do
    resources :attachments, only: %i[new create] do
      member do
        post :download
      end
    end
  end

  root to: 'members#index'
end
