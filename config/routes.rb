Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :addresses
  resources :search do
    collection do
      get 'addresses', to: :addresses
    end
  end
end
