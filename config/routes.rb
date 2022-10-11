Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  post :parse_cnab, controller: :home
  resources :cnab_file, only: %i[show create destroy]
end
