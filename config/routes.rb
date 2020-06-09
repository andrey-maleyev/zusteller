Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :districts, only: [:index] do
    resources :subscriptions, only: [:index]
    resources :customers, only: [:index, :new]
  end
  resources :newspapers, only: [:index]

  root to: 'districts#index'
end
