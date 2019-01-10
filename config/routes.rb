Rails.application.routes.draw do
  root 'sessions#new'

  # root to: 'kblos#index'

  resources :kblos do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
