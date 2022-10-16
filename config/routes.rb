Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :cnab_file, only: %i[show create destroy]
end
