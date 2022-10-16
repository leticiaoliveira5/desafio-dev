Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :cnab_file, only: %i[show create destroy]
  namespace 'api' do
    namespace 'v1' do
      post :parse_cnab, controller: :cnab
    end
  end
end
