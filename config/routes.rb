Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :districts, only: [:index] do
    resources :subscriptions, only: [:index, :new, :create, :destroy], shallow: true
    resources :customers, only: [:index, :new, :create]
  end
  resources :newspapers, only: [:index]
  resources :subscriptions, only: [] do
    member do
      post :change_status
      post :order_up
      post :order_down
    end
  end

  root to: 'districts#index'
end